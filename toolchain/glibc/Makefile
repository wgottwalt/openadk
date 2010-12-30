# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(TOPDIR)/rules.mk
include ../rules.mk

# glibc does not compile with Os
TARGET_CFLAGS:=$(subst Os,O2,$(TARGET_CFLAGS))
ifneq ($(ADK_DEBUG),)
TARGET_CFLAGS+=-O2
endif

include Makefile.inc
include ${TOPDIR}/mk/buildhlp.mk

ifeq ($(ADK_TARGET_NO_FPU),y)
GLIBC_CONFOPTS+=	--without-fp
endif

ifeq (${ADK_MAKE_PARALLEL},y)
GLIBC_MAKEOPTS+=	PARALLELMFLAGS="-j${ADK_MAKE_JOBS}"
endif

GLIBC_BUILD_DIR_INITIAL:=	${WRKDIR}/$(PKG_NAME)-$(PKG_VERSION)-headers
GLIBC_BUILD_DIR_FINAL:=		${WRKDIR}/$(PKG_NAME)-$(PKG_VERSION)-final

$(WRKBUILD)/.headers_configure:
	mkdir -p $(GLIBC_BUILD_DIR_INITIAL)
	(cd ${WRKDIR}/$(PKG_NAME)-$(PKG_VERSION); \
	ln -sf ../../w-glibc-ports-$(GLIBC_PORTS_VERSION)-1/glibc-ports-$(GLIBC_PORTS_VERSION)/ ports);
	(cd $(GLIBC_BUILD_DIR_INITIAL); \
		${GLIBC_ENV} \
		$(WRKBUILD)/configure \
			--prefix=$(TOOLCHAIN_SYSROOT)/usr \
			--with-sysroot=$(TOOLCHAIN_SYSROOT) \
			${GLIBC_CONFOPTS} \
	);
	touch $@

$(WRKBUILD)/.headers: $(WRKBUILD)/.headers_configure
	mkdir -p $(TOOLCHAIN_SYSROOT)/usr/lib
	(cd $(GLIBC_BUILD_DIR_INITIAL); \
		${GLIBC_ENV} \
		$(MAKE) ${GLIBC_MAKEOPTS} \
		cross-compiling=yes \
		install-headers \
	);
	touch $(TOOLCHAIN_SYSROOT)/usr/include/gnu/stubs.h
	touch $@

$(WRKBUILD)/.configured:
	mkdir -p $(GLIBC_BUILD_DIR_FINAL)
	(cd $(GLIBC_BUILD_DIR_FINAL); \
		${GLIBC_ENV} \
		$(WRKBUILD)/configure \
			--prefix=/usr \
			--enable-shared \
			--enable-stackguard-randomization \
			${GLIBC_CONFOPTS} \
	);
	touch $@

$(WRKBUILD)/.compiled:
	${GLIBC_ENV} $(MAKE) ${GLIBC_MAKEOPTS} -C $(GLIBC_BUILD_DIR_FINAL) all
	touch $@

$(WRKBUILD)/.installed:
	${GLIBC_ENV} $(MAKE) -C $(GLIBC_BUILD_DIR_FINAL) \
		install_root=$(STAGING_TARGET_DIR) install
	touch $(STAGING_TARGET_DIR)/usr/include/gnu/stubs.h
	touch $(WRKBUILD)/.installed

include ${TOPDIR}/mk/toolchain.mk
