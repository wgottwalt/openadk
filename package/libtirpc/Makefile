# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include ${TOPDIR}/rules.mk

PKG_NAME:=		libtirpc
PKG_VERSION:=		0.2.4
PKG_RELEASE:=		1
PKG_MD5SUM:=		847995e8d002cbf1387bda05947be086
PKG_DESCR:=		transport independent RPC library
PKG_SECTION:=		libs
PKG_BUILDDEP:=		autotool
PKG_URL:=		http://sourceforge.net/projects/libtirpc/
PKG_SITES:=		${MASTER_SITE_SOURCEFORGE:=libtirpc/}
PKG_OPTS:=		dev

PKG_FLAVOURS_LIBTIRPC:=	WITH_IPV6 WITH_GSS
PKGFD_WITH_IPV6:=	enable IPv6 support
PKGFD_WITH_GSS:=	enable GSS support
PKGFB_WITH_GSS:=	libgssglue krb5
PKGFS_WITH_GSS:=	libgssglue

DISTFILES:=		$(PKG_NAME)-$(PKG_VERSION).tar.bz2

include ${TOPDIR}/mk/package.mk

$(eval $(call PKG_template,LIBTIRPC,libtirpc,${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION},${PKG_OPTS}))

AUTOTOOL_STYLE:=	autoreconf

ifeq (${ADK_PACKAGE_LIBTIRPC_WITH_GSS},y)
CONFIGURE_ARGS+=	--enable-gssapi
else
CONFIGURE_ARGS+=	--disable-gssapi
endif

ifeq (${ADK_PACKAGE_LIBTIRPC_WITH_IPV6},y)
CONFIGURE_ARGS+=	--enable-ipv6
CFG:=			.ipv6
else
CONFIGURE_ARGS+=	--disable-ipv6
endif

libtirpc-install:
	${INSTALL_DIR} ${IDIR_LIBTIRPC}/usr/lib ${IDIR_LIBTIRPC}/etc
	${CP} ${WRKINST}/usr/lib/libtirpc*.so* ${IDIR_LIBTIRPC}/usr/lib/
	${CP} ./files/netconfig$(CFG) ${IDIR_LIBTIRPC}/etc/netconfig

include ${TOPDIR}/mk/pkg-bottom.mk
