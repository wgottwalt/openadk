# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(ADK_TOPDIR)/rules.mk
include $(ADK_TOPDIR)/mk/kernel-ver.mk
include $(ADK_TOPDIR)/mk/kernel-vars.mk
include $(ADK_TOPDIR)/toolchain/musl/Makefile.inc

PKG_NAME:=		musl
PKG_DESCR:=		embedded C library
PKG_SECTION:=		base/libs
PKG_OPTS:=		noremove nostaging noscripts

PKG_SUBPKGS:=		MUSL MUSL_DEV
PKGSD_MUSL_DEV:=	development files for musl
PKGSC_MUSL_DEV:=	dev/header

NO_DISTFILES:=		1

include $(ADK_TOPDIR)/mk/package.mk

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
ifeq ($(ADK_TARGET_SOFT_FLOAT),y)
MARCH:=			powerpc-sf
else
MARCH:=			powerpc
endif
endif
ifeq ($(ADK_TARGET_CPU_ARCH),ppc64)
MARCH:=			powerpc64
endif
ifeq ($(ADK_TARGET_CPU_ARCH),ppc64le)
MARCH:=			powerpc64le
endif
ifeq ($(ADK_TARGET_CPU_ARCH),sh4)
MARCH:=			sh
endif
ifeq ($(ADK_TARGET_CPU_ARCH),sh4eb)
MARCH:=			sh
endif
ifeq ($(ADK_TARGET_ARCH_MIPS),y)
ifeq ($(ADK_TARGET_SOFT_FLOAT),y)
ifeq ($(ADK_TARGET_LITTLE_ENDIAN),y)
MARCH:=			mipsel-sf
else
MARCH:=			mips-sf
endif
endif
endif
ifeq ($(ADK_TARGET_ARCH_MIPS64),y)
ifeq ($(ADK_TARGET_ABI_N32),y)
ifeq ($(ADK_TARGET_LITTLE_ENDIAN),y)
MARCH:=			mipsn32el
else
MARCH:=			mipsn32
endif
endif
endif
ifeq ($(ADK_TARGET_ARCH_ARM),y)
ifeq ($(ADK_TARGET_ABI),eabihf)
MARCH:=			armhf
endif
endif
ifeq ($(ADK_TARGET_ABI_X32),y)
MARCH:=			x32
endif

# do nothing, musl is already build in toolchain directory
do-install:
ifneq ($(ADK_TARGET_USE_STATIC_LIBS_ONLY),y)
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
	$(MAKE) -C $(TOOLCHAIN_BUILD_DIR)/w-linux-$(KERNEL_VERSION)/linux-$(KERNEL_FILE_VER) \
		$(KERNEL_MAKE_OPTS) \
		INSTALL_HDR_PATH=$(IDIR_MUSL_DEV)/usr \
		headers_install
	$(MAKE) -C $(TOOLCHAIN_BUILD_DIR)/w-$(PKG_NAME)-$(PKG_VERSION)-$(PKG_RELEASE)/${PKG_NAME}-${PKG_VERSION} \
		DESTDIR=$(IDIR_MUSL_DEV) \
		install-headers
	@find $(IDIR_MUSL_DEV) -name .install -exec rm {} \;
	@find $(IDIR_MUSL_DEV) -name ..install.cmd -exec rm {} \;

include ${ADK_TOPDIR}/mk/pkg-bottom.mk
