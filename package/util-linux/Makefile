# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include ${TOPDIR}/rules.mk

PKG_NAME:=		util-linux
PKG_VERSION:=		2.24.2
PKG_RELEASE:=		1
PKG_MD5SUM:=		3f191727a0d28f7204b755cf1b6ea0aa
PKG_DESCR:=		basic Linux utilities
PKG_SECTION:=		core
PKG_BUILDDEP:=		ncurses pam
PKG_SITES:=		http://www.kernel.org/pub/linux/utils/util-linux/v2.24/
PKG_NOPARALLEL:=	1
PKG_OPTS:=		dev

PKG_ARCH_DEPENDS:=	!m68k

PKG_SUBPKGS:=		FDISK SFDISK SWAP_UTILS LOSETUP MCOOKIE MOUNT
PKG_SUBPKGS+=		LIBUUID LIBBLKID LIBMOUNT SU CFDISK
PKGSD_LIBUUID:=		uuid library
PKGSC_LIBUUID:=		libs
PKGSD_LIBBLKID:=	blkid library
PKGSC_LIBBLKID:=	libs
PKGSD_LIBMOUNT:=	mount library
PKGSC_LIBMOUNT:=	libs
PKGSD_FDISK:=		partition table manipulation utility
PKGSC_FDISK:=		fs
PKGSD_SFDISK:=		scriptable partition table manipulation utility
PKGSC_SFDISK:=		fs
PKGSD_CFDISK:=		partition table manipulation utility
PKGSC_CFDISK:=		fs
PKGSD_SU:=		switch user utility
PKGSC_SU:=		misc
PKGSD_SWAP_UTILS:=	swap space management utilities
PKGSS_SWAP_UTILS:=	libblkid
PKGSC_SWAP_UTILS:=	fs
PKGSD_LOSETUP:=		loop devices management utilities
PKGSS_LOSETUP:=		kmod-blk-dev-loop
PKGSC_LOSETUP:=		fs
PKGSD_MOUNT:=		mount/umount utilities
PKGSS_MOUNT:=		libblkid libmount libuuid libncurses
PKGSC_MOUNT:=		fs
PKGSD_MCOOKIE:=		generate magic cookies for xauth
PKGSC_MCOOKIE:=		x11/apps

include ${TOPDIR}/mk/package.mk

$(eval $(call PKG_template,FDISK,fdisk,${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKGSD_FDISK},${PKGSC_FDISK}))
$(eval $(call PKG_template,CFDISK,cfdisk,${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKGSD_CFDISK},${PKGSC_CFDISK}))
$(eval $(call PKG_template,SFDISK,sfdisk,${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKGSD_SFDISK},${PKGSC_SFDISK}))
$(eval $(call PKG_template,SU,su,${PKG_VERSION}-${PKG_RELEASE},${PKGSS_SU},${PKGSD_SU},${PKGSC_SU}))
$(eval $(call PKG_template,SWAP_UTILS,swap-utils,${PKG_VERSION}-${PKG_RELEASE},${PKGSS_SWAP_UTILS},${PKGSD_SWAP_UTILS},${PKGSC_SWAP_UTILS}))
$(eval $(call PKG_template,LOSETUP,losetup,${PKG_VERSION}-${PKG_RELEASE},${PKGSS_LOSETUP},${PKGSD_LOSETUP},${PKGSC_LOSETUP}))
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
			--enable-su \
			--enable-libuuid \
			--enable-libblkid \
			--enable-libmount \
			--enable-mount \
			--with-ncurses=$(STAGING_TARGET_DIR)/usr/include \
			--libdir=/usr/lib
FAKE_FLAGS+=		INSTALLSUID="install -m 4755"
TARGET_CFLAGS+=		-DSWAPON_HAS_TWO_ARGS -DHAVE_LLSEEK -ltinfo

fdisk-install:
	${INSTALL_DIR} ${IDIR_FDISK}/usr/sbin
	${CP} ${WRKINST}/sbin/fdisk ${IDIR_FDISK}/usr/sbin

cfdisk-install:
	${INSTALL_DIR} ${IDIR_CFDISK}/usr/sbin
	${CP} ${WRKINST}/sbin/cfdisk ${IDIR_FDISK}/usr/sbin

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
