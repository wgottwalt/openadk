# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(ADK_TOPDIR)/rules.mk

PKG_NAME:=		transmission
PKG_VERSION:=		2.84
PKG_RELEASE:=		1
PKG_HASH:=		a9fc1936b4ee414acc732ada04e84339d6755cd0d097bcbd11ba2cfc540db9eb
PKG_DESCR:=		torrent client
PKG_SECTION:=		app/p2p
PKG_BUILDDEP:=		libressl libevent curl
PKG_DEPENDS:=		libressl libevent libcurl
PKG_NEEDS:=		threads rt
PKG_URL:=		http://www.transmissionbt.com
PKG_SITES:=		http://download.transmissionbt.com/files/

include $(ADK_TOPDIR)/mk/package.mk

$(eval $(call PKG_template,TRANSMISSION,transmission,$(PKG_VERSION)-$(PKG_RELEASE),$(PKG_DEPENDS),$(PKG_DESCR),$(PKG_SECTION)))

transmission-install:
	$(INSTALL_DIR) $(IDIR_TRANSMISSION)/usr/share
	$(CP) $(WRKINST)/usr/share/transmission \
		$(IDIR_TRANSMISSION)/usr/share
	$(INSTALL_DIR) $(IDIR_TRANSMISSION)/usr/bin
	$(CP) $(WRKINST)/usr/bin/transmission* \
		$(IDIR_TRANSMISSION)/usr/bin

include $(ADK_TOPDIR)/mk/pkg-bottom.mk
