# $Id$
#-
# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include ${TOPDIR}/rules.mk

PKG_NAME:=		fetchmail
PKG_VERSION:=		6.3.9
PKG_RELEASE:=		1
PKG_MD5SUM:=		72c20ad2b9629f1a109668b05a84d823
MASTER_SITES:=		http://download.berlios.de/fetchmail/
DISTFILES:=             ${PKG_NAME}-${PKG_VERSION}.tar.bz2

include ${TOPDIR}/mk/package.mk

$(eval $(call PKG_template,FETCHMAIL,fetchmail,${PKG_VERSION}-${PKG_RELEASE}))

CONFIGURE_STYLE=	gnu
CONFIGURE_ENV+=		ac_cv_c_bigendian=no \
			ac_cv_sizeof_off_t=8 \
			ac_cv_sizeof_int=4 \
			ac_cv_sizeof_long=4
CONFIGURE_ARGS+=	--without-hesiod
BUILD_STYLE=		auto
INSTALL_STYLE=		auto

ifeq (${ADK_PACKAGE_FETCHMAIL_SSL},y)
CONFIGURE_ARGS+=	--with-ssl='${STAGING_DIR}/usr'
PKG_DEPENDS:=		openssl
else
CONFIGURE_ARGS+=	--without-ssl
PKG_DEPENDS:=		
endif

post-install:
	echo 'Depends: ${PKG_DEPENDS}' >>${IDIR_FETCHMAIL}/CONTROL/control
	${INSTALL_DIR} ${IDIR_FETCHMAIL}/usr/bin
	${INSTALL_BIN} ${WRKINST}/usr/bin/${PKG_NAME} ${IDIR_FETCHMAIL}/usr/bin/

include ${TOPDIR}/mk/pkg-bottom.mk
