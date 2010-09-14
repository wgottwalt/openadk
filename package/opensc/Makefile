# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include ${TOPDIR}/rules.mk

PKG_NAME:=		opensc
PKG_VERSION:=		0.11.13
PKG_RELEASE:=		1
PKG_MD5SUM:=		98fa151e947941f9c3f27420fdf47c11
PKG_DESCR:=		utilities to access smart cards
PKG_SECTION:=		crypto
PKG_BUILDDEP:=		libtool
PKG_URL:=		http://www.opensc-project.org/opensc/
PKG_SITES:=		http://www.opensc-project.org/files/opensc/

include ${TOPDIR}/mk/package.mk

$(eval $(call PKG_template,OPENSC,${PKG_NAME},${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))

post-install:
	${INSTALL_DIR} ${IDIR_OPENSC}/usr/lib
	${CP} ${WRKINST}/usr/lib/libopensc.so* \
		${IDIR_OPENSC}/usr/lib
	${CP} ${WRKINST}/usr/lib/libpkcs15init.so* \
		${IDIR_OPENSC}/usr/lib
	${CP} ${WRKINST}/usr/lib/libscconf.so* \
		${IDIR_OPENSC}/usr/lib
	${CP} ${WRKINST}/usr/lib/opensc-pkcs11.so \
		${IDIR_OPENSC}/usr/lib

include ${TOPDIR}/mk/pkg-bottom.mk
