# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include ${TOPDIR}/rules.mk

PKG_NAME:=		libtasn1
PKG_VERSION:=		3.5
PKG_RELEASE:=		1
PKG_MD5SUM:=		62c76352d0e17df1c082fe1c38bad5cf
PKG_DESCR:=		ASN.1 and DER structures manipulation library
PKG_SECTION:=		libs
PKG_URL:=		http://www.gnupg.org/
PKG_SITES:=		http://ftp.gnu.org/gnu/libtasn1/
PKG_OPTS:=		dev

DISTFILES:=             ${PKG_NAME}-${PKG_VERSION}.tar.gz

include ${TOPDIR}/mk/package.mk

$(eval $(call PKG_template,LIBTASN1,libtasn1,${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION},${PKG_OPTS}))

CONFIGURE_ARGS+=	--disable-gtk-doc-html

libtasn1-install:
	${INSTALL_DIR} ${IDIR_LIBTASN1}/usr/lib
	${CP} ${WRKINST}/usr/lib/libtasn1.so* ${IDIR_LIBTASN1}/usr/lib

include ${TOPDIR}/mk/pkg-bottom.mk
