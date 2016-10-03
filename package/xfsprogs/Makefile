# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include ${ADK_TOPDIR}/rules.mk

PKG_NAME:=		xfsprogs
PKG_VERSION:=		4.7.0
PKG_RELEASE:=		1
PKG_HASH:=		88580bb3e6847c3edef436703a4fae403fc19b20739db4c31166ee4b256178d7
PKG_DESCR:=		utilities for xfs filesystems
PKG_SECTION:=		sys/fs
PKG_DEPENDS:=		libuuid libncurses
PKG_BUILDDEP:=		e2fsprogs ncurses
PKG_NEEDS:=		threads
PKG_URL:=		http://oss.sgi.com/projects/xfs
PKG_SITES:=		ftp://oss.sgi.com/projects/xfs/cmd_tars/ \
			ftp://oss.sgi.com/projects/xfs/previous/cmd_tars/

PKG_NOPARALLEL:=	1
DISTFILES:=		${PKG_NAME}-${PKG_VERSION}.tar.gz

include ${ADK_TOPDIR}/mk/package.mk

$(eval $(call PKG_template,XFSPROGS,xfsprogs,${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))

INSTALL_STYLE:=		manual
TARGET_LDFLAGS+=	-lrt
CONFIGURE_ARGS+=	--enable-gettext=no \
			--enable-blkid=no \
			--with-gnu-ld
CONFIGURE_ENV+=		DEBUG=" " OPTIMIZER=" " PLATFORM=linux \
			ac_cv_header_aio_h=yes ac_cv_lib_rt_lio_listio=yes
ALL_TARGET=

do-install:
	${INSTALL_DIR} ${IDIR_XFSPROGS}/usr/sbin
	${INSTALL_BIN} ${WRKBUILD}/mkfs/mkfs.xfs ${IDIR_XFSPROGS}/usr/sbin
	${INSTALL_BIN} ${WRKBUILD}/repair/xfs_repair ${IDIR_XFSPROGS}/usr/sbin
	${INSTALL_BIN} ${WRKBUILD}/growfs/xfs_growfs ${IDIR_XFSPROGS}/usr/sbin

include ${ADK_TOPDIR}/mk/pkg-bottom.mk
