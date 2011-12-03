# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include ${TOPDIR}/rules.mk

PKG_NAME:=		util-linux
PKG_VERSION:=		2.20.1
PKG_RELEASE:=		1
PKG_MD5SUM:=		079b37517fd4e002a2e6e992e8b4e361
PKG_DESCR:=		Linux utilities
PKG_SECTION:=		fs
PKG_BUILDDEP:=		ncurses
PKG_SITES:=		ftp://ftp.infradead.org/pub/util-linux/v2.20/

DISTFILES:=		$(PKG_NAME)-$(PKG_VERSION).tar.bz2

PKG_SUBPKGS:=		FDISK SFDISK SWAP_UTILS LOSETUP MOUNT MCOOKIE
PKG_SUBPKGS+=		LIBUUID LIBBLKID LIBUUID_DEV
PKGSD_LIBUUID:=		UUID library
PKGSC_LIBUUID:=		libs
PKGSD_LIBUUID_DEV:=	UUID headers
PKGSC_LIBUUID_DEV:=	devel
PKGSD_LIBBLKID:=	BLKID library
PKGSC_LIBBLKID:=	libs
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
$(eval $(call PKG_template,LIBUUID,libuuid,${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKGSD_LIBUUID},${PKGSC_LIBUUID}))
$(eval $(call PKG_template,LIBUUID_DEV,libuuid-dev,${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKGSD_LIBUUID_DEV},${PKGSC_LIBUUID_DEV}))
$(eval $(call PKG_template,LIBBLKID,libblkid,${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKGSD_LIBBLKID},${PKGSC_LIBBLKID}))

CONFIGURE_ENV+=		scanf_cv_type_modifier=yes
CONFIGURE_ARGS+=	--disable-use-tty-group \
			--disable-schedutils \
			--disable-cramfs \
			--enable-libuuid \
			--enable-libblkid \
			--enable-libmount \
			--enable-mount
FAKE_FLAGS+=		INSTALLSUID="install -m 4755"
TARGET_CFLAGS+=		-DSWAPON_HAS_TWO_ARGS -DHAVE_LLSEEK

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

libuuid-install:
	${INSTALL_DIR} ${IDIR_LIBUUID}/usr/lib
	${CP} ${WRKINST}/usr/lib/libuuid.so* ${IDIR_LIBUUID}/usr/lib

libuuid-dev-install:
	${INSTALL_DIR} ${IDIR_LIBUUID_DEV}/usr/include
	${CP} ${WRKINST}/usr/include/* ${IDIR_LIBUUID_DEV}/usr/include

libblkid-install:
	${INSTALL_DIR} ${IDIR_LIBBLKID}/usr/lib
	${CP} ${WRKINST}/usr/lib/libblkid.so* ${IDIR_LIBBLKID}/usr/lib

include ${TOPDIR}/mk/pkg-bottom.mk
