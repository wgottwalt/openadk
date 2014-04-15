# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(TOPDIR)/rules.mk

PKG_NAME:=		boot-wrapper-aarch64
PKG_VERSION:=		0.1
PKG_RELEASE:=		1
PKG_MD5SUM:=		2ffdbf8c05854e3b855314d9ac21bbc4
PKG_DESCR:=		boot-wrapper for aarch64
PKG_SECTION:=		boot
PKG_BUILDDEP:=		autotool
PKG_SITES:=		http://www.openadk.org/distfiles/

DISTFILES:=             ${PKG_NAME}-${PKG_VERSION}.tar.xz

include $(TOPDIR)/mk/package.mk

$(eval $(call PKG_template,BOOT_WRAPPER_AARCH64,boot-wrapper-aarch64,$(PKG_VERSION)-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))

AUTOTOOL_STYLE:=	autoreconf
CONFIGURE_ARGS+=	--with-kernel-dir=${LINUX_DIR}

boot-wrapper-aarch64-install:
	${CP} ${WRKBUILD}/linux-system.axf ${LINUX_DIR}

include ${TOPDIR}/mk/pkg-bottom.mk
