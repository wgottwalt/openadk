# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include ${TOPDIR}/rules.mk

PKG_NAME:=		libtirpc
PKG_VERSION:=		0.2.3
PKG_RELEASE:=		3
PKG_MD5SUM:=		b70e6c12a369a91e69fcc3b9feb23d61
PKG_DESCR:=		a transport independent RPC library
PKG_SECTION:=		libs
PKG_DEPENDS:=		libgssglue
PKG_BUILDDEP:=		libgssglue
PKG_URL:=		http://sourceforge.net/projects/libtirpc/
PKG_SITES:=		${MASTER_SITE_SOURCEFORGE:=libtirpc/}
PKG_OPTS:=		dev

DISTFILES:=		$(PKG_NAME)-$(PKG_VERSION).tar.bz2

include ${TOPDIR}/mk/package.mk

$(eval $(call PKG_template,LIBTIRPC,libtirpc,${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION},${PKG_OPTS}))

ifneq (${ADK_PACKAGE_NFS_UTILS_WITH_KERBEROS},y)
CONFIGURE_ARGS+=	--disable-gss
else
CONFIGURE_ARGS+=	--enable-gss
endif

libtirpc-install:
	${INSTALL_DIR} ${IDIR_LIBTIRPC}/usr/lib ${IDIR_LIBTIRPC}/etc
	${CP} ${WRKINST}/usr/lib/libtirpc*.so* ${IDIR_LIBTIRPC}/usr/lib/
	${CP} ./files/netconfig ${IDIR_LIBTIRPC}/etc

include ${TOPDIR}/mk/pkg-bottom.mk
