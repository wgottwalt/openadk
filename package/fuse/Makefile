# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include ${TOPDIR}/rules.mk

PKG_NAME:=		fuse
PKG_VERSION:=		2.7.4
PKG_RELEASE:=		2
PKG_MD5SUM:=		4879f06570d2225667534c37fea04213
PKG_DESCR:=		Filesystem in Userspace (utilities)
PKG_SECTION:=		fs
PKG_DEPENDS:=		kmod-fuse-fs libfuse
PKG_URL:=		http://fuse.sourceforge.net/
PKG_SITES:=		${MASTER_SITE_SOURCEFORGE:=${PKG_NAME}/}
PKG_LIBNAME:=		libfuse
PKG_OPTS:=		dev

PKG_SUBPKGS:=		FUSE_UTILS LIBFUSE
PKGSD_LIBFUSE:=		FUSE library
PKGSC_LIBFUSE:=		libs

include ${TOPDIR}/mk/package.mk

$(eval $(call PKG_template,FUSE_UTILS,fuse-utils,${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))
$(eval $(call PKG_template,LIBFUSE,libfuse,${PKG_VERSION}-${PKG_RELEASE},,${PKGSD_LIBFUSE},${PKGSC_LIBFUSE},${PKG_OPTS}))

CONFIGURE_ARGS+=	--enable-lib \
			--enable-util \
			--enable-example \
			--with-libiconv-prefix="${STAGING_TARGET_DIR}/usr" \
			--disable-auto-modprobe \
			--disable-mtab \
			--disable-kernel-module

fuse-utils-install:
	${INSTALL_DIR} ${IDIR_FUSE_UTILS}/usr/bin
	${CP} ${WRKINST}/usr/bin/fusermount ${IDIR_FUSE_UTILS}/usr/bin

libfuse-install:
	${INSTALL_DIR} ${IDIR_LIBFUSE}/usr/lib
	${CP} ${WRKINST}/usr/lib/libfuse.so* \
		${IDIR_LIBFUSE}/usr/lib
	${CP} ${WRKINST}/usr/lib/libulockmgr.so* \
		${IDIR_LIBFUSE}/usr/lib

include ${TOPDIR}/mk/pkg-bottom.mk
