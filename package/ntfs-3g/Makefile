# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include ${TOPDIR}/rules.mk

PKG_NAME=		ntfs-3g
PKG_VERSION=		2010.1.16
PKG_RELEASE=		1
PKG_MD5SUM=		e104c914e8d7d29ee83e63d46afbba25
PKG_DESCR:=		ntfs filesystem driver with read and write support
PKG_SECTION:=		sys
PKG_DEPENDS:=		kmod-fuse-fs
PKG_URL:=		http://tuxera.com
PKG_SITES=		http://tuxera.com/opensource/

DISTFILES:=		${PKG_NAME}-${PKG_VERSION}.tgz

include ${TOPDIR}/mk/package.mk

$(eval $(call PKG_template,NTFS_3G,${PKG_NAME},${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))

CONFIGURE_ARGS+=	--disable-ldconfig \
			--disable-library
CONFIGURE_STYLE=	gnu
BUILD_STYLE=		auto
INSTALL_STYLE=		auto

post-install:
	${INSTALL_DIR} ${IDIR_NTFS_3G}/bin
	${INSTALL_BIN} ${WRKINST}/bin/ntfs-3g ${IDIR_NTFS_3G}/bin
	cd ${WRKINST}/bin && ln -sf ntfs-3g mount.ntfs-3g

include ${TOPDIR}/mk/pkg-bottom.mk
