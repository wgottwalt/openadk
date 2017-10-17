# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(ADK_TOPDIR)/rules.mk

PKG_NAME:=		midori
PKG_VERSION:=		0.5.11
PKG_RELEASE:=		2
PKG_HASH:=		3b8f3a0fe8283fcbb0f9c88b2165e2689d3e18f7c1b5d275fff97cf20e7be198
PKG_DESCR:=		graphical web browser
PKG_SECTION:=		x11/apps
PKG_DEPENDS:=		libnotify webkitgtk gcr pango libatk cairo libsqlite
PKG_DEPENDS+=		gdk-pixbuf libgtk3 p11-kit libxcomposite at-spi2-atk
PKG_DEPENDS+=		libpng icu4c gstreamer gst-plugins-base dbus libgnutls
PKG_DEPENDS+=		libxslt libjpeg-turbo libtasn1 libnettle enchant
PKG_DEPENDS+=		libgmp at-spi2-core libxext
PKG_BUILDDEP:=		cmake-host vala-host libnotify webkitgtk gcr
PKG_BUILDDEP+=		librsvg-host librsvg pango atk cairo sqlite
PKG_BUILDDEP+=		gdk-pixbuf libgtk3 p11-kit libpng icu4c gstreamer
PKG_BUILDDEP+=		libXext
PKG_URL:=		http://www.midori-browser.org
PKG_SITES:=		http://distfiles.openadk.org/

PKG_ARCH_DEPENDS:=	!mips

WRKBUILD=               ${WRKDIR}/${PKG_NAME}-obj

include $(ADK_TOPDIR)/mk/package.mk

$(eval $(call PKG_template,MIDORI,midori,$(PKG_VERSION)-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))

CONFIG_STYLE:=          cmake
CMAKE_FLAGS+=		-DUSE_GTK3=ON \
			-DHALF_BRO_INCOM_WEBKIT2=ON \
			-DENABLE_NLS=OFF \
			-DUSE_ZEITGEIST=OFF

midori-install:
	$(INSTALL_DIR) $(IDIR_MIDORI)/usr/lib
	$(CP) $(WRKINST)/usr/lib/* \
		$(IDIR_MIDORI)/usr/lib
	$(INSTALL_DIR) $(IDIR_MIDORI)/usr/share
	$(CP) $(WRKINST)/usr/share/* \
		$(IDIR_MIDORI)/usr/share
	$(INSTALL_DIR) $(IDIR_MIDORI)/usr/bin
	$(INSTALL_BIN) $(WRKINST)/usr/bin/midori \
		$(IDIR_MIDORI)/usr/bin

include ${ADK_TOPDIR}/mk/pkg-bottom.mk
