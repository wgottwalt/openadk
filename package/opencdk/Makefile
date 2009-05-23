# $Id$
#-
# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include ${TOPDIR}/rules.mk

PKG_NAME:=		opencdk
PKG_VERSION:=		0.6.4
PKG_RELEASE:=		1
PKG_MD5SUM:=		7bfc820bcdc08f0c31f860710368071e

MASTER_SITES:=		ftp://ftp.gnutls.org/pub/gnutls/opencdk/ \
			ftp://ftp.gnupg.org/gcrypt/alpha/gnutls/opencdk/ \
			http://www.mirrors.wiretapped.net/security/network-security/gnutls/opencdk/ \
			ftp://ftp.mirrors.wiretapped.net/pub/security/network-security/gnutls/opencdk/ \
			http://josefsson.org/gnutls/releases/opencdk/
DISTFILES:=		${PKG_NAME}-${PKG_VERSION}.tar.bz2

include ${TOPDIR}/mk/package.mk

$(eval $(call PKG_template,LIBOPENCDK,libopencdk,${PKG_VERSION}-${PKG_RELEASE}))

CONFIGURE_STYLE:=	gnu
CONFIGURE_ARGS+=	--with-libgcrypt-prefix='${STAGING_DIR}/usr'
BUILD_STYLE:=		auto
INSTALL_STYLE:=		auto

post-install:
	${INSTALL_DIR} ${IDIR_LIBOPENCDK}/usr/lib
	${CP} ${WRKINST}/usr/lib/libopencdk.so.* ${IDIR_LIBOPENCDK}/usr/lib

include ${TOPDIR}/mk/pkg-bottom.mk
