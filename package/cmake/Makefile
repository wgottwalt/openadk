# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(TOPDIR)/rules.mk

PKG_NAME:=		cmake
PKG_VERSION:=		2.8.4
PKG_RELEASE:=		1
PKG_MD5SUM:=		209b7d1d04b2e00986538d74ba764fcf
PKG_DESCR:=		cmake utility
PKG_SECTION:=		lang
PKG_URL:=		http://www.cmake.org/
PKG_SITES:=		http://www.cmake.org/files/v2.8/

include $(TOPDIR)/mk/package.mk

$(eval $(call PKG_template,CMAKE,cmake,$(PKG_VERSION)-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))

CONFIG_STYLE:=		manual

pre-configure:
	(cd $(WRKBUILD); ./configure -prefix=/usr)

do-configure:
	

cmake-install:
	$(INSTALL_DIR) $(IDIR_CMAKE)/usr/bin
	$(INSTALL_BIN) $(WRKINST)/usr/bin/cmake \
		$(IDIR_CMAKE)/usr/bin

include ${TOPDIR}/mk/pkg-bottom.mk
