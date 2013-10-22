# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(TOPDIR)/rules.mk

PKG_NAME:=		qemu
PKG_VERSION:=		1.3.0
PKG_RELEASE:=		1
PKG_MD5SUM:=		a4030ddd2ba324152a97d65d3c0b247d
PKG_DESCR:=		cpu and system emulator
PKG_SECTION:=		misc
PKG_DEPENDS:=		zlib libsdl libpng
PKG_BUILDDEP:=		zlib sdl libpng
PKG_URL:=		http://wwww.qemu.org/
PKG_SITES:=		http://wiki.qemu.org/download/

DISTFILES:=		${PKG_NAME}-${PKG_VERSION}.tar.bz2

PKG_ARCH_DEPENDS:=	native x86 x86_64

include $(TOPDIR)/mk/package.mk

$(eval $(call PKG_template,QEMU,qemu,$(PKG_VERSION)-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))

TARGET_CFLAGS:=         $(filter-out -flto,$(TARGET_CFLAGS))
CONFIG_STYLE:=		minimal
CONFIGURE_ARGS+=	--host-cc=$(CC_FOR_BUILD) \
			--prefix=/usr \
			--sysconfdir=/etc \
			--enable-kvm \
			--bindir=/usr/bin
TARGET_LDFLAGS+=	-pthread -lm -lrt

qemu-install:
	$(INSTALL_DIR) $(IDIR_QEMU)/usr/share/qemu
	$(INSTALL_DIR) $(IDIR_QEMU)/usr/bin
	$(INSTALL_BIN) $(WRKINST)/usr/bin/qemu* \
		$(IDIR_QEMU)/usr/bin
	$(CP) $(WRKINST)/usr/share/qemu/* \
		$(IDIR_QEMU)/usr/share/qemu

include ${TOPDIR}/mk/pkg-bottom.mk
