# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include ${TOPDIR}/rules.mk

PKG_NAME:=		util-linux-ng
PKG_VERSION:=		2.17.2
PKG_RELEASE:=		1
PKG_MD5SUM:=		4c810430e86d53b6ea5e7ae279b39186
PKG_DESCR:=		Linux utilities
PKG_SECTION:=		admin
PKG_BUILDDEP+=		e2fsprogs ncurses
PKG_URL:=		http://userweb.kernel.org/~kzak/util-linux-ng
PKG_SITES:=		${MASTER_SITE_KERNEL:=utils/util-linux-ng/v2.17/}

PKG_DESCR_FDISK:=	Partition table manipulation utility
PKG_DESCR_SFDISK:=	Scriptable Partition table manipulation utility
PKG_DESCR_SWAP:=	Swap space management utilities
PKG_DEPENDS_SWAP:=	libblkid
PKG_DESCR_LOOP:=	Loop devices setup and control utility
PKG_DEPENDS_LOOP:=	kmod-blk-dev-loop
PKG_DESCR_MCOOKIE:=	Generate magic cookies for xauth

include ${TOPDIR}/mk/package.mk

$(eval $(call PKG_template,FDISK,fdisk,${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR_FDISK},${PKG_SECTION}))
$(eval $(call PKG_template,SFDISK,sfdisk,${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR_SFDISK},${PKG_SECTION}))
$(eval $(call PKG_template,SWAP_UTILS,swap-utils,${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS_SWAP},${PKG_DESCR_SWAP},${PKG_SECTION}))
$(eval $(call PKG_template,LOSETUP,losetup,${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS_LOOP},${PKG_DESCR_LOOP},${PKG_SECTION}))
$(eval $(call PKG_template,MCOOKIE,mcookie,${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR_MCOOKIE},${PKG_SECTION}))

CONFIGURE_ARGS+=	--disable-use-tty-group \
			--disable-schedutils \
			--disable-cramfs \
			--disable-libblkid \
			--disable-libuuid
MAKE_FLAGS+=		OPT="${TCFLAGS}" ARCH="${ARCH}"
FAKE_FLAGS+=		INSTALLSUID="install -m 4755"
TCFLAGS+=		-DSWAPON_HAS_TWO_ARGS -DHAVE_LLSEEK

post-install:
	${INSTALL_DIR} ${IDIR_FDISK}/usr/sbin
	${CP} ${WRKINST}/sbin/fdisk ${IDIR_FDISK}/usr/sbin/
	${INSTALL_DIR} ${IDIR_SFDISK}/usr/sbin
	${CP} ${WRKINST}/sbin/sfdisk ${IDIR_SFDISK}/usr/sbin/
	${INSTALL_DIR} ${IDIR_LOSETUP}/usr/sbin
	${CP} ${WRKINST}/sbin/losetup ${IDIR_LOSETUP}/usr/sbin/
	${INSTALL_DIR} ${IDIR_SWAP_UTILS}/usr/sbin
	${CP} ${WRKINST}/sbin/mkswap ${IDIR_SWAP_UTILS}/usr/sbin/
	${CP} ${WRKINST}/sbin/swap{on,off} ${IDIR_SWAP_UTILS}/usr/sbin/
	${INSTALL_DIR} ${IDIR_MCOOKIE}/usr/bin
	${INSTALL_BIN} ${WRKINST}/usr/bin/mcookie ${IDIR_MCOOKIE}/usr/bin/

include ${TOPDIR}/mk/pkg-bottom.mk
