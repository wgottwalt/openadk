# $Id$
#-
# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

ifneq ($(strip ${MASTER_SITES}),)
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
WRKINST?=		${WRKDIR}/fake-${ARCH}/root

ifeq ($(strip ${NO_CHECKSUM}),)
_CHECKSUM_COOKIE=	${WRKDIR}/.checksum_done
else
_CHECKSUM_COOKIE=
endif

post-extract:

ifeq ($(strip ${NO_DISTFILES}),1)
${WRKDIST}/.extract_done:
	rm -rf ${WRKDIST} ${WRKSRC} ${WRKBUILD}
	mkdir -p ${WRKDIR} ${WRKDIST}
	${MAKE} do-extract
	@${MAKE} post-extract
	touch $@

fetch refetch checksum do-extract:

__use_generic_patch_target:=42
else ifneq ($(strip ${DISTFILES}),)
include ${TOPDIR}/mk/fetch.mk

${WRKDIST}/.extract_done: ${_CHECKSUM_COOKIE}
ifeq (${_CHECKSUM_COOKIE},)
	rm -rf ${WRKDIST} ${WRKSRC} ${WRKBUILD}
endif
	${EXTRACT_CMD}
	@${MAKE} post-extract
	touch $@

__use_generic_patch_target:=42
else ifeq ($(strip ${_IN_PACKAGE}),1)
$(warning This package does not use the generic extraction and patch target; it's most likely to fail.)
endif

ifeq ($(strip ${__use_generic_patch_target}),42)
post-patch:
${WRKDIST}/.prepared: ${WRKDIST}/.extract_done
	[ ! -d ./patches ] || ${PREVENT_PATCH} ${PATCH} ${WRKDIST} ./patches \
	    '{patch-!(*.orig),*.patch}' $(MAKE_TRACE)
	[ ! -d ./extra ] || (cd extra; $(PREVENT_PATCH) cp -Rp . ${WRKDIST}/) \
		$(MAKE_TRACE)
	@${MAKE} post-patch $(MAKE_TRACE)
	touch $@
endif

update-patches:
	@test ! -d ${WRKDIR}.orig || rm -rf ${WRKDIR}.orig
	@test ! -d ${WRKDIR}.orig
ifeq ($(strip ${_IN_PACKAGE})$(strip ${_IN_CVTC}),1)
	@$(MAKE) -s V=0 patch WRKDIR=${WRKDIR}.orig PREVENT_PATCH=: NO_CHECKSUM=1
else
	@$(MAKE) -s V=0 prepare WRKDIR=${WRKDIR}.orig PREVENT_PATCH=: NO_CHECKSUM=1
endif
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
		cd patches && $${VISUAL:-$${EDITOR:-/usr/bin/vi}} $$toedit; \
	    fi; \
	    rm -rf ${WRKDIR}.orig; \
	    [[ $$toedit != FAIL ]]

.PHONY: update-patches
