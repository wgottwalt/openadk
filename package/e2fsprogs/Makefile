# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include ${TOPDIR}/rules.mk

PKG_NAME:=		e2fsprogs
PKG_VERSION:=		1.42.8
PKG_RELEASE:=		3
PKG_MD5SUM:=		8ef664b6eb698aa6b733df59b17b9ed4
PKG_DESCR:=		Ext2/3/4 filesystem utilities (meta-package)
PKG_SECTION:=		fs
PKG_DEPENDS:=		libcom-err libuuid libblkid libpthread
PKG_DEPENDS:=		e2fsck tune2fs mke2fs resize2fs
PKG_BUILDDEP:=		util-linux
PKG_URL:=		http://e2fsprogs.sourceforge.net/
PKG_SITES:=		${MASTER_SITE_SOURCEFORGE:=e2fsprogs/}
PKG_OPTS:=		dev

PKG_CFLINE_E2FSPROGS:=	default y if ADK_TARGET_ROOTFS_CF

PKG_SUBPKGS:=		E2FSPROGS LIBE2FS LIBCOM_ERR LIBSS E2FSCK_STATIC
PKG_SUBPKGS+=		RESIZE2FS TUNE2FS E2FSCK MKE2FS
PKGSD_LIBE2FS:=		e2fsprogs library
PKGSC_LIBE2FS:=		libs
PKGSD_LIBCOM_ERR:=	Common error library
PKGSC_LIBCOM_ERR:=	libs
PKGSD_LIBSS:=		Subsystem command parsing library
PKGSC_LIBSS:=		libs
PKGSD_E2FSCK_STATIC:=	Static build of e2fsck
PKGSC_E2FSCK_STATIC:=	fs
PKGSD_RESIZE2FS:=	Resize FS utility
PKGSC_RESIZE2FS:=	fs
PKGSS_RESIZE2FS:=	libe2fs libcom-err libblkid
PKGSD_TUNE2FS:=		Tune2FS utility
PKGSC_TUNE2FS:=		fs
PKGSS_TUNE2FS:=		libe2fs libcom-err libblkid libuuid
PKGSD_E2FSCK:=		E2fsck utility
PKGSC_E2FSCK:=		fs
PKGSS_E2FSCK:=		libe2fs libcom-err libblkid libuuid
PKGSD_MKE2FS:=		Mke2fs utility
PKGSC_MKE2FS:=		fs
PKGSS_MKE2FS:=		libe2fs libcom-err libblkid libuuid

include ${TOPDIR}/mk/package.mk

$(eval $(call PKG_template,E2FSPROGS,e2fsprogs,${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION},${PKG_OPTS}))
$(eval $(call PKG_template,LIBE2FS,libe2fs,${PKG_VERSION}-${PKG_RELEASE},,${PKGSD_LIBE2FS},${PKGSC_LIBE2FS}))
$(eval $(call PKG_template,LIBCOM_ERR,libcom-err,${PKG_VERSION}-${PKG_RELEASE},,${PKGSD_LIBCOM_ERR},${PKGSC_LIBCOM_ERR}))
$(eval $(call PKG_template,LIBSS,libss,${PKG_VERSION}-${PKG_RELEASE},,${PKGSD_LIBSS},${PKGSC_LIBSS}))
$(eval $(call PKG_template,E2FSCK_STATIC,e2fsck-static,${PKG_VERSION}-${PKG_RELEASE},,${PKGSD_E2FSCK_STATIC},${PKGSC_E2FSCK_STATIC}))
$(eval $(call PKG_template,TUNE2FS,tune2fs,${PKG_VERSION}-${PKG_RELEASE},$(PKGSS_TUNE2FS),${PKGSD_TUNE2FS},${PKGSC_TUNE2FS}))
$(eval $(call PKG_template,RESIZE2FS,resize2fs,${PKG_VERSION}-${PKG_RELEASE},$(PKGSS_RESIZE2FS),${PKGSD_RESIZE2FS},${PKGSC_RESIZE2FS}))
$(eval $(call PKG_template,MKE2FS,mke2fs,${PKG_VERSION}-${PKG_RELEASE},$(PKGSS_MKE2FS),${PKGSD_MKE2FS},${PKGSC_MKE2FS}))
$(eval $(call PKG_template,E2FSCK,e2fsck,${PKG_VERSION}-${PKG_RELEASE},$(PKGSS_E2FSCK),${PKGSD_E2FSCK},${PKGSC_E2FSCK}))

CONFIGURE_ARGS+=	--enable-elf-shlibs --disable-rpath \
			--disable-libuuid --disable-libblkid \
			--disable-defrag
INSTALL_TARGET+=	install-libs
TARGET_LDFLAGS+=	-lpthread
TARGET_CFLAGS+=		$(TARGET_CPPFLAGS) -I$(STAGING_TARGET_DIR)/usr/include
MAKE_FLAGS+=		BUILD_CC="${CC_FOR_BUILD}" \
			BUILD_CFLAGS="${CFLAGS_FOR_BUILD}" \
			BUILD_LDFLAGS="${LDFLAGS_FOR_BUILD}" \
			BUILD_CPPFLAGS="${CPPFLAGS_FOR_BUILD}"

post-build:
ifneq ($(ADK_PACKAGE_E2FSCK_STATIC),)
	${MAKE} -C ${WRKBUILD}/e2fsck e2fsck.static
	${INSTALL_DIR} ${WRKINST}/usr/sbin
	${INSTALL_BIN} ${WRKBUILD}/e2fsck/e2fsck.static ${WRKINST}/usr/sbin
endif

e2fsprogs-install:
	# workaround for dev subpackage
	mkdir -p ${IDIR_E2FSPROGS_DEV}/usr/bin
	${CP} ${WRKINST}/usr/bin/compile_et \
		${IDIR_E2FSPROGS_DEV}/usr/bin

libe2fs-install:
	${INSTALL_DIR} ${IDIR_LIBE2FS}/etc
	${INSTALL_DATA} ${WRKBUILD}/misc/mke2fs.conf ${IDIR_LIBE2FS}/etc
	${INSTALL_DIR} ${IDIR_LIBE2FS}/usr/lib
	${CP} ${WRKINST}/usr/lib/lib{e2p,ext2fs}.so.* \
		${IDIR_LIBE2FS}/usr/lib

e2fsck-install:
	${INSTALL_DIR} ${IDIR_E2FSCK}/usr/sbin
	${INSTALL_BIN} ${WRKINST}/usr/sbin/e2fsck ${IDIR_E2FSCK}/usr/sbin
	cd $(IDIR_E2FSCK)/usr/sbin && ln -sf e2fsck fsck.ext2

mke2fs-install:
	${INSTALL_DIR} ${IDIR_MKE2FS}/usr/sbin
	${INSTALL_BIN} ${WRKINST}/usr/sbin/mke2fs ${IDIR_MKE2FS}/usr/sbin

tune2fs-install:
	${INSTALL_DIR} ${IDIR_TUNE2FS}/usr/sbin
	${INSTALL_BIN} ${WRKINST}/usr/sbin/tune2fs ${IDIR_TUNE2FS}/usr/sbin

resize2fs-install:
	${INSTALL_DIR} ${IDIR_RESIZE2FS}/usr/sbin
	${INSTALL_BIN} ${WRKINST}/usr/sbin/resize2fs ${IDIR_RESIZE2FS}/usr/sbin

libcom-err-install:
	${INSTALL_DIR} ${IDIR_LIBCOM_ERR}/usr/lib
	${CP} ${WRKINST}/usr/lib/libcom_err.so* \
		${IDIR_LIBCOM_ERR}/usr/lib
	${CP} ${WRKINST}/usr/bin/compile_et ${STAGING_HOST_DIR}/bin

libss-install:
	${INSTALL_DIR} ${IDIR_LIBSS}/usr/lib
	${CP} ${WRKINST}/usr/lib/libss.so* \
		${IDIR_LIBSS}/usr/lib
	${CP} ${WRKINST}/usr/bin/mk_cmds ${STAGING_HOST_DIR}/bin

e2fsck-static-install:
ifneq ($(ADK_PACKAGE_E2FSCK_STATIC),)
	${INSTALL_DIR} ${IDIR_E2FSCK_STATIC}/usr/sbin
	${INSTALL_BIN} ${WRKINST}/usr/sbin/e2fsck.static \
		${IDIR_E2FSCK_STATIC}/usr/sbin/e2fsck
endif

include ${TOPDIR}/mk/pkg-bottom.mk
