# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(TOPDIR)/rules.mk

PKG_NAME:=		tinyxml
PKG_VERSION:=		2.6.2
PKG_RELEASE:=		1
PKG_MD5SUM:=		2a0aaf609c9e670ec9748cd01ed52dae
PKG_DESCR:=		a simple, small, minimal, C++ XML parser
PKG_SECTION:=		libs
PKG_URL:=		http://sourceforge.net/projects/tinyxml/
PKG_SITES:=		${MASTER_SITE_SOURCEFORGE:=tinyxml/}
PKG_OPTS:=		dev

DISTFILES:=             ${PKG_NAME}_2_6_2.zip
WRKDIST=		${WRKDIR}/tinyxml

include $(TOPDIR)/mk/package.mk

$(eval $(call PKG_template,TINYXML,tinyxml,$(PKG_VERSION)-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION},${PKG_OPTS}))

CONFIG_STYLE:=		manual
INSTALL_STYLE:=		manual

tinyxml-install:
	$(INSTALL_DIR) $(IDIR_TINYXML)/usr/lib
	$(CP) $(WRKBUILD)/libtinyxml*.so* \
		$(IDIR_TINYXML)/usr/lib
	$(INSTALL_DATA) $(WRKBUILD)/tiny{str,xml}.h \
		$(STAGING_TARGET_DIR)/usr/include

include ${TOPDIR}/mk/pkg-bottom.mk
