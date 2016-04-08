# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(ADK_TOPDIR)/rules.mk

PKG_NAME:=		libjpeg-turbo
PKG_VERSION:=		1.4.2
PKG_RELEASE:=		1
PKG_HASH:=		521bb5d3043e7ac063ce3026d9a59cc2ab2e9636c655a2515af5f4706122233e
PKG_DESCR:=		jpeg image library
PKG_SECTION:=		libs/image
PKG_BUILDDEP:=		yasm-host
HOST_BUILDDEP:=		yasm-host
PKG_URL:=		http://libjpeg-turbo.virtualgl.org/
PKG_SITES:=		${MASTER_SITE_SOURCEFORGE:=libjpeg-turbo/}
PKG_OPTS:=		dev
PKG_NOPARALLEL:=	1

DISTFILES:=		${PKG_NAME}-${PKG_VERSION}.tar.gz

include $(ADK_TOPDIR)/mk/host.mk
include $(ADK_TOPDIR)/mk/package.mk

$(eval $(call HOST_template,LIBJPEG_TURBO,libjpeg-turbo,$(PKG_VERSION)-${PKG_RELEASE}))
$(eval $(call PKG_template,LIBJPEG_TURBO,libjpeg-turbo,$(PKG_VERSION)-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION},${PKG_OPTS}))

TARGET_CFLAGS+=		-fPIC

ifeq ($(ADK_x32),y)
CONFIGURE_ARGS+=	--without-simd
endif

CONFIGURE_ARGS+=	--with-pic
HOST_CONFIGURE_ARGS+=	--without-simd

libjpeg-turbo-install:
	$(INSTALL_DIR) $(IDIR_LIBJPEG_TURBO)/usr/lib
	$(CP) $(WRKINST)/usr/lib/lib{turbo,}jpeg*.so* \
		$(IDIR_LIBJPEG_TURBO)/usr/lib

include ${ADK_TOPDIR}/mk/host-bottom.mk
include ${ADK_TOPDIR}/mk/pkg-bottom.mk
