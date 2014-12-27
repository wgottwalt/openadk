# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(ADK_TOPDIR)/rules.mk

PKG_NAME:=		libvpx
PKG_VERSION:=		1.3.0
PKG_RELEASE:=		3
PKG_HASH:=		d3dcc8d84af51c6c382b214397c62402e37a799e8ebcda6f4217aef0010451a9
PKG_DESCR:=		vp8/vp9 codec library
PKG_SECTION:=		libs/video
PKG_URL:=		http://www.webmproject.org/about/
PKG_SITES:=		https://webm.googlecode.com/files/
PKG_OPTS:=		dev

PKG_BUILDDEP_IBM_X40:=	yasm-host
PKG_BUILDDEP_QEMU_X86:=	yasm-host
PKG_ARCH_DEPENDS:=	!m68k

DISTFILES:=             ${PKG_NAME}-v${PKG_VERSION}.tar.bz2
WRKDIST=		$(WRKDIR)/${PKG_NAME}-v${PKG_VERSION}

include $(ADK_TOPDIR)/mk/package.mk

$(eval $(call PKG_template,LIBVPX,libvpx,$(PKG_VERSION)-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION},${PKG_OPTS}))

CONFIG_STYLE:=		minimal
ifeq ($(ADK_TARGET_SYSTEM_QEMU_XTENSA),y)
CONFIGURE_ARGS+=	--target=generic-gnu
endif
ifeq ($(ADK_TARGET_SYSTEM_QEMU_ARM),y)
CONFIGURE_ARGS+=	--target=armv5te-linux-gcc
endif
ifeq ($(ADK_TARGET_SYSTEM_SOLIDRUN_IMX6),y)
CONFIGURE_ARGS+=	--target=armv7-linux-gcc
endif
ifeq ($(ADK_TARGET_SYSTEM_RASPBERRY_PI),y)
CONFIGURE_ARGS+=	--target=armv6-linux-gcc
endif
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
ifeq ($(ADK_TARGET_SYSTEM_QEMU_X86),y)
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
CONFIGURE_ARGS+=	--target=mips64-linux-gcc
endif
ifeq ($(ADK_TARGET_SYSTEM_BROADCOM_BCM47XX),y)
CONFIGURE_ARGS+=	--target=mips32-linux-gcc
endif
ifeq ($(ADK_TARGET_SYSTEM_QEMU_MIPSEL),y)
CONFIGURE_ARGS+=	--target=mips32-linux-gcc
endif
ifeq ($(ADK_TARGET_SYSTEM_QEMU_MIPS),y)
CONFIGURE_ARGS+=	--target=mips32-linux-gcc
endif
CONFIGURE_ARGS+=	--prefix=/usr \
			--disable-install-docs \
			--disable-install-bins \
			--enable-install-libs \
			--disable-unit-tests \
			--disable-docs \
			--disable-examples \
			--enable-shared
ALL_TARGET:=

post-extract:
	chmod a+x $(WRKBUILD)/build/make/*.sh
	chmod a+x $(WRKBUILD)/build/make/*.pl

libvpx-install:
	$(INSTALL_DIR) $(IDIR_LIBVPX)/usr/lib
	$(CP) $(WRKINST)/usr/lib/libvpx.so* \
		$(IDIR_LIBVPX)/usr/lib

include ${ADK_TOPDIR}/mk/pkg-bottom.mk
