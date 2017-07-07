# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(ADK_TOPDIR)/rules.mk

PKG_NAME:=		ympd
PKG_VERSION:=		3df5b36b97b7a5b0c9adeba39b9987d9aa58a7fb
PKG_GIT:=		hash
PKG_RELEASE:=		2
PKG_DESCR:=		standalone music player daemon web gui
PKG_SECTION:=		net/http
PKG_DEPENDS:=		libmpdclient
PKG_BUILDDEP:=		cmake-host libmpdclient
PKG_URL:=		http://www.ympd.org/
PKG_SITES:=		https://github.com/notandy/ympd.git

include $(ADK_TOPDIR)/mk/package.mk

$(eval $(call PKG_template,YMPD,ympd,$(PKG_VERSION)-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))

XAKE_FLAGS+=		GCC_HONOUR_COPTS=s
CONFIG_STYLE:=		cmake
TARGET_CFLAGS+=		-std=c99

ympd-install:
	$(INSTALL_DIR) $(IDIR_YMPD)/usr/bin
	$(INSTALL_BIN) $(WRKINST)/usr/bin/ympd \
		$(IDIR_YMPD)/usr/bin

include ${ADK_TOPDIR}/mk/pkg-bottom.mk
