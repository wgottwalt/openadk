# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include ${TOPDIR}/rules.mk

PKG_NAME:=		nfs-utils
PKG_VERSION:=		1.3.0
PKG_RELEASE:=		2
PKG_MD5SUM:=		3ac3726eda563946d1f44ac3e5b61d56
PKG_DESCR:=		network filesystem utilities
PKG_SECTION:=		net/fs
PKG_DEPENDS:=		keyutils libtirpc rpcbind libdevmapper libpthread
PKG_BUILDDEP:=		autotool keyutils libtirpc lvm
PKG_URL:=		http://sourceforge.net/projects/nfs
PKG_SITES:=		${MASTER_SITE_SOURCEFORGE:=nfs/}

PKG_SUBPKGS:=		NFS_UTILS NFS_UTILS_CLIENT NFS_UTILS_SERVER
PKGSD_NFS_UTILS_CLIENT:=client utilities
PKGSN_NFS_UTILS_CLIENT:=nfs-utils
PKGSD_NFS_UTILS_SERVER:=server daemons and utilities
PKGSN_NFS_UTILS_SERVER:=nfs-utils

PKG_CHOICES_NFS_UTILS:=	V3 V4
PKGCD_V3:=		NFS version 3
PKGCD_V4:=		NFS version 4
PKGCB_V4:=		libevent libnfsidmap krb5 libgssglue librpcsecgss
PKGCS_V4:=		libkrb5 libevent libnfsidmap librpcsecgss libcom-err libgssglue

DISTFILES:=		${PKG_NAME}-${PKG_VERSION}.tar.bz2

include ${TOPDIR}/mk/package.mk

$(eval $(call PKG_template,NFS_UTILS,nfs-utils,${PKG_VERSION}-${PKG_RELEASE},${PKG_FDEPENDS},${PKG_DESCR},${PKG_SECTION}))
$(eval $(call PKG_template,NFS_UTILS_CLIENT,nfs-utils-client,${PKG_VERSION}-${PKG_RELEASE},${PKGSS_NFS_UTILS_CLIENT},${PKGSD_NFS_UTILS_CLIENT},${PKG_SECTION}))
$(eval $(call PKG_template,NFS_UTILS_SERVER,nfs-utils-server,${PKG_VERSION}-${PKG_RELEASE},${PKGSS_NFS_UTILS_SERVER},${PKGSD_NFS_UTILS_SERVER},${PKG_SECTION}))

AUTOTOOL_STYLE:=	autoreconf
ifeq ($(ADK_PACKAGE_NFS_UTILS_SERVER_V4),y)
CONFIGURE_ARGS+=	--enable-nfsv4 \
			--disable-nfsv41 \
			--with-krb5=${STAGING_TARGET_DIR}/usr \
			--enable-gss
#CONFIGURE_ENV+=		LIBS="-lrpcsecgss"
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
			--disable-caps \
			--enable-tirpc \
			--with-tirpcinclude=${STAGING_TARGET_DIR}/usr/include/tirpc \
			--disable-uuid

nfs-utils-client-install:
	${INSTALL_DIR} ${IDIR_NFS_UTILS_CLIENT}/sbin
	${CP} ${WRKINST}/sbin/{u,}mount.nfs* ${IDIR_NFS_UTILS_CLIENT}/sbin

nfs-utils-server-install:
	${INSTALL_DIR} ${IDIR_NFS_UTILS_SERVER}/usr/sbin ${IDIR_NFS_UTILS_SERVER}/etc
	${INSTALL_BIN} ${WRKBUILD}/utils/exportfs/exportfs \
		${IDIR_NFS_UTILS_SERVER}/usr/sbin/
	${INSTALL_DATA} ./files/nfsd.exports ${IDIR_NFS_UTILS_SERVER}/etc/exports
	${INSTALL_BIN} ${WRKBUILD}/utils/nfsd/nfsd \
		${IDIR_NFS_UTILS_SERVER}/usr/sbin/
	${INSTALL_BIN} ${WRKBUILD}/utils/mountd/mountd \
		${IDIR_NFS_UTILS_SERVER}/usr/sbin/
ifeq ($(ADK_PACKAGE_NFS_UTILS_WITH_KERBEROS),y)
	${INSTALL_DATA} ./files/idmapd.conf ${IDIR_NFS_UTILS_SERVER}/etc
	${INSTALL_BIN} ${WRKBUILD}/utils/gssd/gssd \
		${IDIR_NFS_UTILS_SERVER}/usr/sbin/
	${INSTALL_BIN} ${WRKBUILD}/utils/gssd/svcgssd \
		${IDIR_NFS_UTILS_SERVER}/usr/sbin/
	${INSTALL_BIN} ${WRKBUILD}/utils/idmapd/idmapd \
		${IDIR_NFS_UTILS_SERVER}/usr/sbin/
endif

nfs-utils-install:
	${INSTALL_DIR} ${IDIR_NFS_UTILS}/etc
	${INSTALL_DATA} ./files/rpc ${IDIR_NFS_UTILS}/etc

include ${TOPDIR}/mk/pkg-bottom.mk
