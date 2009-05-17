# $Id$
#-
# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include ${TOPDIR}/rules.mk

PKG_NAME=		kmod-fs-ntfs-3g
PKG_VERSION=		2009.3.8
PKG_RELEASE=		1
PKG_MD5SUM=		da67f4c651649f5a463af293c347c387
PKG_MODULE=		1
MASTER_SITES=		http://www.ntfs-3g.org/
DISTFILES=		ntfs-3g-${PKG_VERSION}.tgz
WRKDIST=		${WRKDIR}/ntfs-3g-${PKG_VERSION}

include ${TOPDIR}/mk/package.mk

$(eval $(call PKG_template,KMOD_FS_NTFS_3G,kmod-fs-ntfs-3g,${KERNEL_VERSION}-${DEVICE}-${PKG_RELEASE},${ARCH},kernel (${KERNEL_VERSION}-${DEVICE}-${KERNEL_RELEASE})))

CONFIGURE_ARGS+=	--disable-ldconfig \
			--disable-library
CONFIGURE_STYLE=	gnu
BUILD_STYLE=		auto
INSTALL_STYLE=		auto

post-install:
	${INSTALL_DIR} ${IDIR_KMOD_FS_NTFS_3G}/{bin,sbin}
	${CP} ${WRKINST}/bin/ntfs-3g ${IDIR_KMOD_FS_NTFS_3G}/bin
	${CP} ${WRKINST}/sbin/mount.ntfs-3g ${IDIR_KMOD_FS_NTFS_3G}/sbin

include ${TOPDIR}/mk/pkg-bottom.mk
