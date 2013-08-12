# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(TOPDIR)/rules.mk

PKG_NAME:=		MesaLib
PKG_VERSION:=		8.0.5
PKG_RELEASE:=		1
PKG_MD5SUM:=		cda5d101f43b8784fa60bdeaca4056f2
PKG_DESCR:=		MESA library
PKG_SECTION:=		libs
PKG_DEPENDS:=		libxdamage libxfixes libdrm libxxf86vm libexpat
PKG_BUILDDEP:=		libXdamage libXfixes libXxf86vm libdrm
PKG_BUILDDEP+=		dri2proto glproto expat libXext
PKG_URL:=		http://www.mesa3d.org/
PKG_SITES:=		ftp://ftp.freedesktop.org/pub/mesa/${PKG_VERSION}/
PKG_NEED_CXX:=		1

PKG_SUBPKGS:=		MESALIB MESALIB_DEV
PKGSD_MESALIB_DEV:=	MESA headers
PKGSC_MESALIB_DEV:=	devel

PKG_ARCH_DEPENDS:=	x86 x86_64 mips mipsel mips64 mips64el arm

WRKDIST=		${WRKDIR}/Mesa-${PKG_VERSION}

include $(TOPDIR)/mk/package.mk

$(eval $(call PKG_template,MESALIB,mesalib,$(PKG_VERSION)-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))
$(eval $(call PKG_template,MESALIB_DEV,mesalib-dev,$(PKG_VERSION)-${PKG_RELEASE},${PKG_DEPENDS},${PKGSD_MESALIB_DEV},${PKGSC_MESALIB_DEV}))

TARGET_CFLAGS:=         $(filter-out -flto,$(TARGET_CFLAGS))
XAKE_FLAGS+=		GCC_HONOUR_COPTS=s

ifeq (${ADK_TARGET_SYSTEM_IBM_X40},y)
DRI_DRIVERS:=i915
endif

CONFIGURE_ARGS+=	--disable-static \
			--disable-gallium-llvm \
			--with-gallium-drivers=swrast \
			--with-driver=dri \
			--disable-gles1 \
			--disable-gles2 \
			--with-dri-drivers=${DRI_DRIVERS},swrast
CONFIGURE_ENV+=		PYTHON2=/usr/bin/python

XAKE_FLAGS+=		HOST_CC=${CC_FOR_BUILD} GLSL_CL=${STAGING_HOST_DIR}/bin/glslcompile
ifeq ($(ADK_NATIVE),y)
XAKE_FLAGS+=		RANLIB=ranlib AR=ar
endif

post-extract:
	(cd ${WRKBUILD}; rm -rf config.{cache,status}; \
		./configure \
		--disable-static \
		--disable-gallium-llvm \
		--with-gallium-drivers=swrast \
		--with-driver=xlib \
	);
	${MAKE} -C ${WRKBUILD}/src/glsl
	${CP} ${WRKBUILD}/src/glsl/glsl_compiler \
		${STAGING_HOST_DIR}/bin/glsl_compiler
	${CP} ${WRKBUILD}/src/glsl/builtin_compiler \
		${STAGING_HOST_DIR}/bin/builtin_compiler
	${MAKE} -C ${WRKBUILD}/src/glsl clean

mesalib-install:
	$(INSTALL_DIR) $(IDIR_MESALIB)/usr/lib/dri
	$(CP) $(WRKINST)/usr/lib/libGL*.so* \
		$(IDIR_MESALIB)/usr/lib
	${CP} $(WRKINST)/usr/lib/dri/swrast_dri.so \
		${IDIR_MESALIB}/usr/lib/dri/
ifeq (${ADK_TARGET_SYSTEM_IBM_X40},y)
	${CP} $(WRKINST)/usr/lib/dri/i915_dri.so \
		${IDIR_MESALIB}/usr/lib/dri/
endif

mesalib-dev-install:
	$(INSTALL_DIR) $(IDIR_MESALIB_DEV)/usr/include
	${CP} ${WRKINST}/usr/include/* \
		$(IDIR_MESALIB_DEV)/usr/include
	$(INSTALL_DIR) $(IDIR_MESALIB_DEV)/usr/lib/pkgconfig
	${CP} ${WRKINST}/usr/lib/pkgconfig/*.pc \
		$(IDIR_MESALIB_DEV)/usr/lib/pkgconfig

include ${TOPDIR}/mk/pkg-bottom.mk
