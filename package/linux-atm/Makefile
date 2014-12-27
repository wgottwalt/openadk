# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include ${ADK_TOPDIR}/rules.mk

PKG_NAME:=		linux-atm
PKG_VERSION:=		2.5.1
PKG_RELEASE:=		3
PKG_HASH:=		6bc60fe53c9e9c828a6d7f3675da11ad7fb54491863584e01c1051740fe2a286
PKG_DESCR:=		atm library
PKG_SECTION:=		libs/net
PKG_BUILDDEP:=		flex-host bison-host
PKG_URL:=		http://linux-atm.sourceforge.net/
PKG_SITES:=		${MASTER_SITE_SOURCEFORGE:=linux-atm/}
PKG_NOPARALLEL:=	1
PKG_LIBNAME:=		libatm
PKG_OPTS:=		dev

PKG_HOST_DEPENDS:=	!freebsd

PKG_SUBPKGS:=		LIBATM BR2684CTL
PKGSD_BR2684CTL:=	br2684ctl ATM utility
PKGSS_BR2684CTL:=	libatm
PKGSC_BR2684CTL:=	net/route

DISTFILES:=		${PKG_NAME}-${PKG_VERSION}.tgz

include ${ADK_TOPDIR}/mk/package.mk

$(eval $(call PKG_template,LIBATM,libatm,${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION},${PKG_OPTS}))
$(eval $(call PKG_template,BR2684CTL,br2684ctl,${PKG_VERSION}-${PKG_RELEASE},${PKGSS_BR2684CTL},${PKGSD_BR2684CTL},${PKGSC_BR2684CTL}))

libatm-install:
	${INSTALL_DIR} ${IDIR_LIBATM}/usr/lib
	${CP} ${WRKINST}/usr/lib/libatm.so* ${IDIR_LIBATM}/usr/lib

br2684ctl-install:
	${INSTALL_DIR} ${IDIR_BR2684CTL}/usr/sbin
	${CP} ${WRKINST}/usr/sbin/br2684ctl ${IDIR_BR2684CTL}/usr/sbin

include ${ADK_TOPDIR}/mk/pkg-bottom.mk
