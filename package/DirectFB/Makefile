# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(TOPDIR)/rules.mk

PKG_NAME:=		DirectFB
PKG_VERSION:=		1.6.3
PKG_RELEASE:=		1
PKG_EXTRAVER:=		1.6-0
PKG_MD5SUM:=		641e8e999c017770da647f9b5b890906
PKG_DESCR:=		Thin graphic library for the Linux framebuffer devices
PKG_SECTION:=		libs
PKG_DEPENDS:=		libpng libjpeg libfreetype
PKG_BUILDDEP:=		libpng jpeg freetype
PKG_URL:=		http://www.directfb.org/
PKG_SITES:=		http://directfb.org/downloads/Core/DirectFB-1.6/

PKG_SUBPKGS:=		DIRECTFB DIRECTFB_DEV
PKGSD_DIRECTFB_DEV:=	development files for DirectFB
PKGSC_DIRECTFB_DEV:=	devel

include $(TOPDIR)/mk/package.mk

$(eval $(call PKG_template,DIRECTFB,directfb,$(PKG_VERSION)-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))
$(eval $(call PKG_template,DIRECTFB_DEV,directfb-dev,$(PKG_VERSION)-${PKG_RELEASE},${PKG_DEPENDS},${PKGSD_DIRECTFB_DEV},${PKGSC_DIRECTFB_DEV}))

TARGET_LDFLAGS+=	-L$(STAGING_DIR)/usr/lib64 -L$(STAGING_DIR)/usr/lib32
CONFIGURE_ARGS+=	--with-inputdrivers=linuxinput,keyboard,ps2mouse \
			--with-gfxdrivers=none \
			--without-tools \
			--enable-fbdev \
			--disable-sdl \
			--disable-osx \
			--disable-x11 \
			--disable-gif \
			--enable-png \
			--disable-debug \
			--disable-trace \
			--enable-text \
			--enable-jpeg

# This is to overcome libtool fuckup - when building without,
# libtool calls (the correct) ld directly without parameters,
# which then chooses the wrong default emulation (which is
# probably the real problem here).
ifeq (${ADK_TARGET_SYSTEM_LEMOTE_YEELONG},y)
XAKE_FLAGS+=		LDFLAGS=$(ADK_TARGET_ABI_CFLAGS)
endif

post-install:
	${INSTALL_DIR} ${IDIR_DIRECTFB}/etc
	${INSTALL_DATA} ./files/directfbrc ${IDIR_DIRECTFB}/etc
	$(INSTALL_DIR) $(IDIR_DIRECTFB)/usr/lib/directfb-${PKG_EXTRAVER}/{inputdrivers,systems,wm}
	${CP} $(WRKINST)/usr/lib/lib{direct,fusion}*.so* \
		$(IDIR_DIRECTFB)/usr/lib
	${CP} ${WRKINST}/usr/lib/directfb-${PKG_EXTRAVER}/inputdrivers/*.so \
		${IDIR_DIRECTFB}/usr/lib/directfb-${PKG_EXTRAVER}/inputdrivers
	${CP} ${WRKINST}/usr/lib/directfb-${PKG_EXTRAVER}/systems/*.so \
		${IDIR_DIRECTFB}/usr/lib/directfb-${PKG_EXTRAVER}/systems
	${CP} ${WRKINST}/usr/lib/directfb-${PKG_EXTRAVER}/wm/*.so \
		${IDIR_DIRECTFB}/usr/lib/directfb-${PKG_EXTRAVER}/wm
	$(INSTALL_DIR) $(IDIR_DIRECTFB)/usr/lib/directfb-${PKG_EXTRAVER}/interfaces/IDirectFB{Font,ImageProvider,VideoProvider}
	${CP} ${WRKINST}/usr/lib/directfb-${PKG_EXTRAVER}/interfaces/IDirectFBFont/*.so \
		${IDIR_DIRECTFB}/usr/lib/directfb-${PKG_EXTRAVER}/interfaces/IDirectFBFont
	${CP} ${WRKINST}/usr/lib/directfb-${PKG_EXTRAVER}/interfaces/IDirectFBImageProvider/*.so \
		${IDIR_DIRECTFB}/usr/lib/directfb-${PKG_EXTRAVER}/interfaces/IDirectFBImageProvider
	${CP} ${WRKINST}/usr/lib/directfb-${PKG_EXTRAVER}/interfaces/IDirectFBVideoProvider/*.so \
		${IDIR_DIRECTFB}/usr/lib/directfb-${PKG_EXTRAVER}/interfaces/IDirectFBVideoProvider

directfb-dev-install:
	${INSTALL_DIR} ${IDIR_DIRECTFB_DEV}/usr/include
	${CP} ${WRKINST}/usr/include/directfb ${IDIR_DIRECTFB_DEV}/usr/include
	${INSTALL_DIR} ${IDIR_DIRECTFB_DEV}/usr/bin
	${INSTALL_BIN} ${WRKINST}/usr/bin/directfb-config \
		${IDIR_DIRECTFB_DEV}/usr/bin

include ${TOPDIR}/mk/pkg-bottom.mk
