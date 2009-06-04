# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include ${TOPDIR}/rules.mk

PKG_NAME:=		rsync
PKG_VERSION:=		3.0.6
PKG_RELEASE:=		1
PKG_MD5SUM:=		e9865d093a18e4668b9d31b635dc8e99
PKG_DESCR:=		utility that provides fast incremental file transfer
PKG_SECTION:=		net
PKG_DEPENDS:=		libpopt
PKG_URL:=		http://rsync.samba.org
PKG_SITES:=		http://rsync.samba.org/ftp/rsync/

include ${TOPDIR}/mk/package.mk

$(eval $(call PKG_template,RSYNC,${PKG_NAME},${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))

CONFIGURE_STYLE:=	gnu
BUILD_STYLE:=		auto
INSTALL_STYLE:=		auto

post-install:
	${INSTALL_DIR} ${IDIR_RSYNC}/usr/bin
	${INSTALL_BIN} ${WRKINST}/usr/bin/rsync ${IDIR_RSYNC}/usr/bin

include ${TOPDIR}/mk/pkg-bottom.mk
