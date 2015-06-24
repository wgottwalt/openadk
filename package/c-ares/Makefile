# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(ADK_TOPDIR)/rules.mk

PKG_NAME:=		c-ares
PKG_VERSION:=		1.10.0
PKG_RELEASE:=		1
PKG_HASH:=		3d701674615d1158e56a59aaede7891f2dde3da0f46a6d3c684e0ae70f52d3db
PKG_DESCR:=		c-ares asynchronous dns lib
PKG_SECTION:=		libs/net
PKG_URL:=		http://c-ares.haxx.se
PKG_SITES:=		http://c-ares.haxx.se/download/
PKG_OPTS:=		dev

# if downloaded package is not ending with .tar.xz use following
DISTFILES:=             ${PKG_NAME}-${PKG_VERSION}.tar.gz

include $(ADK_TOPDIR)/mk/package.mk

$(eval $(call PKG_template,C_ARES,c-ares,$(PKG_VERSION)-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION},${PKG_OPTS}))

c-ares-install:
	$(INSTALL_DIR) $(IDIR_C_ARES)/usr/lib
	$(CP) $(WRKINST)/usr/lib/libcares*.so* \
		$(IDIR_C_ARES)/usr/lib

include ${ADK_TOPDIR}/mk/pkg-bottom.mk
