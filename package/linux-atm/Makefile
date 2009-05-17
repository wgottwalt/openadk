# $Id$
#-
# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include ${TOPDIR}/rules.mk

PKG_NAME:=		linux-atm
PKG_VERSION:=		2.4.1
PKG_RELEASE:=		2
PKG_MD5SUM:=		84fef49cc39ff2605204246666f65864
DISTFILES:=		${PKG_NAME}_${PKG_VERSION}.orig.tar.gz
MASTER_SITES:=		http://ftp.debian.org/debian/pool/main/l/linux-atm/

include ${TOPDIR}/mk/package.mk

$(eval $(call PKG_template,LINUX_ATM,linux-atm,${PKG_VERSION}-${PKG_RELEASE},${ARCH}))
$(eval $(call PKG_template,BR2684CTL,br2684ctl,${PKG_VERSION}-${PKG_RELEASE},${ARCH}))

CONFIGURE_STYLE=	gnu
BUILD_STYLE=		auto
INSTALL_STYLE=		auto

post-install:
	${INSTALL_DIR} ${IDIR_LINUX_ATM}/usr/lib
	${CP} ${WRKINST}/usr/lib/libatm.so.1 ${IDIR_LINUX_ATM}/usr/lib
	${INSTALL_DIR} ${IDIR_BR2684CTL}/usr/sbin
	${CP} ${WRKINST}/usr/sbin/br2684ctl ${IDIR_BR2684CTL}/usr/sbin/
	${INSTALL_DIR} ${IDIR_BR2684CTL}/etc/hotplug.d/net
	${INSTALL_DATA} ./files/br2684.hotplug \
		${IDIR_BR2684CTL}/etc/hotplug.d/net/30-br2684

include ${TOPDIR}/mk/pkg-bottom.mk
