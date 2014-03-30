# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

ifneq ($(strip ${PKG_SITES}),)
ifeq ($(strip ${DISTFILES}),)
DISTFILES:=		${PKG_NAME}-${PKG_VERSION}.tar.gz
endif
endif

# This is where all package operation is done in
WRKDIR?=		${WRKDIR_BASE}/w-${PKG_NAME}-${PKG_VERSION}-${PKG_RELEASE}
# This is where source code is extracted and patched
WRKDIST?=		${WRKDIR}/${PKG_NAME}-${PKG_VERSION}
# This is where the configure script is seeked (localed)
WRKSRC?=		${WRKDIST}
# This is where configure, make and make install (fake) run from
WRKBUILD?=		${WRKSRC}
# This is where make install (fake) writes to
WRKINST?=		${WRKDIR}/fake-${CPU_ARCH}/root

ifeq ($(strip ${NO_CHECKSUM}),)
_CHECKSUM_COOKIE=      ${WRKDIR}/.checksum_done
else
_CHECKSUM_COOKIE=
endif

post-extract:
ifeq ($(strip ${NO_DISTFILES}),1)
${WRKDIST}/.extract_done:
	rm -rf ${WRKDIST} ${WRKSRC} ${WRKBUILD}
	@mkdir -p ${WRKDIR} ${WRKDIST}
	${MAKE} do-extract
	@${MAKE} post-extract $(MAKE_TRACE)
	touch $@

fetch refetch checksum do-extract:

__use_generic_patch_target:=42
else ifneq ($(strip ${DISTFILES}),)
include ${TOPDIR}/mk/fetch.mk

${WRKDIST}/.extract_done: ${_CHECKSUM_COOKIE}
ifeq (${_CHECKSUM_COOKIE},)
	rm -rf ${WRKDIST} ${WRKSRC} ${WRKBUILD}
endif
ifeq ($(EXTRACT_OVERRIDE),1)
	${MAKE} do-extract
else
	PATH='${HOST_PATH}' ${EXTRACT_CMD}
endif
	@${MAKE} post-extract $(MAKE_TRACE)
	touch $@

__use_generic_patch_target:=42
else
include ${TOPDIR}/mk/fetch.mk
${WRKDIST}/.extract_done: ${_CHECKSUM_COOKIE}
	$(MAKE) fetch
ifeq (${_CHECKSUM_COOKIE},)
	rm -rf ${WRKDIST} ${WRKSRC} ${WRKBUILD}
endif
ifeq ($(EXTRACT_OVERRIDE),1)
	${MAKE} do-extract
else
	PATH='${HOST_PATH}' ${EXTRACT_CMD}
endif
	@${MAKE} post-extract $(MAKE_TRACE)
	touch $@
endif

ifeq ($(strip ${__use_generic_patch_target}),42)
post-patch:
${WRKDIST}/.prepared: ${WRKDIST}/.extract_done
	[ ! -d ./patches/${PKG_VERSION} ] || ${PREVENT_PATCH} ${PATCH} ${WRKDIST} ./patches/${PKG_VERSION} \
	    '{patch-!(*.orig),*.patch}' $(MAKE_TRACE)
	[ ! -d ./patches ] || ${PREVENT_PATCH} ${PATCH} ${WRKDIST} ./patches \
	    '{patch-!(*.orig),*.patch}' $(MAKE_TRACE)
	[ ! -d ./src ] || (cd src; $(PREVENT_PATCH) cp -Rp . ${WRKDIST}/) \
		$(MAKE_TRACE)
	@${MAKE} post-patch $(MAKE_TRACE)
	touch $@
endif

update-patches host-update-patches:
	@test ! -d ${WRKDIR}.orig || rm -rf ${WRKDIR}.orig
	@test ! -d ${WRKDIR}.orig
ifeq ($(strip ${_IN_PACKAGE})$(strip ${_IN_CVTC}),1)
	@$(MAKE) -s V=0 patch WRKDIR=${WRKDIR}.orig PREVENT_PATCH=: NO_CHECKSUM=1
else
	@$(MAKE) -s V=0 prepare WRKDIR=${WRKDIR}.orig PREVENT_PATCH=: NO_CHECKSUM=1
endif
	@-test ! -r ${WRKDIR}/.autoreconf_done || \
		(wrkdist=$(WRKDIST) dir=$${wrkdist#$(WRKDIR)}; \
		cd ${WRKDIR}.orig$${dir}; \
		env ${AUTOTOOL_ENV} autoreconf -if; \
		rm -rf ${WRKDIR}.orig$${dir}/autom4te.cache ) $(MAKE_TRACE)
	@# restore config.sub/config.guess
	@for i in $$(find ${WRKDIR} -name config.sub);do \
		if [ -f $$i.bak ];then \
			mv $$i.bak $$i; \
		fi;\
	done
	@for i in $$(find ${WRKDIR} -name config.guess);do \
		if [ -f $$i.bak ];then \
			mv $$i.bak $$i; \
		fi;\
	done
	@toedit=$$(WRKDIST='${WRKDIST}' CURDIR=$$(pwd) \
	    PATCH_LIST='patch-* *.patch' WRKDIR1='${WRKDIR}' \
	    ${BASH} ${TOPDIR}/scripts/update-patches); \
	    if [[ -n $$toedit && $$toedit != FAIL ]]; then \
		echo -n 'edit patches: '; read i; \
		cd patches && $${VISUAL:-$${EDITOR:-vi}} $$toedit; \
	    fi; \
	    rm -rf ${WRKDIR}.orig; \
	    [[ $$toedit != FAIL ]]

.PHONY: update-patches host-update-patches
