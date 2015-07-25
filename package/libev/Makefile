# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(ADK_TOPDIR)/rules.mk

PKG_NAME:=		libev
PKG_VERSION:=		4.20
PKG_RELEASE:=		1
PKG_HASH:=		f870334c7fa961e7f31087c7d76abf849f596e3048f8ed2a0aaa983cd73d449e
PKG_DESCR:=		full-featured and high-performance event loop
PKG_SECTION:=		libs/misc
PKG_URL:=		http://software.schmorp.de/pkg/libev.html
PKG_SITES:=		http://dist.schmorp.de/libev/
PKG_OPTS:=		dev

DISTFILES:=             ${PKG_NAME}-${PKG_VERSION}.tar.gz

include $(ADK_TOPDIR)/mk/package.mk

$(eval $(call PKG_template,LIBEV,libev,$(PKG_VERSION)-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION},${PKG_OPTS}))

libev-install:
	$(INSTALL_DIR) $(IDIR_LIBEV)/usr/lib
	$(CP) $(WRKINST)/usr/lib/libev*.so* \
		$(IDIR_LIBEV)/usr/lib

include ${ADK_TOPDIR}/mk/pkg-bottom.mk
