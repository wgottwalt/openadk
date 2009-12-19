# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include ${TOPDIR}/rules.mk

PKG_NAME:=              apr-util
PKG_VERSION:=           0.9.15
PKG_RELEASE:=           1
PKG_BUILDDEP+=		expat apr
PKG_MD5SUM:=            dc772ae295f49ddb8ee8e69a9716c53b
PKG_DESCR:=		Apache Portable Runtime utility library
PKG_SECTION:=		libs
PKG_DEPENDS:=		expat apr
PKG_URL:=		http://apr.apache.org
PKG_SITES:=		http://apache.mirror.clusters.cc/apr/

include ${TOPDIR}/mk/package.mk

$(eval $(call PKG_template,APR_UTIL,${PKG_NAME},${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))

CONFIGURE_STYLE:=       gnu
CONFIGURE_ARGS+=	--without-berkeley-db
CONFIGURE_ARGS+=	--with-apr=${STAGING_DIR}/usr
CONFIGURE_ARGS+=	--with-expat=${STAGING_DIR}/usr
BUILD_STYLE:=           auto
INSTALL_STYLE:=         auto
XAKE_FLAGS+=		apr_builddir=${STAGING_DIR}/usr/share/build \
			apr_builders=${STAGING_DIR}/usr/share/build

post-install:
	${INSTALL_DIR} ${IDIR_APR_UTIL}/usr/lib
	${CP} ${WRKINST}/usr/lib/libaprutil-0.so* ${IDIR_APR_UTIL}/usr/lib/

include ${TOPDIR}/mk/pkg-bottom.mk
