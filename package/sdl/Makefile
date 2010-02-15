# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(TOPDIR)/rules.mk

PKG_NAME:=		sdl
PKG_VERSION:=		1.2.14
PKG_RELEASE:=		1
PKG_MD5SUM:=		e52086d1b508fa0b76c52ee30b55bec4
PKG_DESCR:=		Simple DirectMedia Layer
PKG_SECTION:=		libs
PKG_DEPENDS:=		libusb alsa-lib libpthread tslib
PKG_BUILDDEP+=		libusb alsa-lib tslib
PKG_URL:=		http://www.libsdl.org
PKG_SITES:=		http://www.libsdl.org/release/

DISTFILES:=             SDL-${PKG_VERSION}.tar.gz
WRKDIST=		${WRKDIR}/SDL-${PKG_VERSION}

include $(TOPDIR)/mk/package.mk

$(eval $(call PKG_template,LIBSDL,libsdl,$(PKG_VERSION)-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))
$(eval $(call PKG_template,LIBSDL_DEV,libsdl-dev,$(PKG_VERSION)-${PKG_RELEASE},libsdl,${PKG_DESCR},${PKG_SECTION}))

SUB_INSTALLS-y:=
SUB_INSTALLS-m:=
SUB_INSTALLS-${ADK_PACKAGE_LIBSDL_DEV}+=	libsdl-dev-install

CONFIGURE_ARGS+=	--disable-esd \
			--disable-oss \
			--enable-alsa \
			--enable-video-fbcon \
			--disable-video-directfb \
			--disable-video-opengl \
			--enable-input-tslib \
			--with-x

post-install: ${SUB_INSTALLS-m} ${SUB_INSTALLS-y}
	$(INSTALL_DIR) $(IDIR_LIBSDL)/usr/lib
	$(CP) ${WRKINST}/usr/lib/libSDL*.so* $(IDIR_LIBSDL)/usr/lib

libsdl-dev-install:
	$(INSTALL_DIR) $(IDIR_LIBSDL_DEV)/usr/include/SDL
	$(CP) ${WRKINST}/usr/include/SDL/* $(IDIR_LIBSDL_DEV)/usr/include/SDL

include ${TOPDIR}/mk/pkg-bottom.mk
