# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(ADK_TOPDIR)/rules.mk
include ../rules.mk

TARGET_CFLAGS:=		$(filter-out -ffast-math,$(TARGET_CFLAGS))

# glibc does not compile with Os
TARGET_CFLAGS:=		$(subst Os,O2,$(TARGET_CFLAGS))
ifneq ($(ADK_DEBUG),)
TARGET_CFLAGS+=		-O2
endif

include Makefile.inc
include ${ADK_TOPDIR}/mk/buildhlp.mk

GLIBC_MAKEOPTS+=	cross-compiling=yes
ifeq (${ADK_MAKE_PARALLEL},y)
GLIBC_MAKEOPTS+=	PARALLELMFLAGS="-j$(ADK_MAKE_JOBS)"
endif

GLIBC_BUILD_DIR_FINAL:=		${WRKDIR}/$(PKG_NAME)-$(PKG_VERSION)-final

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
	${GLIBC_ENV} $(MAKE) ${GLIBC_MAKEOPTS} asm-CPPFLAGS='$${CFLAGS}' -C $(GLIBC_BUILD_DIR_FINAL) all
	touch $@

$(WRKBUILD)/.installed:
	${GLIBC_ENV} $(MAKE) -C $(GLIBC_BUILD_DIR_FINAL) install_root=$(STAGING_TARGET_DIR) install
	touch $(STAGING_TARGET_DIR)/usr/include/gnu/stubs.h
	touch $(STAGING_TARGET_DIR)/usr/include/gnu/stubs-{32,x32,64,soft,hard}.h
	mkdir -p ${STAGING_TARGET_DIR}/etc
	${INSTALL_DATA} ${WRKBUILD}/posix/gai.conf ${STAGING_TARGET_DIR}/etc
	${INSTALL_DATA} ${WRKBUILD}/nss/nsswitch.conf ${STAGING_TARGET_DIR}/etc
	touch $@

$(WRKBUILD)/.final:
	touch $@

include ${ADK_TOPDIR}/mk/toolchain.mk
