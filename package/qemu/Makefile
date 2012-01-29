# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(TOPDIR)/rules.mk

PKG_NAME:=		qemu
PKG_VERSION:=		1.0
PKG_RELEASE:=		1
PKG_MD5SUM:=		a64b36067a191451323b0d34ebb44954
PKG_DESCR:=		cpu and system emulator
PKG_SECTION:=		misc
PKG_DEPENDS:=		zlib libsdl libpng
PKG_BUILDDEP:=		zlib sdl libpng
PKG_URL:=		http://wwww.qemu.org/
PKG_SITES:=		http://wiki.qemu.org/download/

PKG_ARCH_DEPENDS:=	native x86 x86_64
#PKG_SYSTEM_DEPENDS:=	ibm-x40 shuttle-sa76

include $(TOPDIR)/mk/package.mk

$(eval $(call PKG_template,QEMU,$(PKG_NAME),$(PKG_VERSION)-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))

TARGET_CFLAGS:=         $(filter-out -flto,$(TARGET_CFLAGS))
CONFIG_STYLE:=		minimal
CONFIGURE_ARGS+=	--host-cc=$(CC_FOR_BUILD) \
			--prefix=/usr \
			--sysconfdir=/etc \
			--enable-kvm \
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
