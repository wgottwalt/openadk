# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include ${ADK_TOPDIR}/rules.mk

PKG_NAME:=		libnl
PKG_VERSION:=		3.2.29
PKG_RELEASE:=		2
PKG_HASH:=		5a30dc4986158c6c2b1309f4a15a283d50cc938108a675e3d822e24debcd229d
PKG_DESCR:=		netlink library
PKG_SECTION:=		libs/net
PKG_BUILDDEP:=		m4-host flex-host
PKG_SITES:=		https://github.com/thom311/libnl/archive/
PKG_NOPARALLEL:=	1
PKG_OPTS:=		dev

DISTFILES:=		${PKG_NAME}3_2_29.tar.gz
WRKDIST=		$(WRKDIR)/$(PKG_NAME)-${PKG_NAME}3_2_29

include ${ADK_TOPDIR}/mk/package.mk

$(eval $(call PKG_template,LIBNL,libnl,${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION},${PKG_OPTS}))

AUTOTOOL_STYLE:=	autogen
CONFIGURE_ARGS+=	--disable-cli

libnl-install:
	${INSTALL_DIR} ${IDIR_LIBNL}/etc/libnl
	$(CP) ${WRKINST}/etc/libnl/* ${IDIR_LIBNL}/etc/libnl
	${INSTALL_DIR} ${IDIR_LIBNL}/usr/lib
	${CP} ${WRKINST}/usr/lib/libnl-3.so* ${IDIR_LIBNL}/usr/lib
	${CP} ${WRKINST}/usr/lib/libnl-genl-3.so* ${IDIR_LIBNL}/usr/lib
	${CP} ${WRKINST}/usr/lib/libnl-route-3.so* ${IDIR_LIBNL}/usr/lib
	${CP} ${WRKINST}/usr/lib/libnl-nf-3.so* ${IDIR_LIBNL}/usr/lib

include ${ADK_TOPDIR}/mk/pkg-bottom.mk
