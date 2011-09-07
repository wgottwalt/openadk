# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include ${TOPDIR}/rules.mk

PKG_NAME:=		e2fsprogs
PKG_VERSION:=		1.41.14
PKG_RELEASE:=		3
PKG_MD5SUM:=		05f70470aea2ef7efbb0845b2b116720
PKG_DESCR:=		Ext2/3/4 filesystem utilities
PKG_SECTION:=		fs
PKG_DEPENDS:=		libcom-err libuuid libblkid libpthread
PKG_URL:=		http://e2fsprogs.sourceforge.net/
PKG_SITES:=		${MASTER_SITE_SOURCEFORGE:=e2fsprogs/}

PKG_CFLINE_E2FSPROGS:=	default y if ADK_TARGET_ROOTFS_CF

PKG_SUBPKGS:=		E2FSPROGS LIBUUID LIBCOM_ERR LIBSS LIBBLKID E2FSCK_STATIC
PKG_SUBPKGS+=		LIBCOM_ERR_DEV LIBSS_DEV LIBUUID_DEV LIBBLKID_DEV
PKG_SUBPKGS+=		RESIZE2FS
PKGSD_LIBUUID:=		UUID library
PKGSC_LIBUUID:=		libs
PKGSD_LIBUUID_DEV:=	UUID headers
PKGSC_LIBUUID_DEV:=	devel
PKGSD_LIBCOM_ERR:=	Common error library
PKGSC_LIBCOM_ERR:=	libs
PKGSD_LIBCOM_ERR_DEV:=	Common error headers
PKGSC_LIBCOM_ERR_DEV:=	devel
PKGSD_LIBSS:=		Subsystem command parsing library
PKGSC_LIBSS:=		libs
PKGSD_LIBSS_DEV:=	Subsystem command parsing headers
PKGSC_LIBSS_DEV:=	devel
PKGSD_LIBBLKID:=	blkid library
PKGSC_LIBBLKID:=	libs
PKGSD_LIBBLKID_DEV:=	blkid headers
PKGSC_LIBBLKID_DEV:=	devel
PKGSD_E2FSCK_STATIC:=	Static build of e2fsck
PKGSC_E2FSCK_STATIC:=	fs
PKGSD_RESIZE2FS:=	Resize FS utility
PKGSC_RESIZE2FS:=	fs

include ${TOPDIR}/mk/package.mk

$(eval $(call PKG_template,E2FSPROGS,${PKG_NAME},${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))
$(eval $(call PKG_template,LIBUUID,libuuid,${PKG_VERSION}-${PKG_RELEASE},,${PKGSD_LIBUUID},${PKGSC_LIBUUID}))
$(eval $(call PKG_template,LIBUUID_DEV,libuuid-dev,${PKG_VERSION}-${PKG_RELEASE},,${PKGSD_LIBUUID_DEV},${PKGSC_LIBUUID_DEV}))
$(eval $(call PKG_template,LIBCOM_ERR,libcom-err,${PKG_VERSION}-${PKG_RELEASE},,${PKGSD_LIBCOM_ERR},${PKGSC_LIBCOM_ERR}))
$(eval $(call PKG_template,LIBCOM_ERR_DEV,libcom-err-dev,${PKG_VERSION}-${PKG_RELEASE},,${PKGSD_LIBCOM_ERR_DEV},${PKGSC_LIBCOM_ERR_DEV}))
$(eval $(call PKG_template,LIBSS,libss,${PKG_VERSION}-${PKG_RELEASE},,${PKGSD_LIBSS},${PKGSC_LIBSS}))
$(eval $(call PKG_template,LIBSS_DEV,libss-dev,${PKG_VERSION}-${PKG_RELEASE},,${PKGSD_LIBSS_DEV},${PKGSC_LIBSS_DEV}))
$(eval $(call PKG_template,LIBBLKID,libblkid,${PKG_VERSION}-${PKG_RELEASE},,${PKGSD_LIBBLKID},${PKGSC_LIBBLKID}))
$(eval $(call PKG_template,LIBBLKID_DEV,libblkid-dev,${PKG_VERSION}-${PKG_RELEASE},,${PKGSD_LIBBLKID_DEV},${PKGSC_LIBBLKID_DEV}))
$(eval $(call PKG_template,E2FSCK_STATIC,e2fsck-static,${PKG_VERSION}-${PKG_RELEASE},,${PKGSD_E2FSCK_STATIC},${PKGSC_E2FSCK_STATIC}))
$(eval $(call PKG_template,RESIZE2FS,resize2fs,${PKG_VERSION}-${PKG_RELEASE},,${PKGSD_RESIZE2FS},${PKGSC_RESIZE2FS}))

CONFIGURE_ARGS+=	--enable-elf-shlibs --disable-rpath
INSTALL_TARGET+=	install-libs
TARGET_LDFLAGS+=	-lpthread
MAKE_FLAGS+=		BUILD_CC="${CC_FOR_BUILD}" \
			BUILD_CFLAGS="${CFLAGS_FOR_BUILD}" \
			BUILD_LDFLAGS="${LDFLAGS_FOR_BUILD}" \
			BUILD_CPPFLAGS="${CPPFLAGS_FOR_BUILD}"

post-build:
	${INSTALL_DIR} ${STAGING_DIR}/usr/include/uuid
	${CP} ${WRKBUILD}/lib/uuid/uuid.h \
		${STAGING_DIR}/usr/include/uuid
ifneq ($(ADK_PACKAGE_E2FSCK_STATIC),)
	${MAKE} -C ${WRKBUILD}/e2fsck e2fsck.static
	${INSTALL_DIR} ${WRKINST}/usr/sbin
	${INSTALL_BIN} ${WRKBUILD}/e2fsck/e2fsck.static ${WRKINST}/usr/sbin
endif

e2fsprogs-install:
	${INSTALL_DIR} ${IDIR_E2FSPROGS}/etc
	${INSTALL_DATA} ${WRKINST}/etc/mke2fs.conf ${IDIR_E2FSPROGS}/etc
	${INSTALL_DIR} ${IDIR_E2FSPROGS}/usr/lib ${IDIR_E2FSPROGS}/usr/sbin
	${INSTALL_BIN} ${WRKINST}/usr/sbin/e2fsck ${IDIR_E2FSPROGS}/usr/sbin
	cd $(IDIR_E2FSPROGS)/usr/sbin && ln -sf e2fsck fsck.ext2
	${INSTALL_BIN} ${WRKINST}/usr/sbin/mke2fs ${IDIR_E2FSPROGS}/usr/sbin
	${INSTALL_BIN} ${WRKINST}/usr/sbin/tune2fs ${IDIR_E2FSPROGS}/usr/sbin
	${CP} ${WRKINST}/usr/lib/lib{e2p,ext2fs}.so.* \
		${IDIR_E2FSPROGS}/usr/lib

resize2fs-install:
	${INSTALL_DIR} ${IDIR_RESIZE2FS}/usr/sbin
	${INSTALL_BIN} ${WRKINST}/usr/sbin/resize2fs ${IDIR_RESIZE2FS}/usr/sbin

libblkid-install:
	${INSTALL_DIR} ${IDIR_LIBBLKID}/usr/lib
	${CP} ${WRKINST}/usr/lib/libblkid.so* \
		${IDIR_LIBBLKID}/usr/lib

libblkid-dev-install:
	${INSTALL_DIR} ${IDIR_LIBBLKID_DEV}/usr/include/blkid
	${CP} ${WRKINST}/usr/include/blkid/*.h \
		${IDIR_LIBBLKID_DEV}/usr/include/blkid

libcom-err-install:
	${INSTALL_DIR} ${IDIR_LIBCOM_ERR}/usr/lib
	${CP} ${WRKINST}/usr/lib/libcom_err.so* \
		${IDIR_LIBCOM_ERR}/usr/lib
	${CP} ${WRKINST}/usr/bin/compile_et ${STAGING_HOST_DIR}/bin

libcom-err-dev-install:
	${INSTALL_DIR} ${IDIR_LIBCOM_ERR_DEV}/usr/include/et
	${CP} ${WRKINST}/usr/include/et/com_err.h \
		${IDIR_LIBCOM_ERR_DEV}/usr/include/et

libss-install:
	${INSTALL_DIR} ${IDIR_LIBSS}/usr/lib
	${CP} ${WRKINST}/usr/lib/libss.so* \
		${IDIR_LIBSS}/usr/lib
	${CP} ${WRKINST}/usr/bin/mk_cmds ${STAGING_HOST_DIR}/bin

libss-dev-install:
	${INSTALL_DIR} ${IDIR_LIBSS_DEV}/usr/include/ss
	${CP} ${WRKINST}/usr/include/ss/ss*.h \
		${IDIR_LIBSS_DEV}/usr/include/ss

libuuid-install:
	${INSTALL_DIR} ${IDIR_LIBUUID}/usr/lib
	${CP} ${WRKINST}/usr/lib/libuuid.so* \
		${IDIR_LIBUUID}/usr/lib

libuuid-dev-install:
	${INSTALL_DIR} ${IDIR_LIBUUID_DEV}/usr/include/uuid
	${CP} ${WRKBUILD}/lib/uuid/uuid.h \
		${IDIR_LIBUUID_DEV}/usr/include/uuid

e2fsck-static-install:
ifneq ($(ADK_PACKAGE_E2FSCK_STATIC),)
	${INSTALL_DIR} ${IDIR_E2FSCK_STATIC}/usr/sbin
	${INSTALL_BIN} ${WRKINST}/usr/sbin/e2fsck.static \
		${IDIR_E2FSCK_STATIC}/usr/sbin/e2fsck
endif

include ${TOPDIR}/mk/pkg-bottom.mk
