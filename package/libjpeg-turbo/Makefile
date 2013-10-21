# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(TOPDIR)/rules.mk

PKG_NAME:=		libjpeg-turbo
PKG_VERSION:=		1.3.0
PKG_RELEASE:=		2
PKG_MD5SUM:=		e1e65cc711a1ade1322c06ad4a647741
PKG_DESCR:=		a JPEG library
PKG_SECTION:=		libs
PKG_URL:=		http://libjpeg-turbo.virtualgl.org/
PKG_SITES:=		${MASTER_SITE_SOURCEFORGE:=libjpeg-turbo/}
PKG_OPTS:=		dev

include $(TOPDIR)/mk/package.mk

$(eval $(call PKG_template,LIBJPEG_TURBO,libjpeg-turbo,$(PKG_VERSION)-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION},${PKG_OPTS}))

libjpeg-turbo-install:
	$(INSTALL_DIR) $(IDIR_LIBJPEG_TURBO)/usr/lib
	$(CP) $(WRKINST)/usr/lib/lib{turbo,}jpeg*.so* \
		$(IDIR_LIBJPEG_TURBO)/usr/lib

include ${TOPDIR}/mk/pkg-bottom.mk
