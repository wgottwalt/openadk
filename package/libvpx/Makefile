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

PKG_SYSTEM_DEPENDS:=	sharp-zaurus ibm-x40

DISTFILES:=             ${PKG_NAME}-v${PKG_VERSION}-p1.tar.bz2
WRKDIST=		$(WRKDIR)/${PKG_NAME}-v${PKG_VERSION}-p1

include $(TOPDIR)/mk/package.mk

$(eval $(call PKG_template,LIBVPX,libvpx,$(PKG_VERSION)-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))

CONFIG_STYLE:=		minimal
ifeq ($(ADK_TARGET_SYSTEM_SHARP_ZAURUS),y)
CONFIGURE_ARGS+=	--target=armv5te-linux-gcc
endif
ifeq ($(ADK_TARGET_SYSTEM_ACMESYSTEMS_FOXG20),y)
CONFIGURE_ARGS+=	--target=armv5te-linux-gcc
endif
ifeq ($(ADK_TARGET_SYSTEM_IBM_X40),y)
CONFIGURE_ARGS+=	--target=x86-linux-gcc --as=yasm
endif
ifeq ($(ADK_TARGET_SYSTEM_INTEL_ATOM),y)
CONFIGURE_ARGS+=	--target=x86-linux-gcc --as=yasm
endif
ifeq ($(ADK_TARGET_SYSTEM_PCENGINES_WRAP),y)
CONFIGURE_ARGS+=	--target=x86-linux-gcc --as=yasm
endif
ifeq ($(ADK_TARGET_SYSTEM_PCENGINES_ALIX2D13),y)
CONFIGURE_ARGS+=	--target=x86-linux-gcc --as=yasm
endif
ifeq ($(ADK_TARGET_SYSTEM_PCENGINES_ALIX1C),y)
CONFIGURE_ARGS+=	--target=x86-linux-gcc --as=yasm
endif
ifeq ($(ADK_TARGET_SYSTEM_PCENGINES_ALIX2D2),y)
CONFIGURE_ARGS+=	--target=x86-linux-gcc --as=yasm
endif
ifeq ($(ADK_TARGET_SYSTEM_MIKROTIK_RB532),y)
CONFIGURE_ARGS+=	--target=mips32-linux-gcc
endif
ifeq ($(ADK_TARGET_SYSTEM_MIKROTIK_RB4XX),y)
CONFIGURE_ARGS+=	--target=mips32-linux-gcc
endif
ifeq ($(ADK_TARGET_SYSTEM_LINKSYS_AG241),y)
CONFIGURE_ARGS+=	--target=mips32-linux-gcc
endif
ifeq ($(ADK_TARGET_SYSTEM_FON_FON2100),y)
CONFIGURE_ARGS+=	--target=mips32-linux-gcc
endif
ifeq ($(ADK_TARGET_SYSTEM_LEMOTE_YEELONG),y)
CONFIGURE_ARGS+=	--target=mips32-linux-gcc
endif
ifeq ($(ADK_TARGET_SYSTEM_BROADCOM_BCM47XX),y)
CONFIGURE_ARGS+=	--target=mips32-linux-gcc
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
