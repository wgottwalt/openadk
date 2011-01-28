# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(TOPDIR)/rules.mk

PKG_NAME:=		MesaLib
PKG_VERSION:=		7.8.2
PKG_RELEASE:=		3
PKG_MD5SUM:=		c89b63d253605ed40e8ac370d25a833c
PKG_DESCR:=		MESA library
PKG_SECTION:=		libs
PKG_DEPENDS:=		libxdamage libxfixes libdrm libxxf86vm
PKG_BUILDDEP:=		libXdamage libXfixes libXxf86vm libdrm
PKG_BUILDDEP+=		dri2proto glproto expat
PKG_URL:=		http://www.mesa3d.org/
PKG_SITES:=		ftp://ftp.freedesktop.org/pub/mesa/7.8.2/

PKG_SUBPKGS:=		MESALIB GLXINFO GLXGEARS
PKGSD_GLXINFO:=		Display various GLX information
PKGSC_GLXINFO:=		x11/apps
PKGSD_GLXGEARS:=	Nice little OpenGL demo application
PKGSC_GLXGEARS:=	x11/apps

PKG_ARCH_DEPENDS:=	x86 x86_64 mips mipsel mips64 mips64el

WRKDIST=		${WRKDIR}/Mesa-${PKG_VERSION}

include $(TOPDIR)/mk/package.mk

$(eval $(call PKG_template,MESALIB,mesalib,$(PKG_VERSION)-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))
$(eval $(call PKG_template,GLXINFO,glxinfo,$(PKG_VERSION)-${PKG_RELEASE},${PKG_DEPENDS},${PKGSD_GLXINFO},${PKGSC_GLXINFO}))
$(eval $(call PKG_template,GLXGEARS,glxgears,$(PKG_VERSION)-${PKG_RELEASE},${PKG_DEPENDS},${PKGSD_GLXGEARS},${PKGSC_GLXGEARS}))

ifeq (${ADK_TARGET_SYSTEM_IBM_X40},y)
DRI_DRIVERS:=i915
endif

CONFIGURE_ARGS+=	--disable-static \
			--disable-gallium \
			--disable-glw \
			--with-driver=dri \
			--with-dri-drivers=${DRI_DRIVERS},swrast \
			--with-demos=xdemos

XAKE_FLAGS+=		HOST_CC=${CC_FOR_BUILD} GLSL_CL=${STAGING_HOST_DIR}/bin/glslcompile

post-extract:
	(cd ${WRKBUILD}; rm -rf config.{cache,status}; \
		./configure \
		--disable-static \
		--disable-glw \
		--disable-gallium \
		--with-driver=xlib \
	);
	${MAKE} -C ${WRKBUILD}/src/glsl
	${MAKE} -C ${WRKBUILD}/src/glsl/apps
	${CP} ${WRKBUILD}/src/glsl/apps/compile \
		${STAGING_HOST_DIR}/bin/glslcompile
	${MAKE} -C ${WRKBUILD}/src/glsl clean

pre-configure:
	$(SED) "s#@@RANLIB@@#${TARGET_CROSS}ranlib#" ${WRKBUILD}/configs/default
	$(SED) "s#@@AR@@#${TARGET_CROSS}ar#" ${WRKBUILD}/configs/default

post-install:
	$(INSTALL_DIR) $(IDIR_MESALIB)/usr/lib/dri
	$(CP) $(WRKINST)/usr/lib/libGL*.so* \
		$(IDIR_MESALIB)/usr/lib
ifeq (${ADK_TARGET_SYSTEM_IBM_X40},y)
	${CP} $(WRKINST)/usr/lib/dri/i915_dri.so \
		${IDIR_MESALIB}/usr/lib/dri/
endif
	${CP} $(WRKINST)/usr/lib/dri/swrast_dri.so \
		${IDIR_MESALIB}/usr/lib/dri/
	${INSTALL_DIR} ${IDIR_GLXINFO}/usr/bin
	${INSTALL_BIN} ${WRKBUILD}/progs/xdemos/glxinfo \
		${IDIR_GLXINFO}/usr/bin/
	${INSTALL_DIR} ${IDIR_GLXGEARS}/usr/bin
	${INSTALL_BIN} ${WRKBUILD}/progs/xdemos/glxgears \
		${IDIR_GLXGEARS}/usr/bin/

include ${TOPDIR}/mk/pkg-bottom.mk
