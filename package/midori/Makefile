# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(TOPDIR)/rules.mk

PKG_NAME:=		midori
PKG_VERSION:=		0.5.8
PKG_RELEASE:=		1
PKG_MD5SUM:=		5815eac39f4d9511ce2c71a81567647f
PKG_DESCR:=		web browser
PKG_SECTION:=		x11/apps
PKG_DEPENDS:=		libnotify webkitgtk
PKG_BUILDDEP:=		autotool cmake-host vala-host libnotify webkitgtk
PKG_BUILDDEP+=		librsvg-host librsvg
PKG_URL:=		http://www.midori-browser.org
PKG_SITES:=		http://www.openadk.org/distfiles/

WRKBUILD=               ${WRKDIR}/${PKG_NAME}-obj

include $(TOPDIR)/mk/package.mk

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

include ${TOPDIR}/mk/pkg-bottom.mk
