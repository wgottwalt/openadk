# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(TOPDIR)/rules.mk

PKG_NAME:=		pixman
PKG_VERSION:=		0.26.2
PKG_RELEASE:=		1
PKG_MD5SUM:=		276242da5b3af1258d072cf205d18f0b
PKG_DESCR:=		Pixel manipulation library
PKG_SECTION:=		x11/libs
PKG_BUILDDEP:=		libpng
PKG_SITES:=		http://www.cairographics.org/releases/

PKG_SUBPKGS:=		PIXMAN PIXMAN_DEV
PKGSC_PIXMAN_DEV:=	devel
PKGSD_PIXMAN_DEV:=	Pixel manipulation headers

ifeq ($(ADK_STATIC),y)
PKG_OPTS:=		libonly
endif

include $(TOPDIR)/mk/package.mk

$(eval $(call PKG_template,PIXMAN,pixman,$(PKG_VERSION)-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION},${PKG_OPTS}))
$(eval $(call PKG_template,PIXMAN_DEV,pixman-dev,$(PKG_VERSION)-${PKG_RELEASE},${PKG_DEPENDS},${PKGSD_PIXMAN_DEV},${PKGSC_PIXMAN_DEV},${PKG_OPTS}))

TARGET_CFLAGS:=         $(filter-out -flto,$(TARGET_CFLAGS))
CONFIGURE_ARGS+=	--disable-gtk

pixman-install:
	${INSTALL_DIR} ${IDIR_PIXMAN}/usr/lib
	${CP} ${WRKINST}/usr/lib/libpixman-1.so* ${IDIR_PIXMAN}/usr/lib

pixman-dev-install:
	${INSTALL_DIR} ${IDIR_PIXMAN_DEV}/usr/include
	${CP} ${WRKINST}/usr/include/* \
		${IDIR_PIXMAN_DEV}/usr/include
	${INSTALL_DIR} ${IDIR_PIXMAN_DEV}/usr/lib/pkgconfig
	${INSTALL_DATA} ${WRKINST}/usr/lib/pkgconfig/*.pc \
		${IDIR_PIXMAN_DEV}/usr/lib/pkgconfig

include ${TOPDIR}/mk/pkg-bottom.mk
