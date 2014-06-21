# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(ADK_TOPDIR)/rules.mk

PKG_NAME:=		libjasper
PKG_VERSION:=		1.900
PKG_RELEASE:=		2
PKG_MD5SUM:=		a342b2b4495b3e1394e161eb5d85d754
PKG_DESCR:=		implementation of the codec specified in the jpeg-2000 standard
PKG_SECTION:=		libs/image
PKG_URL:=		http://www.ece.uvic.ca/~frodo/jasper/
PKG_SITES:=		http://www.ece.uvic.ca/~frodo/jasper/software/
PKG_OPTS:=		dev

DISTFILES:=             jasper-${PKG_VERSION}.1.zip
WRKDIST=		${WRKDIR}/jasper-$(PKG_VERSION).1

include $(ADK_TOPDIR)/mk/package.mk

$(eval $(call PKG_template,LIBJASPER,libjasper,$(PKG_VERSION)-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION},${PKG_OPTS}))

XAKE_FLAGS+=		GCC_HONOUR_COPTS=s

libjasper-install:
	$(INSTALL_DIR) $(IDIR_LIBJASPER)/usr/lib
	$(CP) $(WRKINST)/usr/lib/libjasper*.so* \
		$(IDIR_LIBJASPER)/usr/lib

include ${ADK_TOPDIR}/mk/pkg-bottom.mk
