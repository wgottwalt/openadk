# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(TOPDIR)/rules.mk

PKG_NAME:=		libfontenc
PKG_VERSION:=		1.1.1
PKG_RELEASE:=		1
PKG_MD5SUM:=		53db605124a729aec92476ee5ce78072
PKG_DESCR:=		helps to deal with different encodings of fonts
PKG_SECTION:=		x11/libs
PKG_DEPENDS:=		zlib
PKG_BUILDDEP:=		xproto zlib
PKG_SITES:=		${MASTER_SITE_XORG}

PKG_SUBPKGS:=		LIBFONTENC LIBFONTENC_DEV
PKGSC_LIBFONTENC_DEV:=	devel
PKGSD_LIBFONTENC_DEV:=	libfontenc headers

include $(TOPDIR)/mk/package.mk

$(eval $(call PKG_template,LIBFONTENC,libfontenc,$(PKG_VERSION)-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))
$(eval $(call PKG_template,LIBFONTENC_DEV,libfontenc-dev,$(PKG_VERSION)-${PKG_RELEASE},${PKG_DEPENDS},${PKGSD_LIBFONTENC_DEV},${PKGSC_LIBFONTENC_DEV}))

libfontenc-install:
	${INSTALL_DIR} ${IDIR_LIBFONTENC}/usr/lib
	${CP} ${WRKINST}/usr/lib/libfontenc.so* ${IDIR_LIBFONTENC}/usr/lib

libfontenc-dev-install:
	${INSTALL_DIR} ${IDIR_LIBFONTENC_DEV}/usr/include
	${CP} ${WRKINST}/usr/include/* ${IDIR_LIBFONTENC_DEV}/usr/include
	${INSTALL_DIR} ${IDIR_LIBFONTENC_DEV}/usr/lib/pkgconfig
	${INSTALL_DATA} ${WRKINST}/usr/lib/pkgconfig/fontenc.pc \
		${IDIR_LIBFONTENC_DEV}/usr/lib/pkgconfig

include ${TOPDIR}/mk/pkg-bottom.mk
