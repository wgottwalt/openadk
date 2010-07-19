# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(TOPDIR)/rules.mk

PKG_NAME:=		pkg-config
PKG_VERSION:=		0.25
PKG_RELEASE:=		1
PKG_MD5SUM:=		a3270bab3f4b69b7dc6dbdacbcae9745
PKG_DESCR:=		a helper tool used when compiling applications and libraries.
PKG_SECTION:=		lang
PKG_BUILDDEP+=		glib popt
PKG_DEPENDS:=		glib libpopt
PKG_URL:=		http://pkg-config.freedesktop.org/wiki/
PKG_SITES:=		http://pkgconfig.freedesktop.org/releases/

include $(TOPDIR)/mk/package.mk

$(eval $(call PKG_template,PKG_CONFIG,$(PKG_NAME),$(PKG_VERSION)-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))

CONFIGURE_ARGS+=	--with-installed-glib \
			--with-installed-popt

post-install:
	$(INSTALL_DIR) $(IDIR_PKG_CONFIG)/usr/bin
	$(INSTALL_BIN) $(WRKINST)/usr/bin/pkg-config \
		$(IDIR_PKG_CONFIG)/usr/bin

include ${TOPDIR}/mk/pkg-bottom.mk
