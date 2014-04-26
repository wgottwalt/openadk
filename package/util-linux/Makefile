# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include ${TOPDIR}/rules.mk

PKG_NAME:=		util-linux
PKG_VERSION:=		2.23.2
PKG_RELEASE:=		6
PKG_MD5SUM:=		b39fde897334a4858bb2098edcce5b3f
PKG_DESCR:=		Linux utilities (meta-package)
PKG_SECTION:=		utils
PKG_DEPENDS:=		mount fdisk sfdisk swap-utils losetup mount mcookie
PKG_BUILDDEP:=		ncurses
PKG_SITES:=		http://www.kernel.org/pub/linux/utils/util-linux/v2.23/
PKG_NOPARALLEL:=	1
PKG_OPTS:=		dev

PKG_ARCH_DEPENDS:=	!m68k

PKG_SUBPKGS:=		UTIL_LINUX FDISK SFDISK SWAP_UTILS LOSETUP MCOOKIE MOUNT
PKG_SUBPKGS+=		LIBUUID LIBBLKID LIBMOUNT
PKGSD_LIBUUID:=		UUID library
PKGSC_LIBUUID:=		libs
PKGSD_LIBBLKID:=	BLKID library
PKGSC_LIBBLKID:=	libs
PKGSD_LIBMOUNT:=	Mount library
PKGSC_LIBMOUNT:=	libs
PKGSD_FDISK:=		Partition table manipulation utility
PKGSC_FDISK:=		fs
PKGSD_SFDISK:=		Scriptable Partition table manipulation utility
PKGSC_SFDISK:=		fs
PKGSD_SWAP_UTILS:=	Swap space management utilities
PKGSS_SWAP_UTILS:=	libblkid
PKGSC_SWAP_UTILS:=	fs
PKGSD_LOSETUP:=		Loop devices management utilities
PKGSS_LOSETUP:=		kmod-blk-dev-loop
PKGSD_MOUNT:=		mount/umount utilities
PKGSS_MOUNT:=		libblkid libmount libuuid
PKGSC_MOUNT:=		fs
PKGSD_MCOOKIE:=		Generate magic cookies for xauth
PKGSC_MCOOKIE:=		x11/apps

include ${TOPDIR}/mk/package.mk

$(eval $(call PKG_template,UTIL_LINUX,util-linux,${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION},${PKG_OPTS}))
$(eval $(call PKG_template,FDISK,fdisk,${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKGSD_FDISK},${PKGSC_FDISK}))
$(eval $(call PKG_template,SFDISK,sfdisk,${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKGSD_SFDISK},${PKGSC_SFDISK}))
$(eval $(call PKG_template,SWAP_UTILS,swap-utils,${PKG_VERSION}-${PKG_RELEASE},${PKGSS_SWAP_UTILS},${PKGSD_SWAP_UTILS},${PKGSC_SWAP_UTILS}))
$(eval $(call PKG_template,LOSETUP,losetup,${PKG_VERSION}-${PKG_RELEASE},${PKGSS_LOSETUP},${PKGSD_LOSETUP},${PKG_SECTION}))
$(eval $(call PKG_template,MOUNT,mount,${PKG_VERSION}-${PKG_RELEASE},${PKGSS_MOUNT},${PKGSD_MOUNT},${PKGSC_MOUNT}))
$(eval $(call PKG_template,MCOOKIE,mcookie,${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKGSD_MCOOKIE},${PKGSC_MCOOKIE}))
$(eval $(call PKG_template,LIBUUID,libuuid,${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKGSD_LIBUUID},${PKGSC_LIBUUID}))
$(eval $(call PKG_template,LIBBLKID,libblkid,${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKGSD_LIBBLKID},${PKGSC_LIBBLKID}))
$(eval $(call PKG_template,LIBMOUNT,libmount,${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKGSD_LIBMOUNT},${PKGSC_LIBMOUNT}))

CONFIGURE_ENV+=		have_scanf_alloc_modifier=yes \
			scanf_cv_alloc_modifier=ms
CONFIGURE_ARGS+=	--disable-use-tty-group \
			--disable-schedutils \
			--disable-cramfs \
			--disable-login \
			--disable-su \
			--enable-libuuid \
			--enable-libblkid \
			--enable-libmount \
			--enable-mount \
			--with-ncurses=$(STAGING_TARGET_DIR)/usr/include \
			--libdir=/usr/lib
FAKE_FLAGS+=		INSTALLSUID="install -m 4755"
TARGET_CFLAGS+=		-DSWAPON_HAS_TWO_ARGS -DHAVE_LLSEEK -ltinfo

util-linux-install:

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
	${INSTALL_DIR} ${IDIR_MOUNT}/bin
	${INSTALL_BIN} ${WRKINST}/usr/bin/{u,}mount ${IDIR_MOUNT}/bin

mcookie-install:
	${INSTALL_DIR} ${IDIR_MCOOKIE}/usr/bin
	${INSTALL_BIN} ${WRKINST}/usr/bin/mcookie ${IDIR_MCOOKIE}/usr/bin

libuuid-install:
	${INSTALL_DIR} ${IDIR_LIBUUID}/usr/lib
	${CP} ${WRKINST}/usr/lib/libuuid.so* ${IDIR_LIBUUID}/usr/lib

libblkid-install:
	${INSTALL_DIR} ${IDIR_LIBBLKID}/usr/lib
	${CP} ${WRKINST}/usr/lib/libblkid.so* ${IDIR_LIBBLKID}/usr/lib

libmount-install:
	${INSTALL_DIR} ${IDIR_LIBMOUNT}/usr/lib
	${CP} ${WRKINST}/usr/lib/libmount.so* ${IDIR_LIBMOUNT}/usr/lib

include ${TOPDIR}/mk/pkg-bottom.mk
