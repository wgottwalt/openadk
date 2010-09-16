# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include ${TOPDIR}/rules.mk

PKG_NAME:=		apr-util
PKG_VERSION:=		1.3.9
PKG_RELEASE:=		1
PKG_MD5SUM:=		cc2ec0ba4f01d88375f1170f762518fa
PKG_DESCR:=		Apache Portable Runtime utility library
PKG_SECTION:=		libs
PKG_DEPENDS:=		libexpat apr
PKG_BUILDDEP:=		expat apr
PKG_URL:=		http://apr.apache.org/
PKG_SITES:=		http://apache.mirror.clusters.cc/apr/

include ${TOPDIR}/mk/package.mk

$(eval $(call PKG_template,APR_UTIL,${PKG_NAME},${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))

CONFIGURE_ARGS+=	--without-berkeley-db
CONFIGURE_ARGS+=	--with-apr=${STAGING_DIR}/usr
CONFIGURE_ARGS+=	--with-expat=${STAGING_DIR}/usr
XAKE_FLAGS+=		apr_builddir=${STAGING_DIR}/usr/share/build-1 \
			apr_builders=${STAGING_DIR}/usr/share/build-1

post-install:
	${INSTALL_DIR} ${IDIR_APR_UTIL}/usr/lib
	${CP} ${WRKINST}/usr/lib/libaprutil-1.so* ${IDIR_APR_UTIL}/usr/lib/

include ${TOPDIR}/mk/pkg-bottom.mk
