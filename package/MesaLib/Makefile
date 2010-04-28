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
PKG_BUILDDEP+=		dri2proto glproto
PKG_URL:=		http://www.mesa3d.org/
PKG_SITES:=		ftp://ftp.freedesktop.org/pub/mesa/7.8.1/

WRKDIST=		${WRKDIR}/Mesa-${PKG_VERSION}

PKG_TARGET_DEPENDS:=  	x86 x86_64

include $(TOPDIR)/mk/package.mk

$(eval $(call PKG_template,MESALIB,mesalib,$(PKG_VERSION)-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))

CONFIGURE_ARGS+=	--disable-static \
			--disable-gallium \
			--without-demos

XAKE_FLAGS+=		APP_CC=${HOSTCC} HOST_CC=${HOSTCC}

post-install:
	$(INSTALL_DIR) $(IDIR_MESALIB)/usr/lib
	$(INSTALL_BIN) $(WRKINST)/usr/lib/libGL*.so* \
		$(IDIR_MESALIB)/usr/lib

include ${TOPDIR}/mk/pkg-bottom.mk
