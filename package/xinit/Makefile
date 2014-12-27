# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(ADK_TOPDIR)/rules.mk

PKG_NAME:=		xinit
PKG_VERSION:=		1.2.1
PKG_RELEASE:=		5
PKG_HASH:=		3079d3fb86af99f4c2c2907b5725e5820fdb2144d3be6002ec367bfcebc5c480
PKG_DESCR:=		x window system initializer
PKG_SECTION:=		x11/utils
PKG_DEPENDS:=		xorg-server mcookie xauth xset xterm libstdcxx
PKG_BUILDDEP:=		xorg-server
PKG_URL:=		http://xorg.freedesktop.org/
PKG_SITES:=		http://xorg.freedesktop.org/archive/individual/app/

DISTFILES:=		${PKG_NAME}-${PKG_VERSION}.tar.gz

PKG_ARCH_DEPENDS:=	!m68k

include $(ADK_TOPDIR)/mk/package.mk

$(eval $(call PKG_template,XINIT,xinit,$(PKG_VERSION)-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))

TARGET_CPPFLAGS+=	-D_POSIX_SOURCE
CONFIGURE_ARGS:=	--without-launchd
XAKE_FLAGS+=		RAWCPP="$(TARGET_CROSS)cpp"

xinit-install:
	$(INSTALL_DIR) $(IDIR_XINIT)/usr/bin
	$(INSTALL_BIN) $(WRKINST)/usr/bin/{xinit,startx} \
		$(IDIR_XINIT)/usr/bin/
	${INSTALL_DIR} ${IDIR_XINIT}/usr/lib/X11/xinit
	${INSTALL_DATA} ${WRKINST}/usr/lib/X11/xinit/xinitrc \
		${IDIR_XINIT}/usr/lib/X11/xinit/

include ${ADK_TOPDIR}/mk/pkg-bottom.mk
