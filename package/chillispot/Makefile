# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include ${ADK_TOPDIR}/rules.mk

PKG_NAME:=		chillispot
PKG_VERSION:=		1.1.0
PKG_RELEASE:=		2
PKG_HASH:=		b505ab963af8423ef8ae844951ef05fe1554630b448f1174074e9881cb474a01
PKG_DESCR:=		wireless lan access point controller
PKG_SECTION:=		net/wifi
PKG_KDEPENDS:=		tun
PKG_URL:=		http://www.chillispot.info/
PKG_SITES:=		http://www.chillispot.info/download/

DISTFILES:=		${PKG_NAME}-${PKG_VERSION}.tar.gz

include ${ADK_TOPDIR}/mk/package.mk

$(eval $(call PKG_template,CHILLISPOT,chillispot,${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))

AUTOTOOL_STYLE:=	autoreconf
CONFIGURE_ENV+=         ac_cv_func_malloc_0_nonnull=yes \
			ac_cv_func_realloc_0_nonnull=yes

chillispot-install:
	${INSTALL_DIR} ${IDIR_CHILLISPOT}/usr/sbin ${IDIR_CHILLISPOT}/etc
	${INSTALL_DATA} ./files/chilli.conf \
		${IDIR_CHILLISPOT}/etc/
	${INSTALL_BIN} ${WRKINST}/usr/sbin/chilli ${IDIR_CHILLISPOT}/usr/sbin/

include ${ADK_TOPDIR}/mk/pkg-bottom.mk
