# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include ${TOPDIR}/rules.mk

PKG_NAME:=		nfs-utils
PKG_VERSION:=		1.2.2
PKG_RELEASE:=		1
PKG_MD5SUM:=		c3ccd16c147befd49fe4541a506dd177
PKG_DESCR:= 		Utilities for NFS kernel server implementation
PKG_SECTION:=		net/fs
PKG_DEPENDS:=		kmod-nfsd portmap
PKG_URL:=		http://sourceforge.net/projects/nfs
PKG_SITES:=		${MASTER_SITE_SOURCEFORGE:=nfs/}

PKG_FLAVOURS:=		WITH_KERBEROS WITH_TIRPC
PKGFD_WITH_KERBEROS:=	enable Kerberos support (MIT)
PKGFS_WITH_KERBEROS:=	libkrb5 libevent libnfsidmap librpcsecgss libcom-err libgssglue
PKGFB_WITH_KERBEROS:=	libnfsidmap krb5 libevent libgssglue librpcsecgss
PKGFD_WITH_TIRPC:=	enable Transport Independent RPC
PKGFS_WITH_TIRPC:=	libtirpc rpcbind
PKGFB_WITH_TIRPC:=	libtirpc rpcbind

DISTFILES:=		${PKG_NAME}-${PKG_VERSION}.tar.bz2

include ${TOPDIR}/mk/package.mk

$(eval $(call PKG_template,NFS_UTILS,${PKG_NAME},${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))

ifeq ($(ADK_PACKAGE_NFS_UTILS_WITH_KERBEROS),y)
CONFIGURE_ARGS+=	--enable-nfsv4 \
			--with-krb5=${STAGING_DIR}/usr/ \
			--enable-gss
CONFIGURE_ENV+=		LIBS="-lrpcsecgss"
else
CONFIGURE_ARGS+=	--disable-nfsv4 \
			--disable-gss
endif

ifeq ($(ADK_PACKAGE_NFS_UTILS_WITH_TIRPC),y)
CONFIGURE_ARGS+=	--enable-tirpc \
			--with-tirpcinclude=${STAGING_DIR}/usr/include/tirpc
else
CONFIGURE_ARGS+=	--disable-tirpc
endif

CONFIGURE_ENV+=		knfsd_cv_bsd_signals=no \
			ac_cv_lib_nsl_gethostbyname=no
CONFIGURE_ARGS+=	--without-tcp-wrappers \
			--disable-uuid

post-install:
	${INSTALL_DIR} ${IDIR_NFS_UTILS}/usr/sbin ${IDIR_NFS_UTILS}/etc
	${INSTALL_DATA} ./files/rpc ${IDIR_NFS_UTILS}/etc
	${INSTALL_BIN} ${WRKBUILD}/utils/exportfs/exportfs \
		${IDIR_NFS_UTILS}/usr/sbin/
	${INSTALL_DATA} ./files/nfsd.exports ${IDIR_NFS_UTILS}/etc/exports
	${INSTALL_BIN} ${WRKBUILD}/utils/nfsd/nfsd \
		${IDIR_NFS_UTILS}/usr/sbin/
	${INSTALL_BIN} ${WRKBUILD}/utils/mountd/mountd \
		${IDIR_NFS_UTILS}/usr/sbin/
ifeq ($(ADK_PACKAGE_NFS_UTILS_WITH_KERBEROS),y)
	${INSTALL_DATA} ./files/idmapd.conf ${IDIR_NFS_UTILS}/etc
	${INSTALL_BIN} ${WRKBUILD}/utils/gssd/gssd \
		${IDIR_NFS_UTILS}/usr/sbin/
	${INSTALL_BIN} ${WRKBUILD}/utils/gssd/svcgssd \
		${IDIR_NFS_UTILS}/usr/sbin/
	${INSTALL_BIN} ${WRKBUILD}/utils/idmapd/idmapd \
		${IDIR_NFS_UTILS}/usr/sbin/
endif

include ${TOPDIR}/mk/pkg-bottom.mk
