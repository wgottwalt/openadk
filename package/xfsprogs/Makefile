# $Id$
#-
# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include ${TOPDIR}/rules.mk

PKG_NAME:=		xfsprogs
PKG_VERSION:=		3.0.0
PKG_RELEASE:=		1
PKG_MD5SUM:=		ec734f935ec87ebb8be890d29380a3e6
MASTER_SITES:=		ftp://oss.sgi.com/projects/xfs/cmd_tars/ \
			ftp://oss.sgi.com/projects/xfs/previous/cmd_tars/

include ${TOPDIR}/mk/package.mk

$(eval $(call PKG_template,XFSPROGS,xfsprogs,${PKG_VERSION}-${PKG_RELEASE}))

CONFIGURE_STYLE=	autoconf gnu
CONFIGURE_ARGS+=	--enable-gettext=no \
			--with-gnu-ld
CONFIGURE_ENV+=		DEBUG=" " OPTIMIZER=" "
BUILD_STYLE=		auto
INSTALL_STYLE=		auto
ALL_TARGET=		

post-install:
	${INSTALL_DIR} ${IDIR_XFSPROGS}/sbin
	${CP} ${WRKINST}/usr/sbin/mkfs.xfs ${IDIR_XFSPROGS}/sbin/
	${CP} ${WRKINST}/usr/sbin/xfs_repair ${IDIR_XFSPROGS}/sbin/

include ${TOPDIR}/mk/pkg-bottom.mk
