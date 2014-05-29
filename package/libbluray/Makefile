# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(TOPDIR)/rules.mk

PKG_NAME:=		libbluray
PKG_VERSION:=		0.4.0
PKG_RELEASE:=		2
PKG_MD5SUM:=		c7a1cc71cb9747f93122ec650d4ae933
PKG_DESCR:=		bluray library
PKG_SECTION:=		libs/video
PKG_BUILDDEP:=		libxml2
PKG_URL:=		http://www.videolan.org/developers/libbluray.html
PKG_SITES:=		ftp://ftp.videolan.org/pub/videolan/libbluray/${PKG_VERSION}/
PKG_OPTS:=		dev

DISTFILES:=             ${PKG_NAME}-${PKG_VERSION}.tar.bz2

include $(TOPDIR)/mk/package.mk

$(eval $(call PKG_template,LIBBLURAY,libbluray,$(PKG_VERSION)-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION},${PKG_OPTS}))

libbluray-install:
	$(INSTALL_DIR) $(IDIR_LIBBLURAY)/usr/lib
	$(CP) $(WRKINST)/usr/lib/libbluray*.so* \
		$(IDIR_LIBBLURAY)/usr/lib

include ${TOPDIR}/mk/pkg-bottom.mk
