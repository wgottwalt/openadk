# $Id$
#-
# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include ${TOPDIR}/rules.mk

PKG_NAME:=		rsync
PKG_VERSION:=		3.0.6
PKG_RELEASE:=		1
PKG_MD5SUM:=		e9865d093a18e4668b9d31b635dc8e99
MASTER_SITES:=		http://rsync.samba.org/ftp/rsync/

include ${TOPDIR}/mk/package.mk

$(eval $(call PKG_template,RSYNC,rsync,${PKG_VERSION}-${PKG_RELEASE}))

CONFIGURE_STYLE:=	gnu
BUILD_STYLE:=		auto
INSTALL_STYLE:=		auto

post-install:
	${INSTALL_DIR} ${IDIR_RSYNC}/usr/bin
	${CP} ${WRKINST}/usr/bin/* ${IDIR_RSYNC}/usr/bin

include ${TOPDIR}/mk/pkg-bottom.mk
