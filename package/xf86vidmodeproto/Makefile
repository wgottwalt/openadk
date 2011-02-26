# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(TOPDIR)/rules.mk

PKG_NAME:=		xf86vidmodeproto
PKG_VERSION:=		2.3
PKG_RELEASE:=		1
PKG_DESCR:=		XFree86-VidModeExtension extension headers
PKG_SECTION:=		x11/devel
PKG_MD5SUM:=		934b400f2f8d1bcab20bb056e0910291
PKG_SITES:=		${MASTER_SITE_XORG}

include $(TOPDIR)/mk/package.mk

$(eval $(call PKG_template,XF86VIDMODEPROTO,xf86vidmodeproto,$(PKG_VERSION)-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION},${PKG_OPTS}))

post-install:
	${INSTALL_DIR} ${IDIR_XF86VIDMODEPROTO}/usr/include
	${CP} ${WRKINST}/usr/include/X11 ${IDIR_XF86VIDMODEPROTO}/usr/include
	${INSTALL_DIR} ${IDIR_XF86VIDMODEPROTO}/usr/lib/pkgconfig
	${INSTALL_DATA} ${WRKINST}/usr/lib/pkgconfig/xf86vidmodeproto.pc \
		${IDIR_XF86VIDMODEPROTO}/usr/lib/pkgconfig

include ${TOPDIR}/mk/pkg-bottom.mk
