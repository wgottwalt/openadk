# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include ${TOPDIR}/rules.mk

PKG_NAME:=		davfs2
PKG_VERSION:=		1.4.7
PKG_RELEASE:=		1
PKG_MD5SUM:=		c75f9d7d260e7364362b89beba2b3186
PKG_DESCR:=		WebDAV filesystem
PKG_SECTION:=		net/fs
PKG_DEPENDS:=		fuse-utils kmod-fuse-fs neon
PKG_BUILDDEP:=		libiconv-tiny neon fuse
PKG_URL:=		http://savannah.nongnu.org/projects/davfs2/
PKG_SITES:=		http://download.savannah.gnu.org/releases/davfs2/

PKG_LIBC_DEPENDS:=	uclibc glibc

DISTFILES:=		${PKG_NAME}-${PKG_VERSION}.tar.gz

include ${TOPDIR}/mk/package.mk

$(eval $(call PKG_template,DAVFS2,davfs2,${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))

CONFIGURE_ARGS+=	--with-neon
CONFIGURE_ENV+=		LIBS=-liconv

davfs2-install:
	${INSTALL_DIR} ${IDIR_DAVFS2}/etc/davfs2
	${INSTALL_DIR} ${IDIR_DAVFS2}/usr/sbin
	$(CP) ${WRKINST}/etc/davfs2/{davfs2.conf,secrets} \
		${IDIR_DAVFS2}/etc/davfs2
	${INSTALL_BIN} ${WRKINST}/usr/sbin/mount.davfs \
		${IDIR_DAVFS2}/usr/sbin
	${INSTALL_BIN} ${WRKINST}/usr/sbin/umount.davfs \
		${IDIR_DAVFS2}/usr/sbin

include ${TOPDIR}/mk/pkg-bottom.mk
