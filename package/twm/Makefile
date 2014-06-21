# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(ADK_TOPDIR)/rules.mk

PKG_NAME:=		twm
PKG_VERSION:=		1.0.4
PKG_RELEASE:=		1
PKG_MD5SUM:=		109979bd39d48bd761e7939b30006a48
PKG_DESCR:=		simple window manager
PKG_SECTION:=		x11/apps
PKG_DEPENDS:=		xorg-server libstdcxx
PKG_BUILDDEP:=		xorg-server
PKG_URL:=		http://xorg.freedesktop.org/
PKG_SITES:=		http://xorg.freedesktop.org/archive/individual/app/

DISTFILES:=		${PKG_NAME}-${PKG_VERSION}.tar.gz
PKG_ARCH_DEPENDS:=	!m68k

include $(ADK_TOPDIR)/mk/package.mk

$(eval $(call PKG_template,TWM,twm,$(PKG_VERSION)-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))

twm-install:
	$(INSTALL_DIR) $(IDIR_TWM)/usr/bin
	$(INSTALL_BIN) $(WRKINST)/usr/bin/twm \
		$(IDIR_TWM)/usr/bin/
	${INSTALL_DIR} ${IDIR_TWM}/usr/share/X11/twm
	${INSTALL_DATA} ${WRKINST}/usr/share/X11/twm/system.twmrc \
		${IDIR_TWM}/usr/share/X11/twm/

include ${ADK_TOPDIR}/mk/pkg-bottom.mk
