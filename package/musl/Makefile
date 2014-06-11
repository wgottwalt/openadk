# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(TOPDIR)/rules.mk
include $(TOPDIR)/mk/kernel-ver.mk
include $(TOPDIR)/mk/kernel-vars.mk
include $(TOPDIR)/toolchain/musl/Makefile.inc

PKG_NAME:=		musl
PKG_DESCR:=		embedded C library
PKG_SECTION:=		base/libs
PKG_OPTS:=		noremove nostaging noscripts

PKG_SUBPKGS:=		MUSL MUSL_DEV
PKGSD_MUSL_DEV:=	development files for musl
PKGSC_MUSL_DEV:=	dev/header

NO_DISTFILES:=		1

include $(TOPDIR)/mk/package.mk

$(eval $(call PKG_template,MUSL,musl,$(PKG_VERSION)-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION},${PKG_OPTS}))
$(eval $(call PKG_template,MUSL_DEV,musl-dev,$(PKG_VERSION)-${PKG_RELEASE},${PKG_DEPENDS},${PKGSD_MUSL_DEV},${PKGSC_MUSL_DEV},${PKG_OPTS}))

CONFIG_STYLE:=          manual
BUILD_STYLE:=           manual
INSTALL_STYLE:=         manual

MARCH:=			$(ADK_TARGET_CPU_ARCH)
ifeq ($(ADK_TARGET_CPU_ARCH),i686)
MARCH:=			i386
endif
ifeq ($(ADK_TARGET_CPU_ARCH),i586)
MARCH:=			i386
endif
ifeq ($(ADK_TARGET_CPU_ARCH),i486)
MARCH:=			i386
endif
ifeq ($(ADK_TARGET_CPU_ARCH),ppc)
MARCH:=			powerpc
endif
ifeq ($(ADK_TARGET_CPU_ARCH),sh4)
MARCH:=			sh
endif
ifeq ($(ADK_TARGET_CPU_ARCH),sh4eb)
MARCH:=			sheb
endif
ifeq ($(ADK_LINUX_ARM),y)
ifeq ($(ADK_TARGET_ABI),eabihf)
MARCH:=			armhf
endif
endif
ifeq ($(ADK_TARGET_ABI_X32),y)
MARCH:=			x32
endif

# do nothing, musl is already build in toolchain directory
do-install:
ifneq ($(ADK_TARGET_USE_STATIC_LIBS),y)
	${INSTALL_DIR} $(IDIR_MUSL)/bin
	${INSTALL_DIR} $(IDIR_MUSL)/$(ADK_TARGET_LIBC_PATH)
	$(CP) $(STAGING_TARGET_DIR)/usr/lib/libc.so $(IDIR_MUSL)/$(ADK_TARGET_LIBC_PATH)
	(cd $(IDIR_MUSL)/$(ADK_TARGET_LIBC_PATH) && \
		ln -sf libc.so ld-musl-$(MARCH).so.1)
	(cd $(IDIR_MUSL)/bin && \
		ln -sf ../lib/ld-musl-$(MARCH).so.1 ldd)
endif
	

musl-dev-install:
	${INSTALL_DIR} ${IDIR_MUSL_DEV}/usr/lib 
	${CP} ${STAGING_TARGET_DIR}/usr/lib/crt*.o ${IDIR_MUSL_DEV}/usr/lib
	${KERNEL_MAKE_ENV} \
	$(MAKE) -C $(TOOLCHAIN_BUILD_DIR)/w-linux-$(KERNEL_VERSION)-$(KERNEL_RELEASE)/linux-$(KERNEL_VERSION) \
		$(KERNEL_MAKE_OPTS) \
		INSTALL_HDR_PATH=$(IDIR_MUSL_DEV)/usr \
		headers_install
	$(MAKE) -C $(TOOLCHAIN_BUILD_DIR)/w-$(PKG_NAME)-$(PKG_VERSION)-$(PKG_RELEASE)/${PKG_NAME}-${PKG_VERSION} \
		DESTDIR=$(IDIR_MUSL_DEV) \
		install-headers
	@find $(IDIR_MUSL_DEV) -name .install -exec rm {} \;
	@find $(IDIR_MUSL_DEV) -name ..install.cmd -exec rm {} \;

include ${TOPDIR}/mk/pkg-bottom.mk
