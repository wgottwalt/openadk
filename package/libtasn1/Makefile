# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include ${TOPDIR}/rules.mk

PKG_NAME:=		libtasn1
PKG_VERSION:=		2.2
PKG_RELEASE:=		1
PKG_MD5SUM:=		14cc361500d2e768a8a6ec538ce3fecb
PKG_DESCR:=		an ASN.1 and DER structures manipulation library
PKG_SECTION:=		libs
PKG_URL:=		http://www.gnupg.org
PKG_SITES:=		ftp://ftp.gnutls.org/pub/gnutls/libtasn1/

include ${TOPDIR}/mk/package.mk

$(eval $(call PKG_template,LIBTASN1,${PKG_NAME},${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))

post-install:
	${INSTALL_DIR} ${IDIR_LIBTASN1}/usr/lib
	${CP} ${WRKINST}/usr/lib/libtasn1.so* ${IDIR_LIBTASN1}/usr/lib

include ${TOPDIR}/mk/pkg-bottom.mk
