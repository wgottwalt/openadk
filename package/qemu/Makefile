# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(TOPDIR)/rules.mk

PKG_NAME:=		qemu
PKG_VERSION:=		0.14.0
PKG_RELEASE:=		1
PKG_MD5SUM:=		397a0d665da8ba9d3b9583629f3d6421
PKG_DESCR:=		cpu and system emulator
PKG_SECTION:=		misc
PKG_DEPENDS:=		zlib libSDL
PKG_BUILDDEP:=		zlib sdl
PKG_URL:=		http://wwww.qemu.org/
PKG_SITES:=		http://wiki.qemu.org/download/

PKG_ARCH_DEPENDS:=	x86 x86_64

include $(TOPDIR)/mk/package.mk

$(eval $(call PKG_template,QEMU,$(PKG_NAME),$(PKG_VERSION)-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))

CONFIG_STYLE:=		minimal
CONFIGURE_ARGS+=	--host-cc=$(CC_FOR_BUILD) \
			--cross-prefix=$(TARGET_CROSS) \
			--disable-user \
			--prefix=/usr \
			--sysconfdir=/etc \
			--bindir=/usr/bin
TARGET_LDFLAGS+=	-pthread -lm -lrt

post-install:
	$(INSTALL_DIR) $(IDIR_QEMU)/usr/share/qemu
	$(INSTALL_DIR) $(IDIR_QEMU)/usr/bin
	$(INSTALL_BIN) $(WRKINST)/usr/bin/qemu* \
		$(IDIR_QEMU)/usr/bin
	$(CP) $(WRKINST)/usr/share/qemu/* \
		$(IDIR_QEMU)/usr/share/qemu

include ${TOPDIR}/mk/pkg-bottom.mk
