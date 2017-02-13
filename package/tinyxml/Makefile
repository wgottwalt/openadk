# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(ADK_TOPDIR)/rules.mk

PKG_NAME:=		tinyxml
PKG_VERSION:=		2.6.2
PKG_RELEASE:=		1
PKG_HASH:=		ac6bb9501c6f50cc922d22f26b02fab168db47521be5e845b83d3451a3e1d512
PKG_DESCR:=		simple, small, minimal, c++ xml parser
PKG_SECTION:=		libs/data
PKG_BUILDDEP:=		unzip-host
PKG_URL:=		http://sourceforge.net/projects/tinyxml/
PKG_SITES:=		${MASTER_SITE_SOURCEFORGE:=tinyxml/}
PKG_OPTS:=		dev

DISTFILES:=             ${PKG_NAME}_2_6_2.zip
WRKDIST=		${WRKDIR}/tinyxml

include $(ADK_TOPDIR)/mk/package.mk

$(eval $(call PKG_template,TINYXML,tinyxml,$(PKG_VERSION)-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION},${PKG_OPTS}))

TARGET_CXXFLAGS+=	-fPIC
CONFIG_STYLE:=		manual
INSTALL_STYLE:=		manual

tinyxml-install:
	$(INSTALL_DIR) $(IDIR_TINYXML)/usr/lib/
	$(CP) $(WRKBUILD)/libtinyxml*.so* \
		$(IDIR_TINYXML)/usr/lib
	$(INSTALL_DATA) $(WRKBUILD)/tiny{str,xml}.h \
		$(STAGING_TARGET_DIR)/usr/include
	$(INSTALL_DATA) ./files/tinyxml.pc \
		$(STAGING_TARGET_DIR)/usr/lib/pkgconfig

include ${ADK_TOPDIR}/mk/pkg-bottom.mk
