# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include ${TOPDIR}/rules.mk

PKG_NAME=		ntfs-3g
PKG_VERSION=		2009.4.4
PKG_RELEASE=		1
PKG_MD5SUM=		e0b5c170f088a8d82968f0a6b34d31da
PKG_DESCR:=		ntfs filesystem driver with read and write support
PKG_SECTION:=		sys
PKG_DEPENDS:=		kmod-fuse-fs
PKG_URL:=		http://www.ntfs-3g.org
PKG_SITES=		http://www.ntfs-3g.org/

DISTFILES:=		${PKG_NAME}-${PKG_VERSION}.tgz

include ${TOPDIR}/mk/package.mk

$(eval $(call PKG_template,NTFS_3G,${PKG_NAME},${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))

CONFIGURE_ARGS+=	--disable-ldconfig \
			--disable-library
CONFIGURE_STYLE=	gnu
BUILD_STYLE=		auto
INSTALL_STYLE=		auto

post-install:
	${INSTALL_DIR} ${IDIR_NTFS_3G}/{bin,sbin}
	${CP} ${WRKINST}/bin/ntfs-3g ${IDIR_NTFS_3G}/bin
	${CP} ${WRKINST}/sbin/mount.ntfs-3g ${IDIR_NTFS_3G}/sbin

include ${TOPDIR}/mk/pkg-bottom.mk
