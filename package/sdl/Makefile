# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(TOPDIR)/rules.mk

PKG_NAME:=		sdl
PKG_VERSION:=		1.2.14
PKG_RELEASE:=		3
PKG_MD5SUM:=		e52086d1b508fa0b76c52ee30b55bec4
PKG_DESCR:=		simple directmedia layer
PKG_SECTION:=		libs/misc
PKG_DEPENDS:=		libusb alsa-lib libpthread libx11 libxext
PKG_BUILDDEP:=		sdl-host libusb alsa-lib libX11 libXext
PKG_URL:=		http://www.libsdl.org/
PKG_SITES:=		http://www.libsdl.org/release/
PKG_LIBNAME:=		libsdl
PKG_OPTS:=		dev

PKG_FLAVOURS_LIBSDL:=	WITH_TSLIB
PKGFD_WITH_TSLIB:=	enable touchscreen support
PKGFS_WITH_TSLIB:=	tslib
PKGFB_WITH_TSLIB:=	tslib

DISTFILES:=             SDL-${PKG_VERSION}.tar.gz
WRKDIST=		${WRKDIR}/SDL-${PKG_VERSION}

include $(TOPDIR)/mk/host.mk
include $(TOPDIR)/mk/package.mk

$(eval $(call HOST_template,LIBSDL,libsdl,$(PKG_VERSION)-${PKG_RELEASE}))
$(eval $(call PKG_template,LIBSDL,libsdl,$(PKG_VERSION)-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION},${PKG_OPTS}))

HOST_STYLE:=		auto
HOST_CONFIGURE_ARGS+=	--without-x \
			--enable-shared \
			--disable-cdrom \
			--disable-joystick \
			--disable-audio \
			--disable-video \
			--disable-assembly \
			--disable-input-tslib \
			--disable-video-directfb \
			--disable-video-cocoa \
			--disable-video-opengl

ifeq ($(ADK_PACKAGE_SDL_WITH_TSLIB),y)
CONFIGURE_ARGS+=	--enable-input-tslib
endif
CONFIGURE_ARGS+=	--disable-esd \
			--disable-oss \
			--enable-alsa \
			--enable-video-fbcon \
			--disable-video-directfb \
			--disable-video-opengl \
			--disable-video-ps2gs \
			--disable-video-ps3 \
			--with-x

libsdl-install:
	$(INSTALL_DIR) $(IDIR_LIBSDL)/usr/lib
	$(CP) ${WRKINST}/usr/lib/libSDL*.so* $(IDIR_LIBSDL)/usr/lib

include ${TOPDIR}/mk/host-bottom.mk
include ${TOPDIR}/mk/pkg-bottom.mk
