# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(TOPDIR)/rules.mk

PKG_NAME:=		grub
PKG_VERSION:=		2.00
PKG_RELEASE:=		3
PKG_MD5SUM:=		e927540b6eda8b024fb0391eeaa4091c
PKG_DESCR:=		GRUB2 bootloader (source package)
PKG_SECTION:=		boot
PKG_BUILDDEP:=		bison-host qemu-host
PKG_URL:=		http://www.gnu.org/software/grub
PKG_SITES:=		ftp://ftp.gnu.org/gnu/grub/

PKG_ARCH_DEPENDS:=	x86 x86_64 mips
PKG_NOPARALLEL:=	1

PKG_CHOICES_GRUB:=	PC EFI
PKGCD_PC:=		build for PC BIOS
PKGCD_EFI:=		build for EFI

include $(TOPDIR)/mk/package.mk

$(eval $(call PKG_template,GRUB,grub,$(PKG_VERSION)-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))

ifeq ($(ADK_PACKAGE_GRUB_PC),y)
GRUB_ARCH:=		i386-pc
CONFIGURE_ARGS+=	--with-platform=pc
endif
ifeq ($(ADK_PACKAGE_GRUB_EFI),y)
GRUB_ARCH:=		x86_64-efi
CONFIGURE_ARGS+=	--with-platform=efi
endif

ifeq ($(ADK_STATIC),y)
TARGET_CFLAGS+=         -static
TARGET_LDFLAGS+=        -static
endif

CONFIGURE_ARGS+=	--disable-grub-mkfont \
			--enable-efiemu=no \
			--enable-liblzma=no \
			--enable-device-mapper=no \
			--enable-libzfs=no \
			--disable-werror
XAKE_FLAGS+=		GCC_HONOUR_COPTS=s

grub-install:
	${INSTALL_DIR} $(IDIR_GRUB)/boot/grub/${GRUB_ARCH}
	${CP} ${WRKINST}/usr/lib/grub/${GRUB_ARCH}/*{mod,lst,img} \
		$(IDIR_GRUB)/boot/grub/${GRUB_ARCH}/
	${CP} ./files/core.img.${GRUB_ARCH} \
		$(IDIR_GRUB)/boot/grub/core.img

include ${TOPDIR}/mk/pkg-bottom.mk
