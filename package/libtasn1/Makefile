# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include ${TOPDIR}/rules.mk

PKG_NAME:=		libtasn1
PKG_VERSION:=		2.11
PKG_RELEASE:=		1
PKG_MD5SUM:=		ee8076752f2afcbcd12f3dd9bc622748
PKG_DESCR:=		an ASN.1 and DER structures manipulation library
PKG_SECTION:=		libs
PKG_URL:=		http://www.gnupg.org/
PKG_SITES:=		http://ftp.gnu.org/gnu/libtasn1/

include ${TOPDIR}/mk/package.mk

$(eval $(call PKG_template,LIBTASN1,${PKG_NAME},${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))

CONFIGURE_ARGS+=	--disable-gtk-doc-html

post-install:
	${INSTALL_DIR} ${IDIR_LIBTASN1}/usr/lib
	${CP} ${WRKINST}/usr/lib/libtasn1.so* ${IDIR_LIBTASN1}/usr/lib

include ${TOPDIR}/mk/pkg-bottom.mk
