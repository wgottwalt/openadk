# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include ${TOPDIR}/rules.mk

PKG_NAME:=		xfsprogs
PKG_VERSION:=		3.1.11
PKG_RELEASE:=		1
PKG_MD5SUM:=		de9f1f45026c2f4e0776058d429ff4b6
PKG_DESCR:=		utilities for XFS filesystems
PKG_SECTION:=		fs
PKG_BUILDDEP:=		e2fsprogs util-linux ncurses
PKG_DEPENDS:=		libuuid libpthread libblkid librt libncurses
PKG_URL:=		http://oss.sgi.com/projects/xfs
PKG_SITES:=		ftp://oss.sgi.com/projects/xfs/cmd_tars/ \
			ftp://oss.sgi.com/projects/xfs/previous/cmd_tars/

DISTFILES:=		${PKG_NAME}-${PKG_VERSION}.tar.gz
PKG_LIBC_DEPENDS:=	glibc

include ${TOPDIR}/mk/package.mk

$(eval $(call PKG_template,XFSPROGS,xfsprogs,${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))

INSTALL_STYLE:=		manual
TARGET_LDFLAGS+=	-lrt
CONFIGURE_ARGS+=	--enable-gettext=no \
			--with-gnu-ld
CONFIGURE_ENV+=		DEBUG=" " OPTIMIZER=" " PLATFORM=linux
ALL_TARGET=

do-install:
	${INSTALL_DIR} ${IDIR_XFSPROGS}/usr/sbin
	${INSTALL_BIN} ${WRKBUILD}/mkfs/mkfs.xfs ${IDIR_XFSPROGS}/usr/sbin
	${INSTALL_BIN} ${WRKBUILD}/repair/xfs_repair ${IDIR_XFSPROGS}/usr/sbin
	${INSTALL_BIN} ${WRKBUILD}/growfs/xfs_growfs ${IDIR_XFSPROGS}/usr/sbin

include ${TOPDIR}/mk/pkg-bottom.mk
