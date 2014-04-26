# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(TOPDIR)/rules.mk

PKG_NAME:=		libx264
# actually is git checkout from 22.01.2014
PKG_VERSION:=		1.0.1
PKG_RELEASE:=		7
PKG_MD5SUM:=		6be3e8adeaf6b007bbc04026b6ebd304
PKG_DESCR:=		H264 encoding library
PKG_SECTION:=		libs
PKG_URL:=		http://www.videolan.org/developers/x264.html
PKG_SITES:=		http://openadk.org/distfiles/
PKG_OPTS:=		dev

DISTFILES:=		${PKG_NAME}-${PKG_VERSION}.tar.gz

PKG_BUILDDEP_IBM_X40:=	yasm-host

include $(TOPDIR)/mk/package.mk

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

include ${TOPDIR}/mk/pkg-bottom.mk
