# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(TOPDIR)/rules.mk

PKG_NAME:=		xineramaproto
PKG_VERSION:=		1.2
PKG_RELEASE:=		1
PKG_DESCR:=		Xinerama Extension headers
PKG_SECTION:=		x11/devel
PKG_MD5SUM:=		1e98484ffa9b0eb6ab9d00cd53bfe74f
PKG_SITES:=		http://xorg.freedesktop.org/releases/individual/proto/

include $(TOPDIR)/mk/package.mk

$(eval $(call PKG_template,XINERAMAPROTO,xineramaproto,$(PKG_VERSION)-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION},${PKG_OPTS}))

post-install:
	${INSTALL_DIR} ${IDIR_XINERAMAPROTO}/usr/include
	${CP} ${WRKINST}/usr/include/X11 ${IDIR_XINERAMAPROTO}/usr/include
	${INSTALL_DIR} ${IDIR_XINERAMAPROTO}/usr/lib/pkgconfig
	${INSTALL_DATA} ${WRKINST}/usr/lib/pkgconfig/*.pc \
		${IDIR_XINERAMAPROTO}/usr/lib/pkgconfig

include ${TOPDIR}/mk/pkg-bottom.mk
