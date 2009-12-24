# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include ${TOPDIR}/rules.mk

PKG_NAME:=		freeradius-client
PKG_VERSION:=		1.1.6
PKG_RELEASE:=		1
PKG_BUILDDEP+=		openssl
PKG_MD5SUM:=		edd4d904e802ff66d35532be1475cfa7
PKG_DESCR:=		RADIUS client
PKG_SECTION:=		net
PKG_DEPENDS:=		libopenssl
PKG_URL:=		http://www.freeradius.org
PKG_SITES:=		ftp://ftp.freeradius.org/pub/radius/ \
			http://freeradius.portal-to-web.de/ \
			ftp://ftp.uk.freeradius.org/pub/radius/

include ${TOPDIR}/mk/package.mk

$(eval $(call PKG_template,FREERADIUS_CLIENT,freeradius-client,${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))
$(eval $(call PKG_template,LIBFREERADIUS_CLIENT,libfreeradius-client,${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))

CONFIGURE_STYLE:=	gnu
CONFIGURE_ENV+=		ac_cv_func_uname=no
BUILD_STYLE:=		auto
INSTALL_STYLE:=		auto

do-install:
	${INSTALL_DIR} ${IDIR_FREERADIUS_CLIENT}/usr/sbin
	${INSTALL_BIN} ${WRKINST}/usr/sbin/radiusclient \
		${IDIR_FREERADIUS_CLIENT}/usr/sbin
	${INSTALL_BIN} ${WRKINST}/usr/sbin/rad{login,status} \
		${IDIR_FREERADIUS_CLIENT}/usr/sbin
	${CP} ${WRKINST}/etc ${IDIR_FREERADIUS_CLIENT}/
	${INSTALL_DIR} ${IDIR_LIBFREERADIUS_CLIENT}/usr/lib
	${CP} ${WRKINST}/usr/lib/libfreeradius-client.so* \
		${IDIR_LIBFREERADIUS_CLIENT}/usr/lib

include ${TOPDIR}/mk/pkg-bottom.mk
