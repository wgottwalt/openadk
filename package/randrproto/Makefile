# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(TOPDIR)/rules.mk

PKG_NAME:=		randrproto
PKG_VERSION:=		1.3.1
PKG_RELEASE:=		1
PKG_MD5SUM:=		15266124b9e2dfcfb25ce6cba24cdd66
PKG_DESCR:=		Xrandr protcol headers
PKG_SECTION:=		x11/devel
PKG_SITES:=		${MASTER_SITE_XORG}

include $(TOPDIR)/mk/package.mk

$(eval $(call PKG_template,RANDRPROTO,randrproto,$(PKG_VERSION)-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION},${PKG_OPTS}))

post-install:
	${INSTALL_DIR} ${IDIR_RANDRPROTO}/usr/include
	${CP} ${WRKINST}/usr/include/X11 ${IDIR_RANDRPROTO}/usr/include

include ${TOPDIR}/mk/pkg-bottom.mk
