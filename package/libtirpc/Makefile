# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include ${TOPDIR}/rules.mk

PKG_NAME:=		libtirpc
PKG_VERSION:=		0.2.2
PKG_RELEASE:=		1
PKG_MD5SUM:=		74c41c15c2909f7d11d9c7bfa7db6273
PKG_DESCR:=		a transport independent RPC library
PKG_SECTION:=		libs
PKG_DEPENDS:=		libgssglue
PKG_BUILDDEP:=		libgssglue
PKG_URL:=		http://sourceforge.net/projects/libtirpc/
PKG_SITES:=		${MASTER_SITE_SOURCEFORGE:=libtirpc/}

DISTFILES:=		$(PKG_NAME)-$(PKG_VERSION).tar.bz2

PKG_SUBPKGS:=		LIBTIRPC LIBTIRPC_DEV
PKGSD_LIBTIRPC_DEV:=	tirpc headers
PKGSC_LIBTIRPC_DEV:=	devel

include ${TOPDIR}/mk/package.mk

$(eval $(call PKG_template,LIBTIRPC,libtirpc,${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))
$(eval $(call PKG_template,LIBTIRPC_DEV,libtirpc-dev,${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKGSD_LIBTIRPC_DEV},${PKGSC_LIBTIRPC_DEV}))

ifneq (${ADK_PACKAGE_NFS_UTILS_WITH_KERBEROS},y)
CONFIGURE_ARGS+=	--disable-gss
else
CONFIGURE_ARGS+=	--enable-gss
endif

libtirpc-install:
	${INSTALL_DIR} ${IDIR_LIBTIRPC}/usr/lib ${IDIR_LIBTIRPC}/etc
	${CP} ${WRKINST}/usr/lib/libtirpc*.so* ${IDIR_LIBTIRPC}/usr/lib/
	${CP} ./files/netconfig ${IDIR_LIBTIRPC}/etc

libtirpc-dev-install:
	${INSTALL_DIR} ${IDIR_LIBTIRPC_DEV}/usr/include
	${CP} ${WRKINST}/usr/include/* ${IDIR_LIBTIRPC_DEV}/usr/include

include ${TOPDIR}/mk/pkg-bottom.mk
