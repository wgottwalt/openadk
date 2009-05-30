# $Id$
#-
# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include ${TOPDIR}/rules.mk

PKG_NAME:=		opensc
PKG_VERSION:=		0.11.8
PKG_RELEASE:=		1
PKG_MD5SUM:=		a269b478b18dddb648b9bd930206b5a8
PKG_DESCR:=		a set of libraries and utilities to access smart cards
PKG_SECTION:=		crypto
PKG_URL:=		http://www.opensc-project.org/opensc
PKG_SITES:=		http://www.opensc-project.org/files/opensc/

include ${TOPDIR}/mk/package.mk

$(eval $(call PKG_template,OPENSC,${PKG_NAME},${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))

CONFIGURE_STYLE:=	gnu
BUILD_STYLE:=		auto
INSTALL_STYLE:=		auto

post-install:
	${INSTALL_DIR} ${IDIR_OPENSC}/usr/lib
	${CP} ${WRKINST}/usr/lib/libopensc.so.* \
		${IDIR_OPENSC}/usr/lib
	${CP} ${WRKINST}/usr/lib/libpkcs15init.so.* \
		${IDIR_OPENSC}/usr/lib
	${CP} ${WRKINST}/usr/lib/libscconf.so.* \
		${IDIR_OPENSC}/usr/lib
	${CP} ${WRKINST}/usr/lib/opensc-pkcs11.so \
		${IDIR_OPENSC}/usr/lib

include ${TOPDIR}/mk/pkg-bottom.mk
