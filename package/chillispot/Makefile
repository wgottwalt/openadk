# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include ${TOPDIR}/rules.mk

PKG_NAME:=		chillispot
PKG_VERSION:=		1.1.0
PKG_RELEASE:=		2
PKG_MD5SUM:=		9d2597756af3fa14d7331b4a3651fc9b
PKG_DESCR:=		Wireless LAN Access Point Controller
PKG_SECTION:=		wifi
PKG_BUILDDEP:=		autotool
PKG_DEPENDS:=		kmod-tun
PKG_URL:=		http://www.chillispot.info/
PKG_SITES=		http://www.chillispot.info/download/

DISTFILES:=		${PKG_NAME}-${PKG_VERSION}.tar.gz

include ${TOPDIR}/mk/package.mk

$(eval $(call PKG_template,CHILLISPOT,chillispot,${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))

AUTOTOOL_STYLE:=	autoreconf

chillispot-install:
	${INSTALL_DIR} ${IDIR_CHILLISPOT}/usr/sbin ${IDIR_CHILLISPOT}/etc
	${INSTALL_DATA} ./files/chilli.conf \
		${IDIR_CHILLISPOT}/etc/
	${INSTALL_BIN} ${WRKINST}/usr/sbin/chilli ${IDIR_CHILLISPOT}/usr/sbin/

include ${TOPDIR}/mk/pkg-bottom.mk
