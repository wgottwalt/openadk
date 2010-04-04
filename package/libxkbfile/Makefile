# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(TOPDIR)/rules.mk

PKG_NAME:=		libxkbfile
PKG_VERSION:=		1.0.6
PKG_RELEASE:=		1
PKG_MD5SUM:=		a1384a9a48430397aff236f97e26ed05
PKG_DESCR:=		X11 keyboard configuration extension library
PKG_SECTION:=		x11
PKG_BUILDDEP+=		kbproto libX11
PKG_SITES:=		${MASTER_SITE_XORG}

include $(TOPDIR)/mk/package.mk

$(eval $(call PKG_template,LIBXKBFILE,${PKG_NAME},${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))

post-install:
	${INSTALL_DIR} ${IDIR_LIBXKBFILE}/usr/lib
	${CP} ${WRKINST}/usr/lib/libxkbfile.so* ${IDIR_LIBXKBFILE}/usr/lib/

include ${TOPDIR}/mk/pkg-bottom.mk
