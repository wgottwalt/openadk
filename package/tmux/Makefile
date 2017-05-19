# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(ADK_TOPDIR)/rules.mk

PKG_NAME:=		tmux
PKG_VERSION:=		2.4
PKG_RELEASE:=		1
PKG_HASH:=		757d6b13231d0d9dd48404968fc114ac09e005d475705ad0cd4b7166f799b349
PKG_DESCR:=		terminal multiplexer
PKG_SECTION:=		sys/utils
PKG_BUILDDEP:=		libevent ncurses
PKG_DEPENDS:=		libevent libncurses
PKG_NEEDS:=		threads
PKG_URL:=		http://tmux.github.io
PKG_SITES:=		https://github.com/tmux/tmux/releases/download/$(PKG_VERSION)/

DISTFILES:=             $(PKG_NAME)-$(PKG_VERSION).tar.gz

include $(ADK_TOPDIR)/mk/package.mk

$(eval $(call PKG_template,TMUX,tmux,$(PKG_VERSION)-$(PKG_RELEASE),$(PKG_DEPENDS),$(PKG_DESCR),$(PKG_SECTION)))

TARGET_LDFLAGS+=	-ltinfo
CONFIGURE_ARGS+=	--disable-static

tmux-install:
	$(INSTALL_DIR) $(IDIR_TMUX)/usr/bin
	$(INSTALL_BIN) $(WRKINST)/usr/bin/tmux \
		$(IDIR_TMUX)/usr/bin

include $(ADK_TOPDIR)/mk/pkg-bottom.mk
