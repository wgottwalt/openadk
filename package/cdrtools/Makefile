# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(TOPDIR)/rules.mk

PKG_NAME:=		cdrtools
PKG_VERSION:=		3.01
PKG_RELEASE:=		1
PKG_MD5SUM:=		afd4563e335a614a11e042c7b6734d66
PKG_DESCR:=		cdrtools
PKG_SECTION:=		misc
PKG_URL:=		http://cdrecord.berlios.de/private/cdrecord.html
PKG_SITES:=		http://openadk.org/

PKG_CFLINE_CDRTOOLS:=	depends on ADK_BROKEN

include $(TOPDIR)/mk/package.mk

$(eval $(call PKG_template,CDRTOOLS,cdrtools,$(PKG_VERSION)-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))

CONFIG_STYLE:=		manual
XAKE_FLAGS+=		GCC_HONOUR_COPTS=s

cdrtools-install:
	$(INSTALL_DIR) $(IDIR_CDRTOOLS)/usr/bin
	$(INSTALL_BIN) $(WRKINST)/opt/schily/bin/cdrecord \
		$(IDIR_CDRTOOLS)/usr/bin
	$(INSTALL_BIN) $(WRKINST)/opt/schily/bin/readcd \
		$(IDIR_CDRTOOLS)/usr/bin
	$(INSTALL_BIN) $(WRKINST)/opt/schily/bin/mkisofs \
		$(IDIR_CDRTOOLS)/usr/bin
	$(INSTALL_BIN) $(WRKINST)/opt/schily/bin/cdda2wav \
		$(IDIR_CDRTOOLS)/usr/bin

include ${TOPDIR}/mk/pkg-bottom.mk
