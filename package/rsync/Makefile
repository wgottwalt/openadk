# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include ${ADK_TOPDIR}/rules.mk

PKG_NAME:=		rsync
PKG_VERSION:=		3.0.9
PKG_RELEASE:=		2
PKG_HASH:=		30f10f8dd5490d28240d4271bb652b1da7a60b22ed2b9ae28090668de9247c05
PKG_DESCR:=		utility that provides fast incremental file transfer
PKG_SECTION:=		net/misc
PKG_DEPENDS:=		libpopt
PKG_BUILDDEP:=		popt
PKG_URL:=		http://rsync.samba.org/
PKG_SITES:=		http://rsync.samba.org/ftp/rsync/

DISTFILES:=		${PKG_NAME}-${PKG_VERSION}.tar.gz

include ${ADK_TOPDIR}/mk/package.mk

$(eval $(call PKG_template,RSYNC,rsync,${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))

rsync-install:
	${INSTALL_DIR} ${IDIR_RSYNC}/usr/bin
	${INSTALL_BIN} ${WRKINST}/usr/bin/rsync ${IDIR_RSYNC}/usr/bin

include ${ADK_TOPDIR}/mk/pkg-bottom.mk
