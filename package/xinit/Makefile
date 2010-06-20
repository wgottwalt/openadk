# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(TOPDIR)/rules.mk

PKG_NAME:=		xinit
PKG_VERSION:=		1.2.1
PKG_RELEASE:=		1
PKG_MD5SUM:=		7ad82221ebd6600a8d33712ec3b62efb
PKG_DESCR:=		X Window System initializer
PKG_SECTION:=		x11
PKG_DEPENDS:=		xorg-server mcookie xauth
PKG_BUILDDEP+=		xorg-server
PKG_URL:=		http://xorg.freedesktop.org
PKG_SITES:=		http://xorg.freedesktop.org/archive/individual/app/

include $(TOPDIR)/mk/package.mk

$(eval $(call PKG_template,XINIT,$(PKG_NAME),$(PKG_VERSION)-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))

post-install:
	$(INSTALL_DIR) $(IDIR_XINIT)/usr/bin
	$(INSTALL_BIN) $(WRKINST)/usr/bin/{xinit,startx} \
		$(IDIR_XINIT)/usr/bin/
	${INSTALL_DIR} ${IDIR_XINIT}/usr/lib/X11/xinit
	${INSTALL_DATA} ${WRKINST}/usr/lib/X11/xinit/xinitrc \
		${IDIR_XINIT}/usr/lib/X11/xinit/

include ${TOPDIR}/mk/pkg-bottom.mk
