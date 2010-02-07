# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(TOPDIR)/rules.mk

PKG_NAME:=		libXext
PKG_VERSION:=		1.1.1
PKG_RELEASE:=		1
PKG_BUILDDEP+=		libX11
PKG_MD5SUM:=		6b61b3f657befded8ae66e04085c413e
PKG_DESCR:=		X client interface to extensions of the X protocol
PKG_SECTION:=		x11
PKG_SITES:=		${MASTER_SITE_XORG}

ifeq ($(ADK_STATIC),y)
PKG_OPTS:=		libonly
endif

include $(TOPDIR)/mk/package.mk

$(eval $(call PKG_template,LIBXEXT,libxext,$(PKG_VERSION)-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION},${PKG_OPTS}))

CONFIGURE_ARGS+=	--disable-malloc0returnsnull

post-install:
	${INSTALL_DIR} ${IDIR_LIBXEXT}/usr/lib
	${CP} ${WRKINST}/usr/lib/libXext.so* ${IDIR_LIBXEXT}/usr/lib/

include ${TOPDIR}/mk/pkg-bottom.mk
