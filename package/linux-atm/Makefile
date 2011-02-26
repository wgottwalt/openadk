# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include ${TOPDIR}/rules.mk

PKG_NAME:=		linux-atm
PKG_VERSION:=		2.5.1
PKG_RELEASE:=		2
PKG_MD5SUM:=		9560b0e1f410a05b849dfdab465dd758
PKG_DESCR:=		ATM library for Linux
PKG_SECTION:=		libs
PKG_URL:=		http://linux-atm.sourceforge.net/
PKG_SITES:=		${MASTER_SITE_SOURCEFORGE:=linux-atm/}
PKG_NOPARALLEL:=	1

PKG_HOST_DEPENDS:=	!freebsd

PKG_SUBPKGS:=		LIBATM LIBATM_DEV BR2684CTL
PKGSD_LIBATM_DEV:=	ATM headers for Linux
PKGSC_LIBATM_DEV:=	devel
PKGSD_BR2684CTL:=	br2684ctl ATM utility
PKGSS_BR2684CTL:=	libatm
PKGSC_BR2684CTL:=	route

DISTFILES:=		${PKG_NAME}-${PKG_VERSION}.tgz

include ${TOPDIR}/mk/package.mk

$(eval $(call PKG_template,LIBATM,libatm,${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))
$(eval $(call PKG_template,LIBATM_DEV,libatm-dev,${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKGSD_LIBATM_DEV},${PKGSC_LIBATM_DEV}))
$(eval $(call PKG_template,BR2684CTL,br2684ctl,${PKG_VERSION}-${PKG_RELEASE},${PKGSS_BR2684CTL},${PKGSD_BR2684CTL},${PKGSC_BR2684CTL}))

libatm-install:
	${INSTALL_DIR} ${IDIR_LIBATM}/usr/lib
	${CP} ${WRKINST}/usr/lib/libatm.so* ${IDIR_LIBATM}/usr/lib

libatm-dev-install:
	${INSTALL_DIR} ${IDIR_LIBATM_DEV}/usr/include
	${CP} ${WRKINST}/usr/include/* ${IDIR_LIBATM_DEV}/usr/include

br2684ctl-install:
	${INSTALL_DIR} ${IDIR_BR2684CTL}/usr/sbin
	${CP} ${WRKINST}/usr/sbin/br2684ctl ${IDIR_BR2684CTL}/usr/sbin

include ${TOPDIR}/mk/pkg-bottom.mk
