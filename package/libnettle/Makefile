# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(TOPDIR)/rules.mk

PKG_NAME:=		libnettle
PKG_VERSION:=		2.7.1
PKG_RELEASE:=		1
PKG_MD5SUM:=		003d5147911317931dd453520eb234a5
PKG_DESCR:=		crypto library
PKG_SECTION:=		libs
PKG_DEPENDS:=		libgmp
PKG_BUILDDEP:=		gmp
PKG_URL:=		http://www.lysator.liu.se/~nisse/
PKG_SITES:=		http://www.lysator.liu.se/~nisse/archive/

DISTFILES:=             nettle-${PKG_VERSION}.tar.gz
WRKDIST=		${WRKDIR}/nettle-${PKG_VERSION}

include $(TOPDIR)/mk/package.mk

$(eval $(call PKG_template,LIBNETTLE,libnettle,$(PKG_VERSION)-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))

libnettle-install:
	$(INSTALL_DIR) $(IDIR_LIBNETTLE)/usr/lib
	$(CP) $(WRKINST)/usr/lib/libnettle*.so* \
		$(IDIR_LIBNETTLE)/usr/lib
	$(CP) $(WRKINST)/usr/lib/libhogweed.so* \
		$(IDIR_LIBNETTLE)/usr/lib

include ${TOPDIR}/mk/pkg-bottom.mk
