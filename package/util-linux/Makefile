# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include ${ADK_TOPDIR}/rules.mk

PKG_NAME:=		util-linux
PKG_VERSION:=		2.25.2
PKG_RELEASE:=		3
PKG_HASH:=		e0457f715b73f4a349e1acb08cb410bf0edc9a74a3f75c357070f31f70e33cd6
PKG_DESCR:=		basic utilities
PKG_SECTION:=		base/apps
PKG_BUILDDEP:=		ncurses pam
PKG_SITES:=		http://www.kernel.org/pub/linux/utils/util-linux/v2.25/
PKG_OPTS:=		dev

PKG_SUBPKGS:=		FDISK SFDISK SWAP_UTILS LOSETUP MCOOKIE MOUNT
PKG_SUBPKGS+=		LIBUUID LIBBLKID LIBMOUNT SU CFDISK MKFS
PKGSD_LIBUUID:=		uuid library
PKGSC_LIBUUID:=		libs/misc
PKGSD_LIBBLKID:=	blkid library
PKGSC_LIBBLKID:=	libs/misc
PKGSD_LIBMOUNT:=	mount library
PKGSC_LIBMOUNT:=	libs/misc
PKGSD_FDISK:=		partition table manipulation utility
PKGSC_FDISK:=		sys/fs
PKGSD_SFDISK:=		scriptable partition table manipulation utility
PKGSC_SFDISK:=		sys/fs
PKGSD_CFDISK:=		partition table manipulation utility
PKGSC_CFDISK:=		sys/fs
PKGSD_SU:=		switch user utility
PKGSC_SU:=		sys/misc
PKGSD_SWAP_UTILS:=	swap space management utilities
PKGSS_SWAP_UTILS:=	libblkid
PKGSC_SWAP_UTILS:=	sys/fs
PKGSD_LOSETUP:=		loop devices management utilities
PKGSC_LOSETUP:=		sys/fs
PKGSD_MKFS:=		filesystem creation frontend
PKGSC_MKFS:=		sys/fs
PKGSD_MOUNT:=		mount/umount utilities
PKGSS_MOUNT:=		libblkid libmount libuuid libncurses
PKGSC_MOUNT:=		sys/fs
PKGSD_MCOOKIE:=		generate magic cookies for xauth
PKGSC_MCOOKIE:=		x11/utils

include ${ADK_TOPDIR}/mk/package.mk

$(eval $(call PKG_template,FDISK,fdisk,${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKGSD_FDISK},${PKGSC_FDISK}))
$(eval $(call PKG_template,CFDISK,cfdisk,${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKGSD_CFDISK},${PKGSC_CFDISK}))
$(eval $(call PKG_template,SFDISK,sfdisk,${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKGSD_SFDISK},${PKGSC_SFDISK}))
$(eval $(call PKG_template,SU,su,${PKG_VERSION}-${PKG_RELEASE},${PKGSS_SU},${PKGSD_SU},${PKGSC_SU}))
$(eval $(call PKG_template,SWAP_UTILS,swap-utils,${PKG_VERSION}-${PKG_RELEASE},${PKGSS_SWAP_UTILS},${PKGSD_SWAP_UTILS},${PKGSC_SWAP_UTILS}))
$(eval $(call PKG_template,LOSETUP,losetup,${PKG_VERSION}-${PKG_RELEASE},${PKGSS_LOSETUP},${PKGSD_LOSETUP},${PKGSC_LOSETUP}))
$(eval $(call PKG_template,MKFS,mkfs,${PKG_VERSION}-${PKG_RELEASE},${PKGSS_MKFS},${PKGSD_MKFS},${PKGSC_MKFS}))
$(eval $(call PKG_template,MOUNT,mount,${PKG_VERSION}-${PKG_RELEASE},${PKGSS_MOUNT},${PKGSD_MOUNT},${PKGSC_MOUNT}))
$(eval $(call PKG_template,MCOOKIE,mcookie,${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKGSD_MCOOKIE},${PKGSC_MCOOKIE}))
$(eval $(call PKG_template,LIBUUID,libuuid,${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKGSD_LIBUUID},${PKGSC_LIBUUID},${PKG_OPTS}))
$(eval $(call PKG_template,LIBBLKID,libblkid,${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKGSD_LIBBLKID},${PKGSC_LIBBLKID},${PKG_OPTS}))
$(eval $(call PKG_template,LIBMOUNT,libmount,${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKGSD_LIBMOUNT},${PKGSC_LIBMOUNT},${PKG_OPTS}))

TARGET_CFLAGS+=		-DSWAPON_HAS_TWO_ARGS -DHAVE_LLSEEK
TARGET_LDFLAGS+=	-ltinfo
AUTOTOOL_STYLE:=	autoreconf
CONFIGURE_ENV+=		have_scanf_alloc_modifier=yes \
			scanf_cv_alloc_modifier=ms

ifeq ($(ADK_TARGET_USE_STATIC_LIBS),y)
CONFIGURE_ARGS+=	--disable-su
CONFIGURE_ARGS+=	--disable-runuser
else
CONFIGURE_ARGS+=	--enable-su
endif

CONFIGURE_ARGS+=	--disable-use-tty-group \
			--disable-schedutils \
			--disable-cramfs \
			--disable-login \
			--disable-eject \
			--without-python \
			--without-systemd \
			--without-user \
			--enable-libuuid \
			--enable-libblkid \
			--enable-libmount \
			--enable-mount
FAKE_FLAGS+=		INSTALLSUID="install -m 4755"

fdisk-install:
	${INSTALL_DIR} ${IDIR_FDISK}/usr/sbin
	${CP} ${WRKINST}/usr/sbin/fdisk ${IDIR_FDISK}/usr/sbin

cfdisk-install:
	${INSTALL_DIR} ${IDIR_CFDISK}/usr/sbin
	${CP} ${WRKINST}/usr/sbin/cfdisk ${IDIR_FDISK}/usr/sbin

sfdisk-install:
	${INSTALL_DIR} ${IDIR_SFDISK}/usr/sbin
	${CP} ${WRKINST}/usr/sbin/sfdisk ${IDIR_SFDISK}/usr/sbin

losetup-install:
	${INSTALL_DIR} ${IDIR_LOSETUP}/usr/sbin
	${CP} ${WRKINST}/usr/sbin/losetup ${IDIR_LOSETUP}/usr/sbin

swap-utils-install:
	${INSTALL_DIR} ${IDIR_SWAP_UTILS}/usr/sbin
	${CP} ${WRKINST}/usr/sbin/mkswap ${IDIR_SWAP_UTILS}/usr/sbin
	${CP} ${WRKINST}/usr/sbin/swap{on,off} ${IDIR_SWAP_UTILS}/usr/sbin

mkfs-install:
	${INSTALL_DIR} ${IDIR_MKFS}/usr/sbin
	${INSTALL_BIN} ${WRKINST}/usr/sbin/mkfs ${IDIR_MKFS}/usr/sbin

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

include ${ADK_TOPDIR}/mk/pkg-bottom.mk
