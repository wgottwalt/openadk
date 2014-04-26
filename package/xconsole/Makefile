# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(TOPDIR)/rules.mk

PKG_NAME:=		xconsole
PKG_VERSION:=		1.0.4
PKG_RELEASE:=		1
PKG_MD5SUM:=		c617acec432901a3c1a2b23b022624cb
PKG_DESCR:=		X console app
PKG_SECTION:=		x11/apps
PKG_BUILDDEP:=		libXaw
PKG_URL:=		http://xorg.freedesktop.org/
PKG_SITES:=		${MASTER_SITE_XORG}

DISTFILES:=		${PKG_NAME}-${PKG_VERSION}.tar.gz

include $(TOPDIR)/mk/package.mk

$(eval $(call PKG_template,XCONSOLE,xconsole,$(PKG_VERSION)-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))

xconsole-install:
	$(INSTALL_DIR) $(IDIR_XCONSOLE)/usr/bin
	$(INSTALL_BIN) $(WRKINST)/usr/bin/xconsole \
		$(IDIR_XCONSOLE)/usr/bin

include ${TOPDIR}/mk/pkg-bottom.mk
