# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(ADK_TOPDIR)/rules.mk

PKG_NAME:=		boot-wrapper-aarch64
PKG_VERSION:=		0.1
PKG_RELEASE:=		1
PKG_HASH:=		e8de5beb585d46c2aec4b30aa8ba96b21bed5749ca1bcdd0b2fdaf95dab7ab4c
PKG_DESCR:=		boot-wrapper for aarch64
PKG_SECTION:=		base/boot
PKG_SITES:=		http://www.openadk.org/distfiles/

PKG_SYSTEM_DEPENDS:=	arm-fm

DISTFILES:=             ${PKG_NAME}-${PKG_VERSION}.tar.xz

include $(ADK_TOPDIR)/mk/package.mk

$(eval $(call PKG_template,BOOT_WRAPPER_AARCH64,boot-wrapper-aarch64,$(PKG_VERSION)-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))

AUTOTOOL_STYLE:=	autoreconf
CONFIGURE_ARGS+=	--with-kernel-dir=${LINUX_DIR}

boot-wrapper-aarch64-install:
	${CP} ${WRKBUILD}/linux-system.axf ${LINUX_DIR}

include ${ADK_TOPDIR}/mk/pkg-bottom.mk
