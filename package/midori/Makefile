# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(ADK_TOPDIR)/rules.mk

PKG_NAME:=		midori
PKG_VERSION:=		0.5.9
PKG_RELEASE:=		1
PKG_HASH:=		2fe13e17c310a2277c52e4fad932614963410305d10a48df0f0c5d210ebd51c5
PKG_DESCR:=		graphical web browser
PKG_SECTION:=		x11/apps
PKG_DEPENDS:=		libnotify webkitgtk
PKG_BUILDDEP:=		cmake-host vala-host libnotify webkitgtk
PKG_BUILDDEP+=		librsvg-host librsvg
PKG_URL:=		http://www.midori-browser.org
PKG_SITES:=		http://www.openadk.org/distfiles/

PKG_CFLINE_MIDORI:=	depends on ADK_BROKEN

WRKBUILD=               ${WRKDIR}/${PKG_NAME}-obj

include $(ADK_TOPDIR)/mk/package.mk

$(eval $(call PKG_template,MIDORI,midori,$(PKG_VERSION)-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))

CONFIG_STYLE:=          manual

do-configure:
	(cd $(WRKBUILD) && PATH='${HOST_PATH}' \
		cmake -DCMAKE_SYSTEM_NAME=Linux \
		-DCMAKE_INSTALL_PREFIX=/usr \
		-DENABLE_NLS=0 \
		-DUSE_ZEITGEIST=0 \
		$(WRKSRC)/)

midori-install:
	$(INSTALL_DIR) $(IDIR_MIDORI)/usr/bin
	$(INSTALL_BIN) $(WRKINST)/usr/bin/midori \
		$(IDIR_MIDORI)/usr/bin

include ${ADK_TOPDIR}/mk/pkg-bottom.mk
