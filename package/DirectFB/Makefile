# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(TOPDIR)/rules.mk

PKG_NAME:=		DirectFB
PKG_VERSION:=		1.4.11
PKG_RELEASE:=		1
PKG_EXTRAVER:=		1.4-5
PKG_MD5SUM:=		94735ccec21120794adcce93a61445d2
PKG_DESCR:=		Thin graphic library for the Linux framebuffer devices
PKG_SECTION:=		libs
PKG_DEPENDS:=		libpng libjpeg
PKG_BUILDDEP:=		libpng jpeg
PKG_URL:=		http://www.directfb.org/
PKG_SITES:=		http://directfb.org/downloads/Core/DirectFB-1.4/

PKG_SUBPKGS:=		DIRECTFB DIRECTFB_DEV
PKGSD_DIRECTFB_DEV:=	development files for DirectFB
PKGSC_DIRECTFB_DEV:=	devel

include $(TOPDIR)/mk/package.mk

$(eval $(call PKG_template,DIRECTFB,directfb,$(PKG_VERSION)-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))
$(eval $(call PKG_template,DIRECTFB_DEV,directfb-dev,$(PKG_VERSION)-${PKG_RELEASE},${PKG_DEPENDS},${PKGSD_DIRECTFB_DEV},${PKGSC_DIRECTFB_DEV}))

CONFIGURE_ARGS+=	--with-inputdrivers=linuxinput,keyboard,ps2mouse \
			--with-gfxdrivers=none \
			--without-tools \
			--enable-fbdev \
			--disable-sdl \
			--disable-osx \
			--disable-x11 \
			--disable-gif \
			--enable-png \
			--enable-jpeg

# This is to overcome libtool fuckup - when building without,
# libtool calls (the correct) ld directly without parameters,
# which then chooses the wrong default emulation (which is
# probably the real problem here). LDEMULATION overrides ld's
# wrong choice.
ifeq (${ADK_TARGET_SYSTEM_LEMOTE_YEELONG},y)
XAKE_FLAGS+=		LDEMULATION=elf64ltsmip
endif

post-install:
	${INSTALL_DIR} ${IDIR_DIRECTFB}/etc
	${INSTALL_DATA} ./files/directfbrc ${IDIR_DIRECTFB}/etc/
	$(INSTALL_DIR) $(IDIR_DIRECTFB)/usr/lib/directfb-${PKG_EXTRAVER}/{inputdrivers,systems,wm}
	${CP} $(WRKINST)/usr/lib/lib{direct,fusion}*.so* \
		$(IDIR_DIRECTFB)/usr/lib/
	${CP} ${WRKINST}/usr/lib/directfb-${PKG_EXTRAVER}/inputdrivers/libdirectfb_linux_input.so \
		${IDIR_DIRECTFB}/usr/lib/directfb-${PKG_EXTRAVER}/inputdrivers/
	${CP} ${WRKINST}/usr/lib/directfb-${PKG_EXTRAVER}/systems/*.so \
		${IDIR_DIRECTFB}/usr/lib/directfb-${PKG_EXTRAVER}/systems/
	${CP} ${WRKINST}/usr/lib/directfb-${PKG_EXTRAVER}/wm/*.so \
		${IDIR_DIRECTFB}/usr/lib/directfb-${PKG_EXTRAVER}/wm/
	$(INSTALL_DIR) $(IDIR_DIRECTFB)/usr/lib/directfb-${PKG_EXTRAVER}/interfaces/IDirectFB{Font,ImageProvider,VideoProvider}
	${CP} ${WRKINST}/usr/lib/directfb-${PKG_EXTRAVER}/interfaces/IDirectFBFont/*.so \
		${IDIR_DIRECTFB}/usr/lib/directfb-${PKG_EXTRAVER}/interfaces/IDirectFBFont/
	${CP} ${WRKINST}/usr/lib/directfb-${PKG_EXTRAVER}/interfaces/IDirectFBImageProvider/*.so \
		${IDIR_DIRECTFB}/usr/lib/directfb-${PKG_EXTRAVER}/interfaces/IDirectFBImageProvider/
	${CP} ${WRKINST}/usr/lib/directfb-${PKG_EXTRAVER}/interfaces/IDirectFBVideoProvider/*.so \
		${IDIR_DIRECTFB}/usr/lib/directfb-${PKG_EXTRAVER}/interfaces/IDirectFBVideoProvider/

directfb-dev-install:
	${INSTALL_DIR} ${IDIR_DIRECTFB_DEV}/usr/include/
	${CP} ${WRKINST}/usr/include/directfb ${IDIR_DIRECTFB_DEV}/usr/include

include ${TOPDIR}/mk/pkg-bottom.mk
