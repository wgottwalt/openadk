# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

all: build-all-pkgs

TCFLAGS:=		${TARGET_CFLAGS}
TCXXFLAGS:=		${TARGET_CFLAGS}
TCPPFLAGS:=		${TARGET_CPPFLAGS}
TLDFLAGS:=		${TARGET_LDFLAGS} -Wl,-rpath -Wl,/usr/lib \
			-Wl,-rpath-link -Wl,${STAGING_TARGET_DIR}/usr/lib \
			-L${STAGING_TARGET_DIR}/lib -L${STAGING_TARGET_DIR}/usr/lib
ifeq ($(ADK_STATIC),y)
TCFLAGS:=		${TARGET_CFLAGS} -static
TCXXFLAGS:=		${TARGET_CFLAGS} -static
TCPPFLAGS:=		${TARGET_CPPFLAGS} -static
TLDFLAGS:=		${TARGET_LDFLAGS} -Wl,-rpath -Wl,/usr/lib \
			-Wl,-rpath-link -Wl,${STAGING_TARGET_DIR}/usr/lib \
			-L${STAGING_TARGET_DIR}/lib -L${STAGING_TARGET_DIR}/usr/lib \
			-static
endif
ifeq ($(ADK_NATIVE),y)
TCFLAGS:=		$(TARGET_CFLAGS_ARCH) $(TARGET_DEBUGGING) -fwrapv
TCXXFLAGS:=		
TCPPFLAGS:=
TLDFLAGS:=
endif

ifeq ($(ADK_DEBUG),)
TCPPFLAGS+=		-DNDEBUG
endif

# does not change CONFIGURE_ARGS in minimal mode
ifeq ($(filter minimal,${CONFIG_STYLE}),)
ifneq ($(ADK_DEBUG),)
CONFIGURE_ARGS+=	--enable-debug
endif
endif

CONFIGURE_ENV+=		CONFIG_SHELL='$(strip ${SHELL})' \
			CFLAGS='$(strip ${TCFLAGS})' \
			CXXFLAGS='$(strip ${TCXXFLAGS})' \
			CPPFLAGS='$(strip ${TCPPFLAGS})' \
			LDFLAGS='$(strip ${TLDFLAGS})' \
			PKG_CONFIG_LIBDIR='${STAGING_TARGET_DIR}/usr/lib/pkgconfig'
ifeq ($(ADK_NATIVE),)
CONFIGURE_ENV+=		${TARGET_CONFIGURE_OPTS} \
			${HOST_CONFIGURE_OPTS} \
			ac_cv_func_realloc_0_nonnull=yes \
			ac_cv_func_malloc_0_nonnull=yes
endif

CONFIGURE_PROG?=	configure
MAKE_FILE?=		Makefile
# this is environment for 'make all' and 'make install'
MAKE_ENV?=
# this is arguments for 'make all' and 'make install'
XAKE_FLAGS?=
# this is arguments for 'make all' ONLY
MAKE_FLAGS?=
# this is arguments for 'make install' ONLY
FAKE_FLAGS?=
ALL_TARGET?=		all
INSTALL_TARGET?=	install

MAKE_ENV+=		WRKDIR='${WRKDIR}' WRKDIST='${WRKDIST}' \
			WRKSRC='${WRKSRC}' WRKBUILD='${WRKBUILD}' \
			CFLAGS='$(strip ${TCFLAGS})' \
			CXXFLAGS='$(strip ${TCXXFLAGS})' \
			CPPFLAGS='$(strip ${TCPPFLAGS})' \
			LDFLAGS='$(strip ${TLDFLAGS})'
MAKE_ENV+=		PKG_CONFIG_LIBDIR='${STAGING_TARGET_DIR}/usr/lib/pkgconfig'
ifeq ($(ADK_NATIVE),)
MAKE_ENV+=		PATH='${TARGET_PATH}' \
			${HOST_CONFIGURE_OPTS} \
			CC='${TARGET_CC}' \
			CXX='${TARGET_CXX}' \
			AR='${TARGET_CROSS}ar' \
			RANLIB='${TARGET_CROSS}ranlib' \
			NM='${TARGET_CROSS}nm' \
			STRIP='${TARGET_CROSS}strip' \
			CROSS="$(TARGET_CROSS)"
endif

MAKE_FLAGS+=		${XAKE_FLAGS} V=1
FAKE_FLAGS+=		${XAKE_FLAGS}

ifeq ($(strip ${WRKDIR_BSD}),)
WRKDIR_BASE:=		${BUILD_DIR}
else
WRKDIR_BASE:=		$(shell pwd)
endif

_EXTRACT_COOKIE=	${WRKDIST}/.extract_done
_PATCH_COOKIE=		${WRKDIST}/.prepared
_CONFIGURE_COOKIE=	${WRKBUILD}/.configure_done
_BUILD_COOKIE=		${WRKBUILD}/.build_done
_FAKE_COOKIE=		${WRKINST}/.fake_done
_IPKGS_COOKIE=		${PACKAGE_DIR}/.stamps/${PKG_NAME}${PKG_VERSION}-${PKG_RELEASE}

_IN_PACKAGE:=		1
include ${TOPDIR}/mk/buildhlp.mk

# defined in buildhlp.mk ('extract' can fail, use 'patch' then)
extract: ${_EXTRACT_COOKIE}
patch: ${_PATCH_COOKIE}

# defined below (will be moved to pkg-bottom.mk!)
configure: ${_CONFIGURE_COOKIE}
build: ${_BUILD_COOKIE}
fake: ${_FAKE_COOKIE}
rebuild:
	@if [ -f ${TOPDIR}/.rebuild.${PKG_NAME} ];then \
		$(MAKE) clean; \
		rm -f ${TOPDIR}/.rebuild.${PKG_NAME}; \
	fi

# our recursive build entry point
build-all-pkgs: ${_IPKGS_COOKIE}

# there are some parameters to the PKG_template function
# 1.) Config.in identifier ADK_PACKAGE_$(1)
# 2.) name of the package, for single package mostly $(PKG_NAME)
# 3.) package version (upstream version) and package release (adk version),
#     always $(PKG_VERSION)-$(PKG_RELEASE)
# 4.) dependencies to other packages, $(PKG_DEPENDS)
# 5.) description for the package, $(PKG_DESCR)
# 6.) section of the package, $(PKG_SECTION)  
# 7.) special package options
#     noscripts -> do not install scripts to $(STAGING_TARGET_DIR)/target/scripts
#		  (needed for example for autoconf/automake)
#     noremove -> do not remove files from $(STAGING_TARGET_DIR)/target while
#                 cleaning (needed for toolchain packages like glibc/eglibc)
# should be package format independent and modular in the future
define PKG_template
ALL_PKGOPTS+=	$(1)
PKGNAME_$(1)=	$(2)
PKGDEPS_$(1)=	$(4)
PKGDESC_$(1)=	$(5)
PKGSECT_$(1)=	$(6)
IPKG_$(1)=	$(PACKAGE_DIR)/$(2)_$(3)_${CPU_ARCH}.${PKG_SUFFIX}
IDIR_$(1)=	$(WRKDIR)/fake-${CPU_ARCH}/pkg-$(2)
ifneq (${ADK_PACKAGE_$(1)}${DEVELOPER},)
ALL_IPKGS+=	$$(IPKG_$(1))
ALL_IDIRS+=	$${IDIR_$(1)}
endif
INFO_$(1)=	$(PKG_STATE_DIR)/info/$(2).list

ifeq ($(ADK_PACKAGE_$(1)),y)
install-targets: $$(INFO_$(1))
endif

IDEPEND_$(1):=	$$(strip $(4))

_ALL_CONTROLS+=	$$(IDIR_$(1))/CONTROL/control
ICONTROL_$(1)?=	$(WRKDIR)/.$(2).control
$$(IDIR_$(1))/CONTROL/control: ${_PATCH_COOKIE}
	@echo "Package: $$(shell echo $(2) | tr '_' '-')" > $(WRKDIR)/.$(2).control
	@echo "Section: $(6)" >> $(WRKDIR)/.$(2).control
	@echo "Description: $(5)" >> $(WRKDIR)/.$(2).control
	${BASH} ${SCRIPT_DIR}/make-ipkg-dir.sh $${IDIR_$(1)} $${ICONTROL_$(1)} $(3) ${CPU_ARCH}
	@adeps='$$(strip $${IDEPEND_$(1)})'; if [[ -n $$$$adeps ]]; then \
		comma=; \
		deps=; \
		last=; \
		for dep in $$$$adeps; do \
			if [[ $$$$last = kernel && $$$$dep = \(* ]]; then \
				deps="$$$$deps $$$$dep"; \
			else \
				deps="$$$$deps$$$$comma$$$$dep"; \
			fi; \
			comma=", "; \
			last=$$$$dep; \
		done; \
		echo "Depends: $$$$deps" | tr '_' '-' >>$${IDIR_$(1)}/CONTROL/control; \
	fi
	@for file in conffiles preinst postinst prerm postrm; do \
		[ ! -f ./files/$(2).$$$$file ] || cp ./files/$(2).$$$$file $$(IDIR_$(1))/CONTROL/$$$$file; \
	done

$$(IPKG_$(1)): $$(IDIR_$(1))/CONTROL/control $${_FAKE_COOKIE}
ifeq ($(ADK_DEBUG),)
	$${RSTRIP} $${IDIR_$(1)} $(MAKE_TRACE)
endif
	@for file in $$$$(ls ./files/*.init 2>/dev/null); do \
		fname=$$$$(echo $$$$file| sed -e "s#.*/##" -e "s#.init##"); \
		check=$$$$(grep PKG $$$$file|cut -d ' '  -f 2); \
		if [ "$$$$check" == $(2) ];then \
			mkdir -p $$(IDIR_$(1))/etc/init.d && cp $$$$file $$(IDIR_$(1))/etc/init.d/$$$$fname; \
		fi; \
	done
	@cd $${IDIR_$(1)}; for script in etc/init.d/*; do \
		[[ -e $$$$script ]] || continue; \
		chmod 0755 "$$$$script"; \
	done
	@mkdir -p $${PACKAGE_DIR} '$${STAGING_PKG_DIR}' \
	    '$${STAGING_TARGET_DIR}/scripts'
ifeq (,$(filter noremove,$(7)))
	@if test -s '$${STAGING_PKG_DIR}/$(1)'; then \
		cd '$${STAGING_TARGET_DIR}'; \
		while read fn; do \
			rm -f "$$$$fn"; \
		done <'$${STAGING_PKG_DIR}/$(1)'; \
	fi
endif
	@rm -f '$${STAGING_PKG_DIR}/$(1)'
	@-cd $${IDIR_$(1)}; \
	    x=$$$$(find tmp var -mindepth 1 2>/dev/null); if [[ -n $$$$x ]]; then \
		echo 'WARNING: $${IPKG_$(1)} installs files into a' \
		    'ramdisk location:' >&2; \
		echo "$$$$x" | sed 's/^/- /' >&2; \
	    fi; \
	    if [ "${PKG_NAME}" != "uClibc" -a "${PKG_NAME}" != "glibc" -a "${PKG_NAME}" != "eglibc" -a "${PKG_NAME}" != "libpthread" -a "${PKG_NAME}" != "libstdcxx" -a "${PKG_NAME}" != "libgcc" -a "${PKG_NAME}" != "libthread-db" ];then \
	    find lib \( -name lib\*.so\* -o -name lib\*.a \) \
	    	-exec echo 'WARNING: $${IPKG_$(1)} installs files in /lib -' \
		' fix this!' >&2 \; -quit 2>/dev/null; fi; \
	    find usr ! -type d 2>/dev/null | \
	    grep -v -e '^usr/share' -e '^usr/man' -e '^usr/info' -e '^usr/lib/libc.so' | \
	    tee '$${STAGING_PKG_DIR}/$(1)' | \
	    $(TOPDIR)/bin/tools/cpio -padlmu '$${STAGING_TARGET_DIR}'
	@cd '$${STAGING_TARGET_DIR}'; grep 'usr/lib/.*\.la$$$$' \
	    '$${STAGING_PKG_DIR}/$(1)' | while read fn; do \
		chmod u+w $$$$fn; \
		$(SED) "s,\(^libdir='\| \|-L\|^dependency_libs='\)/usr/lib,\1$(STAGING_TARGET_DIR)/usr/lib,g" $$$$fn; \
	done
ifeq (,$(filter noscripts,$(7)))
	@cd '$${STAGING_TARGET_DIR}'; grep 'usr/s*bin/' \
	    '$${STAGING_PKG_DIR}/$(1)' | \
	    while read fn; do \
		b="$$$$(dd if="$$$$fn" bs=2 count=1 2>/dev/null)"; \
		[[ $$$$b = '#!' ]] || continue; \
		cp "$$$$fn" scripts/; \
		echo "scripts/$$$$(basename "$$$$fn")" \
		    >>'$${STAGING_PKG_DIR}/$(1)'; \
	done
endif
ifeq (,$(filter libmix,$(7)))
ifeq (,$(filter libonly,$(7)))
	$${PKG_BUILD} $${IDIR_$(1)} $${PACKAGE_DIR} $(MAKE_TRACE)
endif
endif

clean-targets: clean-dev-$(1)

clean-dev-$(1):
ifeq (,$(filter noremove,$(7)))
	@if test -s '$${STAGING_PKG_DIR}/$(1)'; then \
		cd '$${STAGING_TARGET_DIR}'; \
		while read fn; do \
			rm -f "$$$$fn"; \
		done <'$${STAGING_PKG_DIR}/$(1)'; \
	fi
endif
	@rm -f '$${STAGING_PKG_DIR}/$(1)'

$$(INFO_$(1)): $$(IPKG_$(1))
	$(PKG_INSTALL) $$(IPKG_$(1))
endef

install-targets:
install:
	@$(CMD_TRACE) "installing... "
	@$(MAKE) install-targets $(MAKE_TRACE)

clean-targets:
clean:
	@$(CMD_TRACE) "cleaning... "
	@$(MAKE) clean-targets $(MAKE_TRACE)
	rm -rf ${WRKDIR} ${ALL_IPKGS} ${PACKAGE_DIR}/.stamps/${PKG_NAME}*

distclean: clean
	rm -f ${FULLDISTFILES}

.PHONY:	all refetch extract patch configure \
	build rebuild fake package install clean build-all-pkgs
