# $Id$
#-
# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include ${TOPDIR}/rules.mk

PKG_NAME:=		opensc
PKG_VERSION:=		0.11.7
PKG_RELEASE:=		1
PKG_MD5SUM:=		419e9be372c2f9bbb3ce9704c929d5ec
MASTER_SITES:=		http://www.opensc-project.org/files/opensc/

include ${TOPDIR}/mk/package.mk

$(eval $(call PKG_template,OPENSC,opensc,${PKG_VERSION}-${PKG_RELEASE},${ARCH}))

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
