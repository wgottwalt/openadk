# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(TOPDIR)/rules.mk

PKG_NAME:=		xsetroot
PKG_VERSION:=		1.1.0
PKG_RELEASE:=		1
PKG_MD5SUM:=		5097ed5bbe1c621ee12950019f71de02
PKG_DESCR:=		set root window
PKG_SECTION:=		x11/apps
PKG_DEPENDS:=		libx11 libxmu libxcursor
PKG_BUILDDEP:=		xbitmaps libXcursor
PKG_SITES:=		${MASTER_SITE_XORG}

include $(TOPDIR)/mk/package.mk

$(eval $(call PKG_template,XSETROOT,$(PKG_NAME),$(PKG_VERSION)-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))

post-install:
	$(INSTALL_DIR) $(IDIR_XSETROOT)/usr/bin
	$(INSTALL_BIN) $(WRKINST)/usr/bin/xsetroot \
		$(IDIR_XSETROOT)/usr/bin

include ${TOPDIR}/mk/pkg-bottom.mk
