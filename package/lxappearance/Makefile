# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(TOPDIR)/rules.mk

PKG_NAME:=		lxappearance
PKG_VERSION:=		0.5.0
PKG_RELEASE:=		1
PKG_MD5SUM:=		7eabab6f4a358dbc6a84e260a0e7f6c2
PKG_DESCR:=		LXDE ...
PKG_SECTION:=		x11/lxde
PKG_BUILDDEP:=		gtk+
PKG_URL:=		http://lxde.org/
PKG_SITES:=		http://netcologne.dl.sourceforge.net/project/lxde/LXAppearance/

include $(TOPDIR)/mk/package.mk

$(eval $(call PKG_template,LXAPPEARANCE,lxappearance,$(PKG_VERSION)-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))

XAKE_FLAGS+=		CPPFLAGS_FOR_BUILD="-I/usr/include/glib-2.0 -I/usr/lib/glib-2.0/include"

lxappearance-install:
	$(INSTALL_DIR) $(IDIR_LXAPPEARANCE)/usr/bin
	$(INSTALL_BIN) $(WRKINST)/usr/bin/lxappearance \
		$(IDIR_LXAPPEARANCE)/usr/bin

include ${TOPDIR}/mk/pkg-bottom.mk
