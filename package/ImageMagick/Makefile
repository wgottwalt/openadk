# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(TOPDIR)/rules.mk

PKG_NAME:=		ImageMagick
PKG_VERSION:=		6.6.5
PKG_EXTRAVER:=		10
PKG_RELEASE:=		1
PKG_MD5SUM:=		a07a97cfb28b588cbcf83ffa9ec92e3f
PKG_DESCR:=		image processing and converting utility
PKG_SECTION:=		multimedia
PKG_BUILDDEP:=		libpng jpeg libtiff fontconfig libiconv
PKG_URL:=		http://www.imagemagick.org/
PKG_SITES:=		http://image_magick.veidrodis.com/image_magick/
PKG_NEED_CXX:=		1

PKG_SUBPKGS:=		CONVERT DISPLAY LIBIMAGEMAGICK
PKGSD_LIBIMAGEMAGICK:=	imagemagick library
PKGSC_LIBIMAGEMAGICK:=	libs
PKGSS_LIBIMAGEMAGICK:=	libjpeg libtiff
PKGSD_CONVERT:=		image processing and converting utility
PKGSC_CONVERT:=		multimedia
PKGSS_CONVERT:=		libimagemagick
PKGSD_DISPLAY:=		image display application
PKGSC_DISPLAY:=		multimedia
PKGSS_DISPLAY:=		libimagemagick libX11 libXau libXdmcp libICE libSM fontconfig libXt zlib libpng
PKGSB_DISPLAY:=		libX11

DISTFILES:=             ${PKG_NAME}-${PKG_VERSION}-${PKG_EXTRAVER}.tar.gz
WRKDIST=		${WRKDIR}/${PKG_NAME}-${PKG_VERSION}-${PKG_EXTRAVER}

include $(TOPDIR)/mk/package.mk

$(eval $(call PKG_template,LIBIMAGEMAGICK,libimagemagick,$(PKG_VERSION)-${PKG_RELEASE},${PKG_DEPENDS},${PKGSD_LIBIMAGEMAGICK},${PKGSC_LIBIMAGEMAGICK}))
$(eval $(call PKG_template,CONVERT,convert,$(PKG_VERSION)-${PKG_RELEASE},${PKGSS_CONVERT},${PKGSD_CONVERT},${PKGSC_CONVERT}))
$(eval $(call PKG_template,DISPLAY,display,$(PKG_VERSION)-${PKG_RELEASE},${PKGSS_DISPLAY},${PKGSD_DISPLAY},${PKGSC_DISPLAY}))

TARGET_CFLAGS:=         $(filter-out -flto,$(TARGET_CFLAGS))
CONFIGURE_ENV+=		ac_cv_sys_file_offset_bits=yes
CONFIGURE_ARGS+=	--with-magick-plus-plus=no \
			--without-gslib \
			--without-dps \
			--without-perl \
			--without-djvu \
			--without-lcms \
			--without-lcms2 \
			--without-wmf \
			--with-jpeg \
			--with-png \
			--with-tiff \
			--enable-fast-install

libimagemagick-install:
	$(INSTALL_DIR) $(IDIR_LIBIMAGEMAGICK)/usr/lib
	$(INSTALL_DIR) $(IDIR_LIBIMAGEMAGICK)/usr/lib/${PKG_NAME}-${PKG_VERSION}/config
	$(INSTALL_DATA) $(WRKINST)/usr/lib/${PKG_NAME}-${PKG_VERSION}/config/* \
		$(IDIR_LIBIMAGEMAGICK)/usr/lib/${PKG_NAME}-${PKG_VERSION}/config
	$(INSTALL_DIR) $(IDIR_LIBIMAGEMAGICK)/usr/share/${PKG_NAME}-${PKG_VERSION}/config
	$(INSTALL_DATA) $(WRKINST)/usr/share/${PKG_NAME}-${PKG_VERSION}/config/* \
		$(IDIR_LIBIMAGEMAGICK)/usr/share/${PKG_NAME}-${PKG_VERSION}/config
	$(CP) $(WRKINST)/usr/lib/libMagickCore.so* \
		$(IDIR_LIBIMAGEMAGICK)/usr/lib
	$(CP) $(WRKINST)/usr/lib/libMagickWand.so* \
		$(IDIR_LIBIMAGEMAGICK)/usr/lib

convert-install:
	$(INSTALL_DIR) $(IDIR_CONVERT)/usr/bin
	$(INSTALL_BIN) $(WRKINST)/usr/bin/convert $(IDIR_CONVERT)/usr/bin

display-install:
	$(INSTALL_DIR) $(IDIR_DISPLAY)/usr/bin
	$(INSTALL_BIN) $(WRKINST)/usr/bin/display $(IDIR_DISPLAY)/usr/bin

include ${TOPDIR}/mk/pkg-bottom.mk
