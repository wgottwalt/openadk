# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include ${TOPDIR}/rules.mk

PKG_NAME:=		linux-atm
PKG_VERSION:=		2.5.1
PKG_RELEASE:=		2
PKG_MD5SUM:=		9560b0e1f410a05b849dfdab465dd758
PKG_DESCR:=		ATM library and tools for Linux
PKG_SECTION:=		libs
PKG_URL:=		http://linux-atm.sourceforge.net
PKG_SITES:=		${MASTER_SITE_SOURCEFORGE:=linux-atm/}
PKG_NOPARALLEL:=	1

DISTFILES:=		${PKG_NAME}-${PKG_VERSION}.tgz

PKG_DESCR_1:=		br2684ctl
PKG_DEPENDS_1:=		libatm
PKG_SECTION_1:=		net

include ${TOPDIR}/mk/package.mk

$(eval $(call PKG_template,LIBATM,libatm,${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))
$(eval $(call PKG_template,BR2684CTL,br2684ctl,${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS_1},${PKG_DESCR_1},${PKG_SECTION}))

CONFIGURE_STYLE:=	gnu
BUILD_STYLE:=		auto
INSTALL_STYLE:=		auto

post-install:
	${INSTALL_DIR} ${IDIR_LIBATM}/usr/lib
	${CP} ${WRKINST}/usr/lib/libatm.so* ${IDIR_LIBATM}/usr/lib
	${INSTALL_DIR} ${IDIR_BR2684CTL}/usr/sbin
	${CP} ${WRKINST}/usr/sbin/br2684ctl ${IDIR_BR2684CTL}/usr/sbin

include ${TOPDIR}/mk/pkg-bottom.mk
