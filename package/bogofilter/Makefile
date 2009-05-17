# $Id$
#-
# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include ${TOPDIR}/rules.mk

PKG_NAME:=			bogofilter
PKG_VERSION:=		1.1.3
PKG_RELEASE:=		1
PKG_MD5SUM:=		a816f509324ccb9946a4d89fefe525e1
MASTER_SITES:=		http://ftp.debian.org/debian/pool/main/b/bogofilter/
DISTFILES:=		${PKG_NAME}_${PKG_VERSION}.orig.tar.gz

include ${TOPDIR}/mk/package.mk

$(eval $(call PKG_template,BOGOFILTER,bogofilter,${PKG_VERSION}-${PKG_RELEASE},${ARCH}))

CONFIGURE_STYLE=	gnu
CONFIGURE_ENV+=		ac_cv_c_bigendian=no \
			ac_cv_sizeof_off_t=8 \
			ac_cv_sizeof_int=4 \
			ac_cv_sizeof_long=4 \
		    LIBS="-liconv"
CONFIGURE_ARGS+=	--without-libsqlite3-prefix \
					--without-libqdbm-prefix \
					--with-included-gsl \
					--with-libdb-prefix=${STAGING_DIR}/usr \
					--disable-transactions
#					--without-libdb-prefix
BUILD_STYLE=		auto
INSTALL_STYLE=		auto

PKG_DEPENDS:=		libdb libiconv

post-install:
	echo 'Depends: ${PKG_DEPENDS}' >>${IDIR_BOGOFILTER}/CONTROL/control
	${INSTALL_DIR} ${IDIR_BOGOFILTER}/usr/bin
	${INSTALL_BIN} ${WRKINST}/usr/bin/${PKG_NAME} ${IDIR_BOGOFILTER}/usr/bin/
ifeq (${ADK_PACKAGE_BOGOFILTER_BOGOUTIL},y)
	${INSTALL_BIN} ${WRKINST}/usr/bin/bogoutil ${IDIR_BOGOFILTER}/usr/bin/
endif
ifeq (${ADK_PACKAGE_BOGOFILTER_BOGOTUNE},y)
	${INSTALL_BIN} ${WRKINST}/usr/bin/bogotune ${IDIR_BOGOFILTER}/usr/bin/
endif

include ${TOPDIR}/mk/pkg-bottom.mk
