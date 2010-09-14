# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include ${TOPDIR}/rules.mk

PKG_NAME:=		e2fsprogs
PKG_VERSION:=		1.41.12
PKG_RELEASE:=		1
PKG_MD5SUM:=		1b24a21fc0c2381ef420961cbfec733f
PKG_DESCR:=		Ext2/3/4 filesystem utilities
PKG_SECTION:=		fs
PKG_DEPENDS:=		libcom-err libuuid libblkid libpthread
PKG_URL:=		http://e2fsprogs.sourceforge.net/
PKG_SITES:=		${MASTER_SITE_SOURCEFORGE:=e2fsprogs/}

PKG_SUBPKGS:=		E2FSPROGS LIBUUID LIBCOM_ERR LIBSS LIBBLKID
PKGSD_LIBUUID:=		UUID library
PKGSC_LIBUUID:=		libs
PKGSD_LIBCOM_ERR:=	Common error library
PKGSC_LIBCOM_ERR:=	libs
PKGSD_LIBSS:=		Subsystem command parsing library
PKGSC_LIBSS:=		libs
PKGSD_LIBBLKID:=	Libblkid
PKGSC_LIBBLKID:=	libs

include ${TOPDIR}/mk/package.mk

$(eval $(call PKG_template,E2FSPROGS,${PKG_NAME},${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))
$(eval $(call PKG_template,LIBUUID,libuuid,${PKG_VERSION}-${PKG_RELEASE},,${PKGSD_LIBUUID},${PKGSC_LIBUUID}))
$(eval $(call PKG_template,LIBCOM_ERR,libcom-err,${PKG_VERSION}-${PKG_RELEASE},,${PKGSD_LIBCOM_ERR},${PKGSC_LIBCOM_ERR}))
$(eval $(call PKG_template,LIBSS,libss,${PKG_VERSION}-${PKG_RELEASE},,${PKGSD_LIBSS},${PKGSC_LIBSS}))
$(eval $(call PKG_template,LIBBLKID,libblkid,${PKG_VERSION}-${PKG_RELEASE},,${PKGSD_LIBBLKID},${PKGSC_LIBBLKID}))

CONFIGURE_ARGS+=	--enable-elf-shlibs --disable-tls
INSTALL_TARGET+=	install-libs

pre-build:
	${MAKE} -C ${WRKBUILD}/util \
		BUILDCC="${HOSTCC}" \
		CFLAGS="" \
		LDFLAGS="" \
		CPPFLAGS="" \
		subst

post-install:
	${INSTALL_DIR} ${IDIR_E2FSPROGS}/usr/lib ${IDIR_E2FSPROGS}/usr/sbin
	${INSTALL_BIN} ${WRKINST}/usr/sbin/e2fsck ${IDIR_E2FSPROGS}/usr/sbin/
	${INSTALL_BIN} ${WRKINST}/usr/sbin/mke2fs ${IDIR_E2FSPROGS}/usr/sbin/
	${INSTALL_BIN} ${WRKINST}/usr/sbin/tune2fs ${IDIR_E2FSPROGS}/usr/sbin/
	${CP} ${WRKINST}/usr/lib/lib{e2p,ext2fs}.so.* \
		${IDIR_E2FSPROGS}/usr/lib/
	# subpackage libblkid
	${INSTALL_DIR} ${IDIR_LIBBLKID}/usr/lib
	${CP} ${WRKINST}/usr/lib/libblkid.so* \
		${IDIR_LIBBLKID}/usr/lib/
	# subpackage libcom_err
	${INSTALL_DIR} ${IDIR_LIBCOM_ERR}/usr/lib
	${CP} ${WRKINST}/usr/lib/libcom_err.so* \
		${IDIR_LIBCOM_ERR}/usr/lib/
	# subpackage libss
	${INSTALL_DIR} ${IDIR_LIBSS}/usr/lib
	${CP} ${WRKINST}/usr/lib/libss.so* \
		${IDIR_LIBSS}/usr/lib/
	# subpackage libuuid
	${INSTALL_DIR} ${IDIR_LIBUUID}/usr/lib
	${CP} ${WRKINST}/usr/lib/libuuid.so* \
		${IDIR_LIBUUID}/usr/lib/
	# install some headers/apps explicitely
	${INSTALL_DIR} ${STAGING_DIR}/usr/include/uuid
	${CP} ${WRKBUILD}/lib/uuid/uuid.h \
		${STAGING_DIR}/usr/include/uuid
	${CP} ${WRKINST}/usr/bin/compile_et ${STAGING_TOOLS}/bin

include ${TOPDIR}/mk/pkg-bottom.mk
