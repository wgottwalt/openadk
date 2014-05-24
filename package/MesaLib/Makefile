# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(TOPDIR)/rules.mk

PKG_NAME:=		MesaLib
PKG_VERSION:=		10.1.0
PKG_SUBVER:=		10.1
PKG_RELEASE:=		3
PKG_MD5SUM:=		08e796ec7122aa299d32d4f67a254315
PKG_DESCR:=		MESA 3D graphics library
PKG_SECTION:=		libs
PKG_DEPENDS:=		libxdamage libxfixes libdrm libxxf86vm libexpat
PKG_DEPENDS+=		libxml2 libxml2-python libstdcxx
PKG_BUILDDEP:=		autotool python2 libxml2 libXdamage libXfixes
PKG_BUILDDEP+=		libXxf86vm libdrm dri2proto glproto expat libXext
PKG_BUILDDEP+=		eudev dri3proto presentproto xcb-proto libxcb
PKG_BUILDDEP+=		libxshmfence
PKG_URL:=		http://www.mesa3d.org/
PKG_SITES:=		ftp://ftp.freedesktop.org/pub/mesa/${PKG_SUBVER}/
PKG_LIBNAME:=		mesalib
PKG_OPTS:=		dev

PKG_ARCH_DEPENDS:=	x86 x86_64 mips mipsel mips64 mips64el arm

DISTFILES:=		${PKG_NAME}-${PKG_VERSION}.tar.gz
WRKDIST=		${WRKDIR}/Mesa-${PKG_VERSION}

include $(TOPDIR)/mk/package.mk

$(eval $(call PKG_template,MESALIB,mesalib,$(PKG_VERSION)-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION},${PKG_OPTS}))

include $(TOPDIR)/mk/python.mk

ifeq ($(ADK_HOST_DARWIN),y)
PYTHON:=/opt/local/bin/python2.7
endif
ifeq ($(ADK_HOST_OPENBSD),y)
PYTHON:=/usr/local/bin/python2.7
endif
ifeq ($(ADK_HOST_CYGWIN),y)
PYTHON:=/usr/bin/python2.7
endif

ifeq (${ADK_TARGET_SYSTEM_IBM_X40},y)
DRI_DRIVERS:=i915
endif

AUTOTOOL_STYLE:=	autoreconf
CONFIGURE_ARGS+=	--disable-static \
			--disable-gallium-llvm \
			--with-gallium-drivers=swrast \
			--disable-gles1 \
			--disable-gles2 \
			--with-dri-drivers=${DRI_DRIVERS},swrast
CONFIGURE_ENV+=		MISSING="echo" \
			PYTHON2=$(PYTHON)
XAKE_FLAGS+=		HOST_CC=${CC_FOR_BUILD}

mesalib-install:
	$(INSTALL_DIR) $(IDIR_MESALIB)/usr/lib/dri
	$(CP) $(WRKINST)/usr/lib/libGL*.so* \
		$(IDIR_MESALIB)/usr/lib
	$(CP) $(WRKINST)/usr/lib/libglapi.so* \
		$(IDIR_MESALIB)/usr/lib
	${CP} $(WRKINST)/usr/lib/dri/swrast_dri.so \
		${IDIR_MESALIB}/usr/lib/dri/
ifeq (${ADK_TARGET_SYSTEM_IBM_X40},y)
	${CP} $(WRKINST)/usr/lib/dri/i915_dri.so \
		${IDIR_MESALIB}/usr/lib/dri/
endif

include ${TOPDIR}/mk/pkg-bottom.mk
