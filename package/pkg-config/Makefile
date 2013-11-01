# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(TOPDIR)/rules.mk

PKG_NAME:=		pkg-config
PKG_VERSION:=		0.28
PKG_RELEASE:=		2
PKG_MD5SUM:=		aa3c86e67551adc3ac865160e34a2a0d
PKG_DESCR:=		a helper tool used when compiling applications and libraries.
PKG_SECTION:=		lang
PKG_DEPENDS:=		glib libpopt
PKG_BUILDDEP:=		glib popt pkg-config-host
PKG_URL:=		http://pkg-config.freedesktop.org/wiki/
PKG_SITES:=		http://pkgconfig.freedesktop.org/releases/

include $(TOPDIR)/mk/host.mk
include $(TOPDIR)/mk/package.mk

$(eval $(call HOST_template,PKG_CONFIG,pkg-config,$(PKG_VERSION)-${PKG_RELEASE}))
$(eval $(call PKG_template,PKG_CONFIG,pkg-config,$(PKG_VERSION)-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))

HOST_STYLE:=		auto
HOST_CONFIGURE_ARGS+=	--with-internal-glib \
			--disable-host-tool
CONFIGURE_ARGS+=	--with-installed-glib \
			--with-installed-popt

pkg-config-install:
	$(INSTALL_DIR) $(IDIR_PKG_CONFIG)/usr/bin
	$(INSTALL_BIN) $(WRKINST)/usr/bin/pkg-config \
		$(IDIR_PKG_CONFIG)/usr/bin

include ${TOPDIR}/mk/host-bottom.mk
include ${TOPDIR}/mk/pkg-bottom.mk
