# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include ${TOPDIR}/rules.mk

PKG_NAME:=		ntfs-3g
PKG_VERSION:=		2014.2.15
PKG_RELEASE:=		4
PKG_MD5SUM:=		f11d563816249d730a00498983485f3a
PKG_DESCR:=		ntfs filesystem driver using fuse
PKG_SECTION:=		fs
PKG_URL:=		http://tuxera.com
PKG_SITES:=		http://tuxera.com/opensource/

DISTFILES:=		${PKG_NAME}_ntfsprogs-${PKG_VERSION}.tgz
WRKDIST=		${WRKDIR}/${PKG_NAME}_ntfsprogs-${PKG_VERSION}

include ${TOPDIR}/mk/package.mk

$(eval $(call PKG_template,NTFS_3G,ntfs-3g,${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))

CONFIGURE_ARGS+=	--disable-ldconfig \
			--disable-library

ntfs-3g-install:
	${INSTALL_DIR} ${IDIR_NTFS_3G}/bin
	${INSTALL_BIN} ${WRKINST}/bin/ntfs-3g ${IDIR_NTFS_3G}/bin
	cd ${IDIR_NTFS_3G}/bin && ln -sf ntfs-3g mount.ntfs-3g

include ${TOPDIR}/mk/pkg-bottom.mk
