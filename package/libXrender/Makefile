# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(TOPDIR)/rules.mk

PKG_NAME:=		libXrender
PKG_VERSION:=		0.9.6
PKG_RELEASE:=		1
PKG_MD5SUM:=		5dba047cf278e5ac77cd0f19f7195fb9
PKG_DESCR:=		X11 rendering library
PKG_SECTION:=		x11/libs
PKG_BUILDDEP:=		renderproto
PKG_SITES:=		${MASTER_SITE_XORG}

ifeq ($(ADK_STATIC),y)
PKG_OPTS:=		libonly
endif

include $(TOPDIR)/mk/package.mk

$(eval $(call PKG_template,LIBXRENDER,libxrender,$(PKG_VERSION)-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION},${PKG_OPTS}))

CONFIGURE_ARGS+=	--disable-malloc0returnsnull

post-install:
	${INSTALL_DIR} ${IDIR_LIBXRENDER}/usr/lib
	${CP} ${WRKINST}/usr/lib/libXrender.so* ${IDIR_LIBXRENDER}/usr/lib/

include ${TOPDIR}/mk/pkg-bottom.mk
