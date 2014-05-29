# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(TOPDIR)/rules.mk

PKG_NAME:=		libjansson
PKG_VERSION:=		2.5
PKG_RELEASE:=		1
PKG_MD5SUM:=		46ac93bec48aacf207b67b51c8fbf7f1
PKG_DESCR:=		json library
PKG_SECTION:=		libs/data
PKG_URL:=		http://www.digip.org/jansson/
PKG_SITES:=		http://www.digip.org/jansson/releases/
PKG_OPTS:=		dev

DISTFILES:=             jansson-${PKG_VERSION}.tar.gz
WRKDIST=		${WRKDIR}/jansson-${PKG_VERSION}

include $(TOPDIR)/mk/package.mk

$(eval $(call PKG_template,LIBJANSSON,libjansson,$(PKG_VERSION)-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION},${PKG_OPTS}))

libjansson-install:
	$(INSTALL_DIR) $(IDIR_LIBJANSSON)/usr/lib
	$(CP) $(WRKINST)/usr/lib/libjansson*.so* \
		$(IDIR_LIBJANSSON)/usr/lib

include ${TOPDIR}/mk/pkg-bottom.mk
