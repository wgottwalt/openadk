# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(TOPDIR)/rules.mk

PKG_NAME:=		libXv
PKG_VERSION:=		1.0.6
PKG_RELEASE:=		1
PKG_MD5SUM:=		a7184aa3e3f405792a09ccd6447caf67
PKG_DESCR:=		X11 Xvideo extensions
PKG_SECTION:=		x11/libs
PKG_BUILDDEP:=		libX11 videoproto libXext
PKG_SITES:=		${MASTER_SITE_XORG}

include $(TOPDIR)/mk/package.mk

$(eval $(call PKG_template,LIBXV,libxv,$(PKG_VERSION)-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))

CONFIGURE_ARGS+=	--disable-malloc0returnsnull

post-install:
	${INSTALL_DIR} ${IDIR_LIBXV}/usr/lib
	${CP} ${WRKINST}/usr/lib/libXv.so* ${IDIR_LIBXV}/usr/lib/

include ${TOPDIR}/mk/pkg-bottom.mk
