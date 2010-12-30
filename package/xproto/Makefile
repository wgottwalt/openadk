# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(TOPDIR)/rules.mk

PKG_NAME:=		xproto
PKG_VERSION:=		7.0.16
PKG_RELEASE:=		1
PKG_MD5SUM:=		6e6b6510ccd568f82093ebd7ae58700b
PKG_SITES:=		${MASTER_SITE_XORG}
PKG_SUBPKGS:=

include $(TOPDIR)/mk/package.mk

# workaround for makekeys compile on non-Linux systems
post-install:
	${INSTALL_DIR} ${STAGING_TARGET_DIR}/usr/include/xproto
	${CP} ${WRKINST}/usr/include/X11 ${STAGING_TARGET_DIR}/usr/include/xproto

include ${TOPDIR}/mk/pkg-bottom.mk
