# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(TOPDIR)/rules.mk

PKG_NAME:=		libvpx
PKG_VERSION:=		0.9.7
PKG_RELEASE:=		1
PKG_MD5SUM:=		bd888cffde8d9c3061c7fd719b0cd4ce
PKG_DESCR:=		VP8 codec library
PKG_SECTION:=		libs
PKG_URL:=		http://www.webmproject.org/about/
PKG_SITES:=		http://webm.googlecode.com/files/

PKG_SYSTEM_DEPENDS:=	sharp-zaurus

DISTFILES:=             ${PKG_NAME}-v${PKG_VERSION}-p1.tar.bz2
WRKDIST=		$(WRKDIR)/${PKG_NAME}-v${PKG_VERSION}-p1

include $(TOPDIR)/mk/package.mk

$(eval $(call PKG_template,LIBVPX,libvpx,$(PKG_VERSION)-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))

CONFIG_STYLE:=		minimal
ifeq ($(ADK_TARGET_SYSTEM_SHARP_ZAURUS),y)
CONFIGURE_ARGS+=	--target=armv5te-linux-gcc
endif
CONFIGURE_ARGS+=	--prefix=/usr \
			--disable-install-docs \
			--disable-install-bins \
			--enable-install-libs \
			--disable-examples \
			--enable-shared
ALL_TARGET:=

libvpx-install:
	$(INSTALL_DIR) $(IDIR_LIBVPX)/usr/lib
	$(CP) $(WRKINST)/usr/lib/libvpx.so* \
		$(IDIR_LIBVPX)/usr/lib

include ${TOPDIR}/mk/pkg-bottom.mk
