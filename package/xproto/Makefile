# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(TOPDIR)/rules.mk

PKG_NAME:=		xproto
PKG_VERSION:=		7.0.13
PKG_RELEASE:=		1
PKG_MD5SUM:=		4c736a7ba52beddaea87964047adf209
PKG_SITES:=		${MASTER_SITE_XORG}

include $(TOPDIR)/mk/package.mk

CONFIGURE_STYLE=	gnu
BUILD_STYLE=		auto
INSTALL_STYLE=		auto

# workaround for makekeys compile on non-Linux systems
post-install:
	${INSTALL_DIR} ${STAGING_DIR}/usr/include/xproto
	${CP} ${WRKINST}/usr/include/X11 ${STAGING_DIR}/usr/include/xproto

include ${TOPDIR}/mk/pkg-bottom.mk
