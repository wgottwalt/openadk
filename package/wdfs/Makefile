# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include ${TOPDIR}/rules.mk

PKG_NAME:=		wdfs
PKG_VERSION:=		1.4.2
PKG_RELEASE:=		6
PKG_MD5SUM:=		628bb44194d04c1cf8aacc446ed0a230
PKG_DESCR:=		WebDAV filesystem
PKG_SECTION:=		net/fs
PKG_DEPENDS:=		libopenssl fuse-utils neon glib
PKG_BUILDDEP:=		openssl fuse neon glib
PKG_SITES:=		http://noedler.de/projekte/wdfs/

DISTFILES:=		${PKG_NAME}-${PKG_VERSION}.tar.gz

include ${TOPDIR}/mk/package.mk

$(eval $(call PKG_template,WDFS,wdfs,${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))

wdfs-install:
	${INSTALL_DIR} ${IDIR_WDFS}/usr/bin
	${CP} ${WRKINST}/usr/bin/wdfs ${IDIR_WDFS}/usr/bin

include ${TOPDIR}/mk/pkg-bottom.mk
