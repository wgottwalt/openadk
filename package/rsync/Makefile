# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include ${TOPDIR}/rules.mk

PKG_NAME:=		rsync
PKG_VERSION:=		3.0.7
PKG_RELEASE:=		1
PKG_MD5SUM:=		b53525900817cf1ba7ad3a516ab5bfe9
PKG_DESCR:=		utility that provides fast incremental file transfer
PKG_SECTION:=		net/misc
PKG_DEPENDS:=		libpopt
PKG_BUILDDEP+=		popt
PKG_URL:=		http://rsync.samba.org
PKG_SITES:=		http://rsync.samba.org/ftp/rsync/

include ${TOPDIR}/mk/package.mk

$(eval $(call PKG_template,RSYNC,${PKG_NAME},${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))

post-install:
	${INSTALL_DIR} ${IDIR_RSYNC}/usr/bin
	${INSTALL_BIN} ${WRKINST}/usr/bin/rsync ${IDIR_RSYNC}/usr/bin

include ${TOPDIR}/mk/pkg-bottom.mk
