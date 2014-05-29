# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(TOPDIR)/rules.mk

PKG_NAME:=		liblogging
PKG_VERSION:=		1.0.4
PKG_RELEASE:=		1
PKG_MD5SUM:=		034083ef1424a566fdeefc56a719691f
PKG_DESCR:=		standard logging library
PKG_SECTION:=		libs/misc
PKG_URL:=		http://www.liblogging.org/	
PKG_SITES:=		http://download.rsyslog.com/liblogging/
PKG_OPTS:=		dev

DISTFILES:=             ${PKG_NAME}-${PKG_VERSION}.tar.gz

include $(TOPDIR)/mk/package.mk

$(eval $(call PKG_template,LIBLOGGING,liblogging,$(PKG_VERSION)-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION},${PKG_OPTS}))

CONFIGURE_ARGS+=	--disable-man-pages \
			--disable-journal

liblogging-install:
	$(INSTALL_DIR) $(IDIR_LIBLOGGING)/usr/lib
	$(CP) $(WRKINST)/usr/lib/liblogging*.so* \
		$(IDIR_LIBLOGGING)/usr/lib

include ${TOPDIR}/mk/pkg-bottom.mk
