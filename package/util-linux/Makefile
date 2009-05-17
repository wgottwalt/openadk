# $Id$
#-
# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include ${TOPDIR}/rules.mk

PKG_NAME:=		util-linux
PKG_VERSION:=		2.12r
PKG_RELEASE:=		1
PKG_MD5SUM:=		c261230b27fc0fbcc287c76884caf2d3

MASTER_SITES:=		ftp://ftp.kernel.org/pub/linux/utils/util-linux/ \
			http://ftp.kernel.org/pub/linux/utils/util-linux/ \
			ftp://ftp.de.kernel.org/pub/linux/utils/util-linux/ \
			http://ftp.de.kernel.org/pub/linux/utils/util-linux/

include ${TOPDIR}/mk/package.mk

$(eval $(call PKG_template,FDISK,fdisk,${PKG_VERSION}-${PKG_RELEASE},${ARCH}))
$(eval $(call PKG_template,LOSETUP,losetup,${PKG_VERSION}-${PKG_RELEASE},${ARCH}))
$(eval $(call PKG_template,SWAP_UTILS,swap-utils,${PKG_VERSION}-${PKG_RELEASE},${ARCH}))

CONFIGURE_STYLE:=	gnu
BUILD_STYLE:=		auto
INSTALL_STYLE:=		auto
MAKE_FLAGS+=		OPT="${TCFLAGS}" ARCH="${ARCH}"
FAKE_FLAGS+=		INSTALLSUID="install -m 4755"
TCFLAGS+=		-DSWAPON_HAS_TWO_ARGS -DHAVE_LLSEEK

post-install:
	${INSTALL_DIR} ${IDIR_FDISK}/usr/sbin
	${CP} ${WRKINST}/sbin/fdisk ${IDIR_FDISK}/usr/sbin/
	${INSTALL_DIR} ${IDIR_LOSETUP}/usr/sbin
	${CP} ${WRKINST}/sbin/losetup ${IDIR_LOSETUP}/usr/sbin/
	${INSTALL_DIR} ${IDIR_SWAP_UTILS}/usr/sbin
	${CP} ${WRKINST}/sbin/mkswap ${IDIR_SWAP_UTILS}/usr/sbin/
	${CP} ${WRKINST}/sbin/swap{on,off} ${IDIR_SWAP_UTILS}/usr/sbin/

include ${TOPDIR}/mk/pkg-bottom.mk
