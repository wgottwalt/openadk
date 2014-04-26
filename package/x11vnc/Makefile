# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(TOPDIR)/rules.mk

PKG_NAME:=		x11vnc
PKG_VERSION:=		0.9.13
PKG_RELEASE:=		1
PKG_MD5SUM:=		a372ec4fe8211221547b1c108cf56e4c
PKG_DESCR:=		VNC server for X11 displays
PKG_SECTION:=		x11/apps
PKG_BUILDDEP:=		libX11 libXtst libjpeg-turbo
PKG_URL:=		http://www.karlrunge.com/x11vnc/
PKG_SITES:=		http://sourceforge.net/projects/libvncserver/files/x11vnc/0.9.13/

DISTFILES:=		${PKG_NAME}-${PKG_VERSION}.tar.gz


include $(TOPDIR)/mk/package.mk

$(eval $(call PKG_template,X11VNC,x11vnc,$(PKG_VERSION)-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))

ifeq ($(ADK_STATIC),y)
MAKE_FLAGS+=		CFLAGS="${TARGET_CFLAGS} -static" \
			LIBS="-lxcb -lXau -lXdmcp -ldl -pthread -ljpeg -lz"
endif

CONFIGURE_ARGS+=	--without-ssl

x11vnc-install:
	$(INSTALL_DIR) $(IDIR_X11VNC)/usr/bin
	$(INSTALL_BIN) $(WRKINST)/usr/bin/x11vnc \
		$(IDIR_X11VNC)/usr/bin

include ${TOPDIR}/mk/pkg-bottom.mk
