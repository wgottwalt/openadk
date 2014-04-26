# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include ${TOPDIR}/rules.mk

PKG_NAME:=		apr-util
PKG_VERSION:=		1.4.1
PKG_RELEASE:=		1
PKG_MD5SUM:=		666a5d56098a9debf998510e304c8095
PKG_DESCR:=		apache portable runtime utility library
PKG_SECTION:=		libs
PKG_DEPENDS:=		libexpat apr
PKG_BUILDDEP:=		expat apr
PKG_URL:=		http://apr.apache.org/
PKG_SITES:=		http://apache.mirror.clusters.cc/apr/
PKG_OPTS:=		dev

DISTFILES:=		${PKG_NAME}-${PKG_VERSION}.tar.gz

include ${TOPDIR}/mk/package.mk

$(eval $(call PKG_template,APR_UTIL,apr-util,${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION},${PKG_OPTS}))

CONFIGURE_ARGS+=	--without-berkeley-db \
			--with-apr=${STAGING_TARGET_DIR}/usr \
			--with-expat=${STAGING_TARGET_DIR}/usr
XAKE_FLAGS+=		apr_builddir=${STAGING_TARGET_DIR}/usr/share/build-1 \
			apr_builders=${STAGING_TARGET_DIR}/usr/share/build-1

apr-util-install:
	${INSTALL_DIR} ${IDIR_APR_UTIL}/usr/lib
	${CP} ${WRKINST}/usr/lib/libaprutil-1.so* ${IDIR_APR_UTIL}/usr/lib

include ${TOPDIR}/mk/pkg-bottom.mk
