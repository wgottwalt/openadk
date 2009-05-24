# $Id$
#-
# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include ${TOPDIR}/rules.mk

PKG_NAME:=		libtasn1
PKG_VERSION:=		1.1
PKG_RELEASE:=		1
PKG_MD5SUM:=		93b43cc5013bda4d8bf64508f1566c54
MASTER_SITES:=		ftp://ftp.gnutls.org/pub/gnutls/libtasn1/ \
			ftp://ftp.gnupg.org/gcrypt/alpha/gnutls/libtasn1/ \
			http://www.mirrors.wiretapped.net/security/network-securitygnutls/libtasn1/ \
			ftp://ftp.mirrors.wiretapped.net/pub/security/network-security/gnutls/libtasn1/ \
			http://josefsson.org/gnutls/releases/libtasn1/

include ${TOPDIR}/mk/package.mk

$(eval $(call PKG_template,LIBTASN1,libtasn1,${PKG_VERSION}-${PKG_RELEASE}))

CONFIGURE_STYLE=	gnu
BUILD_STYLE=		auto
INSTALL_STYLE=		auto

post-install:
	${INSTALL_DIR} ${IDIR_LIBTASN1}/usr/lib
	${CP} ${WRKINST}/usr/lib/libtasn1.so.* ${IDIR_LIBTASN1}/usr/lib

include ${TOPDIR}/mk/pkg-bottom.mk
