# $Id$
#-
# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include ${TOPDIR}/rules.mk

PKG_NAME:=		e2fsprogs
PKG_VERSION:=		1.41.3
PKG_RELEASE:=		1
PKG_MD5SUM:=		b21d26fc46c584021dc9c444933ee1c2
MASTER_SITES:=		${MASTER_SITE_SOURCEFORGE:=e2fsprogs/}

include ${TOPDIR}/mk/package.mk

$(eval $(call PKG_template,E2FSPROGS,${PKG_NAME},${PKG_VERSION}-${PKG_RELEASE},${ARCH}))
$(eval $(call PKG_template,LIBUUID,libuuid,${PKG_VERSION}-${PKG_RELEASE},${ARCH}))
$(eval $(call PKG_template,LIBCOM_ERR,libcom-err,${PKG_VERSION}-${PKG_RELEASE},${ARCH}))

CONFIGURE_STYLE=	gnu
CONFIGURE_ARGS+=	--enable-elf-shlibs \
			--disable-tls \
			--enable-dynamic-e2fsck
BUILD_STYLE=		auto
INSTALL_STYLE=		auto confprog
INSTALL_TARGET+=	install-libs

pre-build:
	${MAKE} -C ${WRKBUILD}/util \
		BUILDCC="${HOSTCC}" \
		CFLAGS="" \
		LDFLAGS="" \
		CPPFLAGS="" \
		subst

post-install:
	${INSTALL_DIR} ${IDIR_E2FSPROGS}/usr/lib
	${INSTALL_DIR} ${IDIR_E2FSPROGS}/usr/sbin
	${INSTALL_BIN} ${WRKINST}/usr/sbin/e2fsck ${IDIR_E2FSPROGS}/usr/sbin/
	${INSTALL_BIN} ${WRKINST}/usr/sbin/mke2fs ${IDIR_E2FSPROGS}/usr/sbin/
	${INSTALL_BIN} ${WRKINST}/usr/sbin/tune2fs ${IDIR_E2FSPROGS}/usr/sbin/
	${CP} ${WRKINST}/usr/lib/lib{blkid,e2p,ext2fs}.so.* \
		${IDIR_E2FSPROGS}/usr/lib/
	# subpackage libcom_err
	${INSTALL_DIR} ${IDIR_LIBCOM_ERR}/usr/lib
	${CP} ${WRKINST}/usr/lib/libcom_err.so.* \
		${IDIR_LIBCOM_ERR}/usr/lib/
	# subpackage libuuid
	${INSTALL_DIR} ${IDIR_LIBUUID}/usr/lib
	${CP} ${WRKINST}/usr/lib/libuuid.so.* \
		${IDIR_LIBUUID}/usr/lib/
	# install some headers explicitely
	${INSTALL_DIR} ${STAGING_DIR}/usr/include/uuid
	${CP} ${WRKBUILD}/lib/uuid/uuid.h \
		${STAGING_DIR}/usr/include/uuid

include ${TOPDIR}/mk/pkg-bottom.mk
