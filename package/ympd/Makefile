# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(ADK_TOPDIR)/rules.mk

PKG_NAME:=		ympd
PKG_VERSION:=		1.2.2
PKG_RELEASE:=		1
PKG_MD5SUM:=		add md5sum of package here
PKG_DESCR:=		standalone mpd web gui written in c
PKG_SECTION:=		net/http
PKG_DEPENDS:=		libmpdclient
PKG_BUILDDEP:=		cmake-host libmpdclient
PKG_URL:=		http://www.ympd.org/
PKG_SITES:=		http://www.openadk.org/distfiles/

include $(ADK_TOPDIR)/mk/package.mk

$(eval $(call PKG_template,YMPD,ympd,$(PKG_VERSION)-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))

CONFIG_STYLE:=		cmake
TARGET_CFLAGS+=		-std=c99

pre-build:
	$(HOST_CC) -o $(WRKBUILD)/mkdata $(WRKBUILD)/htdocs/mkdata.c
	chmod 755 $(WRKBUILD)/mkdata

ympd-install:
	$(INSTALL_DIR) $(IDIR_YMPD)/usr/bin
	$(INSTALL_BIN) $(WRKINST)/usr/bin/ympd \
		$(IDIR_YMPD)/usr/bin

include ${ADK_TOPDIR}/mk/pkg-bottom.mk
