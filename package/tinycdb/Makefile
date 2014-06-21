# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(ADK_TOPDIR)/rules.mk

PKG_NAME:=		tinycdb
PKG_VERSION:=		0.77
PKG_RELEASE:=		1
PKG_MD5SUM:=		c00e5fb96c30356ac3b67b2ab5d5641b
PKG_DESCR:=		creating and reading constant data bases
PKG_SECTION:=		libs/db
PKG_URL:=		http://www.corpit.ru/mjt/tinycdb/
PKG_SITES:=		http://www.corpit.ru/mjt/tinycdb/
PKG_OPTS:=		dev devonly

DISTFILES:=             ${PKG_NAME}_${PKG_VERSION}.tar.gz

include $(ADK_TOPDIR)/mk/package.mk

$(eval $(call PKG_template,TINYCDB,tinycdb,$(PKG_VERSION)-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION},${PKG_OPTS}))

CONFIG_STYLE:=		manual

tinycdb-install:
	$(INSTALL_DIR) $(IDIR_TINYCDB_DEV)/usr/lib
	$(INSTALL_BIN) $(WRKINST)/usr/lib/libcdb.a \
		$(IDIR_TINYCDB_DEV)/usr/lib

include ${ADK_TOPDIR}/mk/pkg-bottom.mk
