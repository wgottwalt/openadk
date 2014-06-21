# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(ADK_TOPDIR)/rules.mk

PKG_NAME:=		libx264
# actually is git checkout from 18.05.2014
PKG_VERSION:=		1.0.2
PKG_RELEASE:=		1
PKG_MD5SUM:=		43946c39a27327f25751cddc1db0ed77
PKG_DESCR:=		h264 encoding library
PKG_SECTION:=		libs/video
PKG_URL:=		http://www.videolan.org/developers/x264.html
PKG_SITES:=		http://openadk.org/distfiles/
PKG_OPTS:=		dev

PKG_BUILDDEP_IBM_X40:=	yasm-host

include $(ADK_TOPDIR)/mk/package.mk

$(eval $(call PKG_template,LIBX264,libx264,$(PKG_VERSION)-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION},${PKG_OPTS}))

CONFIG_STYLE:=		minimal

ifeq ($(ADK_TARGET_SYSTEM_SHARP_ZAURUS),y)
CONFIGURE_ARGS+=	--disable-asm
endif
CONFIGURE_ARGS+=	--disable-cli \
			--disable-opencl \
			--enable-shared \
			--prefix=/usr \
			--host=${GNU_TARGET_NAME} \
			--sysroot=${STAGING_TARGET_DIR} \
			--cross-prefix=$(TARGET_CROSS)

libx264-install:
	$(INSTALL_DIR) $(IDIR_LIBX264)/usr/lib
	$(CP) $(WRKINST)/usr/lib/libx264*.so* \
		$(IDIR_LIBX264)/usr/lib

include ${ADK_TOPDIR}/mk/pkg-bottom.mk
