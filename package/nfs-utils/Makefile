# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include ${TOPDIR}/rules.mk

PKG_NAME:=		nfs-utils
PKG_VERSION:=		1.2.8
PKG_RELEASE:=		2
PKG_MD5SUM:=		fb48630b7c145fb9d6602a79c6eaab11
PKG_DESCR:=		Utilities for NFS kernel server implementation
PKG_SECTION:=		net/fs
PKG_DEPENDS:=		kmod-nfsd keyutils libtirpc rpcbind libdevmapper libpthread
PKG_FDEPENDS:=		$(PKG_DEPENDS)
PKG_BUILDDEP:=		keyutils libtirpc lvm
PKG_URL:=		http://sourceforge.net/projects/nfs
# as long as there are tar archives of nfs-utils with object files
# on some sourceforge mirrors
PKG_SITES:=		http://openadk.org/distfiles/
#PKG_SITES:=		${MASTER_SITE_SOURCEFORGE:=nfs/}

PKG_LIBC_DEPENDS:=	uclibc eglibc glibc

PKG_FLAVOURS_NFS_UTILS:=WITH_KERBEROS
PKGFD_WITH_KERBEROS:=	enable Kerberos support (MIT)
PKGFS_WITH_KERBEROS:=	libkrb5 libevent libnfsidmap librpcsecgss libcom-err libgssglue kmod-rpcsec-gss-krb5 kmod-sunrpc-gss
PKGFB_WITH_KERBEROS:=	libnfsidmap krb5 libevent libgssglue librpcsecgss

DISTFILES:=		${PKG_NAME}-${PKG_VERSION}.tar.bz2

ifeq ($(ADK_PACKAGE_NFS_UTILS_WITH_KERBEROS),y)
PKG_FDEPENDS+=		$(PKGFS_WITH_KERBEROS)
endif

include ${TOPDIR}/mk/package.mk

$(eval $(call PKG_template,NFS_UTILS,nfs-utils,${PKG_VERSION}-${PKG_RELEASE},${PKG_FDEPENDS},${PKG_DESCR},${PKG_SECTION}))

ifeq ($(ADK_NATIVE),)
KRB5INC:=		${STAGING_TARGET_DIR}/usr
TIRPCINC:=		${STAGING_TARGET_DIR}/usr/include/tirpc
else
KRB5INC:=		/usr
TIRPCINC:=		/usr/include/tirpc
endif

ifeq ($(ADK_PACKAGE_NFS_UTILS_WITH_KERBEROS),y)
CONFIGURE_ARGS+=	--enable-nfsv4 \
			--with-krb5=$(KRB5INC) \
			--enable-gss
CONFIGURE_ENV+=		LIBS="-lrpcsecgss"
else
CONFIGURE_ARGS+=	--disable-nfsv4 \
			--disable-nfsv41 \
			--disable-gss
endif

CONFIGURE_ENV+=		knfsd_cv_bsd_signals=no \
			ac_cv_lib_nsl_gethostbyname=no
CONFIGURE_ARGS+=	--without-tcp-wrappers \
			--disable-nfsdcltrack \
			--with-rpcgen=internal \
			--enable-tirpc \
			--with-tirpcinclude=${TIRPCINC} \
			--disable-uuid

nfs-utils-install:
	${INSTALL_DIR} ${IDIR_NFS_UTILS}/usr/sbin ${IDIR_NFS_UTILS}/etc
	${INSTALL_DIR} ${IDIR_NFS_UTILS}/sbin
	${CP} ${WRKINST}/sbin/{u,}mount.nfs* ${IDIR_NFS_UTILS}/sbin
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
