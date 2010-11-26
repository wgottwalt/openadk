# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(TOPDIR)/rules.mk

PKG_NAME:=		DirectFB
PKG_VERSION:=		1.4.3
PKG_RELEASE:=		1
PKG_MD5SUM:=		223e036da906ceb4bd44708026839ff1
PKG_DESCR:=		Thin library on top of the Linux framebuffer devices
PKG_SECTION:=		libs
PKG_DEPENDS:=		libpng
PKG_BUILDDEP:=		libpng libX11 libXext
PKG_URL:=		http://www.directfb.org/
PKG_SITES:=		http://directfb.org/downloads/Core/DirectFB-1.4/

include $(TOPDIR)/mk/package.mk

$(eval $(call PKG_template,DIRECTFB,directfb,$(PKG_VERSION)-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))

CONFIGURE_ARGS+=	--with-inputdrivers=linuxinput,keyboard,ps2mouse \
			--with-gfxdrivers=none \
			--disable-osx

# This is to overcome libtool fuckup - when building without,
# libtool calls (the correct) ld directly without parameters,
# which then chooses the wrong default emulation (which is
# probably the real problem here). LDEMULATION overrides ld's
# wrong choice.
ifeq (${ADK_HARDWARE_LEMOTE_YEELONG},y)
XAKE_FLAGS+=		LDEMULATION=elf64ltsmip
endif

post-install:
	${INSTALL_DIR} ${IDIR_DIRECTFB}/etc
	${INSTALL_DATA} ./files/directfbrc ${IDIR_DIRECTFB}/etc/
	$(INSTALL_DIR) $(IDIR_DIRECTFB)/usr/lib/directfb-1.4-0/{inputdrivers,systems,wm}
	${CP} $(WRKINST)/usr/lib/lib{direct,fusion}*.so* \
		$(IDIR_DIRECTFB)/usr/lib/
	${CP} ${WRKINST}/usr/lib/directfb-1.4-0/inputdrivers/libdirectfb_linux_input.so \
		${IDIR_DIRECTFB}/usr/lib/directfb-1.4-0/inputdrivers/
	${CP} ${WRKINST}/usr/lib/directfb-1.4-0/systems/*.so \
		${IDIR_DIRECTFB}/usr/lib/directfb-1.4-0/systems/
	${CP} ${WRKINST}/usr/lib/directfb-1.4-0/wm/*.so \
		${IDIR_DIRECTFB}/usr/lib/directfb-1.4-0/wm/
	$(INSTALL_DIR) $(IDIR_DIRECTFB)/usr/lib/directfb-1.4-0/interfaces/IDirectFB{Font,ImageProvider,VideoProvider}
	${CP} ${WRKINST}/usr/lib/directfb-1.4-0/interfaces/IDirectFBFont/*.so \
		${IDIR_DIRECTFB}/usr/lib/directfb-1.4-0/interfaces/IDirectFBFont/
	${CP} ${WRKINST}/usr/lib/directfb-1.4-0/interfaces/IDirectFBImageProvider/*.so \
		${IDIR_DIRECTFB}/usr/lib/directfb-1.4-0/interfaces/IDirectFBImageProvider/
	${CP} ${WRKINST}/usr/lib/directfb-1.4-0/interfaces/IDirectFBVideoProvider/*.so \
		${IDIR_DIRECTFB}/usr/lib/directfb-1.4-0/interfaces/IDirectFBVideoProvider/


include ${TOPDIR}/mk/pkg-bottom.mk
