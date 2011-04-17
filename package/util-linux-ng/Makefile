# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include ${TOPDIR}/rules.mk

PKG_NAME:=		util-linux-ng
PKG_VERSION:=		2.18
PKG_RELEASE:=		2
PKG_MD5SUM:=		aff22adfff1bf39cd3f13371b95a3d3a
PKG_DESCR:=		Linux utilities
PKG_SECTION:=		fs
PKG_BUILDDEP:=		e2fsprogs ncurses
PKG_URL:=		http://userweb.kernel.org/~kzak/util-linux-ng
PKG_SITES:=		${MASTER_SITE_KERNEL:=utils/util-linux-ng/v$(PKG_VERSION)/}

PKG_SUBPKGS:=		FDISK SFDISK SWAP_UTILS LOSETUP MOUNT MCOOKIE
PKGSD_FDISK:=		Partition table manipulation utility
PKGSD_SFDISK:=		Scriptable Partition table manipulation utility
PKGSD_SWAP_UTILS:=	Swap space management utilities
PKGSS_SWAP_UTILS:=	libblkid
PKGSD_LOSETUP:=		Loop devices management utilities
PKGSS_LOSETUP:=		kmod-blk-dev-loop
PKGSD_MOUNT:=		mount/umount utilities
PKGSS_MOUNT:=		libblkid
PKGSD_MCOOKIE:=		Generate magic cookies for xauth
PKGSC_MCOOKIE:=		x11/apps

include ${TOPDIR}/mk/package.mk

$(eval $(call PKG_template,FDISK,fdisk,${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKGSD_FDISK},${PKG_SECTION}))
$(eval $(call PKG_template,SFDISK,sfdisk,${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKGSD_SFDISK},${PKG_SECTION}))
$(eval $(call PKG_template,SWAP_UTILS,swap-utils,${PKG_VERSION}-${PKG_RELEASE},${PKGSS_SWAP_UTILS},${PKGSD_SWAP_UTILS},${PKG_SECTION}))
$(eval $(call PKG_template,LOSETUP,losetup,${PKG_VERSION}-${PKG_RELEASE},${PKGSS_LOSETUP},${PKGSD_LOSETUP},${PKG_SECTION}))
$(eval $(call PKG_template,MOUNT,mount,${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKGSD_MOUNT},${PKG_SECTION}))
$(eval $(call PKG_template,MCOOKIE,mcookie,${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKGSD_MCOOKIE},${PKGSC_MCOOKIE}))

CONFIGURE_ARGS+=	--disable-use-tty-group \
			--disable-schedutils \
			--disable-cramfs \
			--enable-libuuid \
			--enable-libblkid \
			--enable-libmount \
			--enable-mount
MAKE_FLAGS+=		OPT="${TARGET_CFLAGS}" ARCH="${ARCH}"
FAKE_FLAGS+=		INSTALLSUID="install -m 4755"
TARGET_CFLAGS+=		-DSWAPON_HAS_TWO_ARGS -DHAVE_LLSEEK -lintl

fdisk-install:
	${INSTALL_DIR} ${IDIR_FDISK}/usr/sbin
	${CP} ${WRKINST}/sbin/fdisk ${IDIR_FDISK}/usr/sbin

sfdisk-install:
	${INSTALL_DIR} ${IDIR_SFDISK}/usr/sbin
	${CP} ${WRKINST}/sbin/sfdisk ${IDIR_SFDISK}/usr/sbin

losetup-install:
	${INSTALL_DIR} ${IDIR_LOSETUP}/usr/sbin
	${CP} ${WRKINST}/sbin/losetup ${IDIR_LOSETUP}/usr/sbin

swap-utils-install:
	${INSTALL_DIR} ${IDIR_SWAP_UTILS}/usr/sbin
	${CP} ${WRKINST}/sbin/mkswap ${IDIR_SWAP_UTILS}/usr/sbin
	${CP} ${WRKINST}/sbin/swap{on,off} ${IDIR_SWAP_UTILS}/usr/sbin

mount-install:
	${INSTALL_DIR} ${IDIR_MOUNT}/usr/bin
	${INSTALL_BIN} ${WRKINST}/usr/bin/{u,}mount ${IDIR_MOUNT}/usr/bin

mcookie-install:
	${INSTALL_DIR} ${IDIR_MCOOKIE}/usr/bin
	${INSTALL_BIN} ${WRKINST}/usr/bin/mcookie ${IDIR_MCOOKIE}/usr/bin

include ${TOPDIR}/mk/pkg-bottom.mk
