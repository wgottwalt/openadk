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
PKG_BUILDDEP:=		jpeg libtiff fontconfig libiconv
PKG_DEPENDS:=		libjpeg libtiff
PKG_URL:=		http://www.imagemagick.org/
PKG_SITES:=		http://image_magick.veidrodis.com/image_magick/

PKG_SUBPKGS:=		CONVERT DISPLAY LIBIMAGEMAGICK
PKGSD_LIBIMAGEMAGICK:=	imagemagick library
PKGSC_LIBIMAGEMAGICK:=	libs
PKGSD_CONVERT:=		image processing and converting utility
PKGSC_CONVERT:=		multimedia
PKGSS_CONVERT:=		libimagemagick
PKGSD_DISPLAY:=		image display application
PKGSC_DISPLAY:=		multimedia
PKGSS_DISPLAY:=		libimagemagick
PKGSB_DISPLAY:=		libX11

DISTFILES:=             ${PKG_NAME}-${PKG_VERSION}-${PKG_EXTRAVER}.tar.gz
WRKDIST=		${WRKDIR}/${PKG_NAME}-${PKG_VERSION}-${PKG_EXTRAVER}

include $(TOPDIR)/mk/package.mk

$(eval $(call PKG_template,LIBIMAGEMAGICK,libimagemagick,$(PKG_VERSION)-${PKG_RELEASE},${PKG_DEPENDS},${PKGSD_LIBIMAGEMAGICK},${PKGSC_LIBIMAGEMAGICK}))
$(eval $(call PKG_template,CONVERT,convert,$(PKG_VERSION)-${PKG_RELEASE},${PKGSS_CONVERT},${PKGSD_CONVERT},${PKGSC_CONVERT}))
$(eval $(call PKG_template,DISPLAY,display,$(PKG_VERSION)-${PKG_RELEASE},${PKGSS_DISPLAY},${PKGSD_DISPLAY},${PKGSC_DISPLAY}))

CONFIGURE_ARGS+=	--with-magick-plus-plus=no \
			--enable-fast-install

post-install:
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
	$(INSTALL_BIN) $(WRKINST)/usr/bin/convert \
		$(IDIR_CONVERT)/usr/bin

display-install:
	$(INSTALL_DIR) $(IDIR_DISPLAY)/usr/bin
	$(INSTALL_BIN) $(WRKINST)/usr/bin/display \
		$(IDIR_DISPLAY)/usr/bin

include ${TOPDIR}/mk/pkg-bottom.mk
