# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include ${ADK_TOPDIR}/rules.mk

PKG_NAME:=		chillispot
PKG_VERSION:=		1.1.0
PKG_RELEASE:=		2
PKG_MD5SUM:=		9d2597756af3fa14d7331b4a3651fc9b
PKG_DESCR:=		wireless lan access point controller
PKG_SECTION:=		net/wifi
PKG_URL:=		http://www.chillispot.info/
PKG_SITES:=		http://www.chillispot.info/download/
PKG_CFLINE_CHILLISPOT:=	select ADK_KERNEL_TUN m

DISTFILES:=		${PKG_NAME}-${PKG_VERSION}.tar.gz

include ${ADK_TOPDIR}/mk/package.mk

$(eval $(call PKG_template,CHILLISPOT,chillispot,${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))

AUTOTOOL_STYLE:=	autoreconf

chillispot-install:
	${INSTALL_DIR} ${IDIR_CHILLISPOT}/usr/sbin ${IDIR_CHILLISPOT}/etc
	${INSTALL_DATA} ./files/chilli.conf \
		${IDIR_CHILLISPOT}/etc/
	${INSTALL_BIN} ${WRKINST}/usr/sbin/chilli ${IDIR_CHILLISPOT}/usr/sbin/

include ${ADK_TOPDIR}/mk/pkg-bottom.mk
