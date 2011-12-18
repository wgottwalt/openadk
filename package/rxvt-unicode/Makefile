# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(TOPDIR)/rules.mk

PKG_NAME:=		rxvt-unicode
PKG_VERSION:=		9.07
PKG_RELEASE:=		1
PKG_MD5SUM:=		49bb52c99e002bf85eb41d8385d903b5
PKG_DESCR:=		x-term with unicode support
PKG_SECTION:=		x11/apps
PKG_DEPENDS:=		libx11 fontconfig libxft libxml2
PKG_BUILDDEP:=		libX11 fontconfig libXft libxml2
PKG_URL:=		http://software.schmorp.de/pkg/rxvt-unicode.html
PKG_SITES:=		http://dist.schmorp.de/rxvt-unicode/
PKG_NEED_CXX:=		1

PKG_ARCH_DEPENDS:=	!avr32

DISTFILES:=             ${PKG_NAME}-${PKG_VERSION}.tar.bz2

include $(TOPDIR)/mk/package.mk

$(eval $(call PKG_template,RXVT_UNICODE,$(PKG_NAME),$(PKG_VERSION)-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))

CONFIGURE_ARGS+=	--disable-perl \
			--disable-utmp \
			--disable-afterimage

post-install:
	$(INSTALL_DIR) $(IDIR_RXVT_UNICODE)/usr/bin
	$(INSTALL_BIN) $(WRKINST)/usr/bin/urxvt \
		$(IDIR_RXVT_UNICODE)/usr/bin

include ${TOPDIR}/mk/pkg-bottom.mk
