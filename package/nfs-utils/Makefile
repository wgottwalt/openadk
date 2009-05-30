# $Id$
#-
# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include ${TOPDIR}/rules.mk

PKG_NAME:=		nfs-utils
PKG_VERSION:=		1.1.6
PKG_RELEASE:=		1
PKG_MD5SUM:=		b0d1b8ec5c8c081a340cfc77bb8670cd
PKG_DESCR:= 		Utilities for NFS kernel server implementation
PKG_DEPENDS:=		portmap
PKG_URL:=		http://sourceforge.net/projects/nfs
PKG_SITES:=		${MASTER_SITE_SOURCEFORGE:=nfs/}

DISTFILES:=		${PKG_NAME}-${PKG_VERSION}.tar.bz2

include ${TOPDIR}/mk/package.mk

ifeq ($(ADK_COMPILE_NFS_UTILS_WITH_KRB5),y)
PKG_DEPENDS+=		krb5-libs libevent libnfsidmap librpcsecgss libcom_err libgssglue
endif

ifeq ($(ADK_COMPILE_NFS_UTILS_WITH_HEIMDAL),y)
PKG_DEPENDS+=		heimdal-libs libevent libnfsidmap librpcsecgss libcom_err
endif

ifeq (${ADK_IPV6},y)
PKG_DEPENDS+=		libtirpc
endif

$(eval $(call PKG_template,NFS_UTILS,${PKG_NAME},${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))

CONFIGURE_STYLE=	autotool gnu

ifeq ($(ADK_COMPILE_NFS_UTILS_WITH_KRB5),y)
CONFIGURE_ARGS+=	--enable-nfsv4 \
			--with-krb5-config=${STAGING_DIR}/usr/bin/krb5-config \
			--enable-gss
CONFIGURE_ENV+=		LIBS="-lrpcsecgss"
endif

ifeq ($(ADK_COMPILE_NFS_UTILS_WITH_HEIMDAL),y)
CONFIGURE_ARGS+=	--enable-nfsv4 \
			--with-krb5-config=${STAGING_DIR}/usr/bin/krb5-config \
			--enable-gss
CONFIGURE_ENV+=		LIBS="-lrpcsecgss"
endif

ifneq ($(ADK_COMPILE_NFS_UTILS_WITH_KERBEROS),y)
CONFIGURE_ARGS+=	--disable-nfsv4 \
			--disable-gss
endif

CONFIGURE_ENV+=		knfsd_cv_bsd_signals=no
CONFIGURE_ARGS+=	--without-tcp-wrappers \
			--disable-uuid
BUILD_STYLE=		auto
INSTALL_STYLE=		auto
TCPPFLAGS+=		-I${LINUX_DIR}/include

ifeq (${ADK_IPV6},y)
CONFIGURE_ARGS+=	--enable-tirpc \
			--with-tirpcinclude=${STAGING_DIR}/usr/include/tirpc
endif

post-install:
	${INSTALL_DIR} ${IDIR_NFS_UTILS}/usr/sbin
	${INSTALL_DIR} ${IDIR_NFS_UTILS}/etc
	${INSTALL_DATA} ./files/rpc ${IDIR_NFS_UTILS}/etc
	${INSTALL_BIN} ${WRKBUILD}/utils/exportfs/exportfs ${IDIR_NFS_UTILS}/usr/sbin/
	${INSTALL_DIR} ${IDIR_NFS_UTILS}/usr/sbin
	${INSTALL_DATA} ./files/nfsd.exports ${IDIR_NFS_UTILS}/etc/exports
	${INSTALL_BIN} ${WRKBUILD}/utils/statd/statd ${IDIR_NFS_UTILS}/usr/sbin/
	${INSTALL_BIN} ${WRKBUILD}/utils/nfsd/nfsd ${IDIR_NFS_UTILS}/usr/sbin/
	${INSTALL_BIN} ${WRKBUILD}/utils/mountd/mountd ${IDIR_NFS_UTILS}/usr/sbin/
ifeq ($(ADK_COMPILE_NFS_UTILS_WITH_KERBEROS),y)
	${INSTALL_DATA} ./files/idmapd.conf ${IDIR_NFS_UTILS}/etc
	${INSTALL_BIN} ${WRKBUILD}/utils/gssd/gssd ${IDIR_NFS_UTILS}/usr/sbin/
	${INSTALL_BIN} ${WRKBUILD}/utils/gssd/svcgssd ${IDIR_NFS_UTILS}/usr/sbin/
	${INSTALL_BIN} ${WRKBUILD}/utils/idmapd/idmapd ${IDIR_NFS_UTILS}/usr/sbin/
endif

include ${TOPDIR}/mk/pkg-bottom.mk
