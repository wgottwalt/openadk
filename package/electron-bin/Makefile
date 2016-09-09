# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(ADK_TOPDIR)/rules.mk

PKG_NAME:=		electron-bin
PKG_VERSION:=		1.3.5
PKG_RELEASE:=		1
PKG_HASH:=		a1b17b04de4ab4d7bdc92500abfaca7d1d53c496c2175fd685e2b84b24fbfeff
PKG_DESCR:=		build cross platform desktop apps
PKG_SECTION:=		x11/apps
PKG_DEPENDS:=		alsa-lib nss nspr expat pango cairo cups libxcursor
PKG_DEPENDS+=		libdbus libatk glib libxtst libgtk2 gdk-pixbuf libxcomposite
PKG_DEPENDS+=		libxscrnsaver gconf harfbuzz libpng
PKG_URL:=		http://electron.atom.io
PKG_SITES:=		https://github.com/electron/electron/releases/download/v$(PKG_VERSION)/

PKG_ARCH_DEPENDS:=	x86_64

EXTRACT_OVERRIDE=	1
DISTFILES:=             electron-v$(PKG_VERSION)-linux-x64.zip
WRKDIST=		${WRKDIR}/electron

include $(ADK_TOPDIR)/mk/package.mk

$(eval $(call PKG_template,ELECTRON_BIN,electron-bin,$(PKG_VERSION)-$(PKG_RELEASE),$(PKG_DEPENDS),$(PKG_DESCR),$(PKG_SECTION)))

CONFIG_STYLE:=		manual
BUILD_STYLE:=		manual
INSTALL_STYLE:=		manual

do-extract:
	mkdir -p ${WRKDIST}
	(cd ${WRKDIST}; cat $(ADK_TOPDIR)/dl/electron-v$(PKG_VERSION)-linux-x64.zip \
		| PATH="$(HOST_PATH)" cpio -id -H zip)

electron-bin-install:
	$(INSTALL_DIR) $(IDIR_ELECTRON_BIN)/opt/electron
	$(CP) $(WRKDIST)/* $(IDIR_ELECTRON_BIN)/opt/electron
	chmod 755 $(IDIR_ELECTRON_BIN)/opt/electron/electron
	$(INSTALL_DIR) $(IDIR_ELECTRON_BIN)/etc
	$(CP) ./files/xinitrc $(IDIR_ELECTRON_BIN)/etc

include $(ADK_TOPDIR)/mk/pkg-bottom.mk
