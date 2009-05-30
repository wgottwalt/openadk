# $Id$
#-
# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include ${TOPDIR}/rules.mk

PKG_NAME:=		cryptsetup
PKG_VERSION:=		1.0.6
PKG_RELEASE:=		1
PKG_MD5SUM:=		00d452eb7a76e39f5749545d48934a10
PKG_DESCR:=		LUKS cryptsetup tools
PKG_SECTION:=		crypto
PKG_DEPENDS:=		libgcrypt device-mapper libuuid libpopt
PKG_URL:=		http://cryptsetup.googlecode.com
PKG_SITES:=		http://cryptsetup.googlecode.com/files/

DISTFILES:=		${PKG_NAME}-${PKG_VERSION}.tar.bz2

include ${TOPDIR}/mk/package.mk

$(eval $(call PKG_template,CRYPTSETUP,${PKG_NAME},${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))

CONFIGURE_STYLE:=	gnu
CONFIGURE_ARGS+=	--disable-static
BUILD_STYLE:=		auto
INSTALL_STYLE:=		auto

post-install:
	${INSTALL_DIR} ${IDIR_CRYPTSETUP}/usr/sbin ${IDIR_CRYPTSETUP}/usr/lib
	${CP} ${WRKINST}/usr/lib/libcryptsetup.so.* \
		${IDIR_CRYPTSETUP}/usr/lib
	${INSTALL_BIN} ${WRKINST}/usr/sbin/cryptsetup \
		${IDIR_CRYPTSETUP}/usr/sbin

include ${TOPDIR}/mk/pkg-bottom.mk
