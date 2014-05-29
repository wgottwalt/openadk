# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(TOPDIR)/rules.mk

PKG_NAME:=		fbsplash
PKG_VERSION:=		1.0
PKG_RELEASE:=		2
PKG_MD5SUM:=		aa0a9e735e086228bc245b18e231bf6c
PKG_DESCR:=		framebuffer splash utility
PKG_SECTION:=		sys/utils
PKG_BUILDDEP:=		libjpeg-turbo libpng freetype
PKG_DEPENDS:=		libjpeg-turbo libpng libfreetype
PKG_URL:=		https://github.com/alanhaggai/fbsplash
PKG_SITES:=		http://openadk.org/distfiles/

DISTFILES:=		${PKG_NAME}-${PKG_VERSION}.tar.gz

include $(TOPDIR)/mk/package.mk

$(eval $(call PKG_template,FBSPLASH,fbsplash,$(PKG_VERSION)-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))

fbsplash-install:
	$(INSTALL_DIR) $(IDIR_FBSPLASH)/usr/lib
	$(CP)  $(WRKINST)/usr/lib/libfb*.so* $(IDIR_FBSPLASH)/usr/lib
	$(INSTALL_DIR) $(IDIR_FBSPLASH)/sbin
	$(INSTALL_BIN) $(WRKINST)/sbin/{fbcondecor_helper,fbsplashctl} \
		$(IDIR_FBSPLASH)/sbin

include ${TOPDIR}/mk/pkg-bottom.mk
