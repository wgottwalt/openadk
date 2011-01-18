# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(TOPDIR)/rules.mk

PKG_NAME:=		libXcomposite
PKG_VERSION:=		0.4.3
PKG_RELEASE:=		1
PKG_MD5SUM:=		b93dac50c86db6eba3f72e949f5bed2a
PKG_DESCR:=		X composite library
PKG_SECTION:=		x11/libs
PKG_BUILDDEP:=		libX11 compositeproto
PKG_SITES:=		${MASTER_SITE_XORG}

PKG_SUBPKGS:=		LIBXCOMPOSITE LIBXCOMPOSITE_DEV
PKGSD_LIBXCOMPOSITE_DEV:=	X11 composite headers
PKGSC_LIBXCOMPOSITE_DEV:=	devel

ifeq ($(ADK_STATIC),y)
PKG_OPTS:=		libonly
endif

include $(TOPDIR)/mk/package.mk

$(eval $(call PKG_template,LIBXCOMPOSITE,libxcomposite,$(PKG_VERSION)-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION},${PKG_OPTS}))
$(eval $(call PKG_template,LIBXCOMPOSITE_DEV,libxcomposite-dev,$(PKG_VERSION)-${PKG_RELEASE},${PKG_DEPENDS},${PKGSD_LIBXCOMPOSITE_DEV},${PKGSC_LIBXCOMPOSITE_DEV},${PKG_OPTS}))

CONFIGURE_ARGS+=	--disable-malloc0returnsnull

post-install:
	${INSTALL_DIR} ${IDIR_LIBXCOMPOSITE}/usr/lib
	${CP} ${WRKINST}/usr/lib/libXcomposite.so* ${IDIR_LIBXCOMPOSITE}/usr/lib/

libxcomposite-dev-install:
	${INSTALL_DIR} ${IDIR_LIBXCOMPOSITE_DEV}/usr/include/X11/extensions
	${CP} ${WRKINST}/usr/include/X11/extensions/*.h \
		${IDIR_LIBXCOMPOSITE_DEV}/usr/include/X11/extensions

include ${TOPDIR}/mk/pkg-bottom.mk
