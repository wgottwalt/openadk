# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(ADK_TOPDIR)/rules.mk

PKG_NAME:=		rxvt-unicode
PKG_VERSION:=		9.21
PKG_RELEASE:=		1
PKG_HASH:=		75270ed72bc5895a64a1d7392bf45a622204192371c3965bd3dd978dc088956b
PKG_DESCR:=		terminal emulator with unicode support
PKG_SECTION:=		x11/apps
PKG_DEPENDS:=		libx11 fontconfig libxft libxml2 gdk-pixbuf
PKG_BUILDDEP:=		libX11 fontconfig libXft libxml2 gdk-pixbuf
PKG_NEEDS:=		c++
PKG_URL:=		http://software.schmorp.de/pkg/rxvt-unicode.html
PKG_SITES:=		http://dist.schmorp.de/rxvt-unicode/

DISTFILES:=             ${PKG_NAME}-${PKG_VERSION}.tar.bz2

include $(ADK_TOPDIR)/mk/package.mk

$(eval $(call PKG_template,RXVT_UNICODE,rxvt-unicode,$(PKG_VERSION)-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))

TARGET_LDFLAGS+=	-lpthread
CONFIGURE_ARGS+=	--disable-perl \
			--disable-utmp \
			--disable-afterimage

rxvt-unicode-install:
	$(INSTALL_DIR) $(IDIR_RXVT_UNICODE)/usr/bin
	$(INSTALL_BIN) $(WRKINST)/usr/bin/urxvt \
		$(IDIR_RXVT_UNICODE)/usr/bin

include ${ADK_TOPDIR}/mk/pkg-bottom.mk
