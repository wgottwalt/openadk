# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(TOPDIR)/rules.mk

PKG_NAME:=		MesaLib
PKG_VERSION:=		7.8.1
PKG_RELEASE:=		1
PKG_MD5SUM:=		62e8e47cbd63741b4bbe634dcdc8a56a
PKG_DESCR:=		MESA library
PKG_SECTION:=		libs
PKG_DEPENDS:=		libxdamage libxfixes libdrm
PKG_BUILDDEP+=		libXdamage libXfixes libXxf86vm libdrm 
PKG_BUILDDEP+=		dri2proto glproto expat
PKG_URL:=		http://www.mesa3d.org/
PKG_SITES:=		ftp://ftp.freedesktop.org/pub/mesa/7.8.1/

WRKDIST=		${WRKDIR}/Mesa-${PKG_VERSION}

PKG_TARGET_DEPENDS:=  	ibmx40 lemote

include $(TOPDIR)/mk/package.mk

$(eval $(call PKG_template,MESALIB,mesalib,$(PKG_VERSION)-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))

ifeq (${ADK_LINUX_X86_IBMX40},y)
DRI_DRIVERS:=i810
endif

# Lemote's SMI712 is not directly supported by Mesa,
# and at least some SIS driver fails to build when
# keeping the driver auto-selection intact.
ifeq (${ADK_LINUX_MIPS64_LEMOTE},y)
DRI_DRIVERS:=swrast
endif

CONFIGURE_ARGS+=	--disable-static \
			--disable-gallium \
			--disable-glw \
			--with-driver=dri \
			--with-dri-drivers=${DRI_DRIVERS} \
			--without-demos

XAKE_FLAGS+=		APP_CC=${HOSTCC} HOST_CC=${HOSTCC}

pre-configure:
	(cd ${WRKBUILD}; rm -rf config.{cache,status}; \
		./configure \
		--disable-static \
		--disable-glw \
		--disable-gallium \
		--with-driver=xlib \
		--without-demos \
	);
	${MAKE} -C ${WRKBUILD}/src/glsl
	${MAKE} -C ${WRKBUILD}/src/glsl/apps
	cp ${WRKBUILD}/src/glsl/apps/compile \
		${STAGING_TOOLS}/bin
	${MAKE} -C ${WRKBUILD}/src/glsl clean

post-install:
	$(INSTALL_DIR) $(IDIR_MESALIB)/usr/lib/dri
	$(CP) $(WRKINST)/usr/lib/libGL*.so* \
		$(IDIR_MESALIB)/usr/lib
ifeq (${ADK_LINUX_MIPS64_LEMOTE},y)
	$(INSTALL_BIN) $(WRKINST)/usr/lib/dri/swrast_dri.so \
		${IDIR_MESALIB}/usr/lib/dri/
endif

include ${TOPDIR}/mk/pkg-bottom.mk
