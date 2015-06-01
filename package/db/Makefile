# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include ${ADK_TOPDIR}/rules.mk

PKG_NAME:=		db
PKG_VERSION:=		5.3.21
PKG_RELEASE:=		2
PKG_HASH:=		ddd92a930317df92021054c03992392db9ea5cddba43bef8920d392a82114fb8
PKG_DESCR:=		disk file format database which stores key/data-pairs in single files
PKG_SECTION:=		libs/db
PKG_DEPENDS:=		libstdcxx
PKG_URL:=		http://www.oracle.com/technology/software/products/berkeley-db
PKG_SITES:=		http://distfiles.openadk.org/
PKG_LIBNAME:=		libdb
PKG_OPTS:=		dev

DISTFILES:=		${PKG_NAME}-${PKG_VERSION}.tar.gz
WRKBUILD=		${WRKSRC}/build_unix

include ${ADK_TOPDIR}/mk/package.mk

$(eval $(call PKG_template,LIBDB,libdb,${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION},${PKG_OPTS}))

CONFIGURE_PROG:=	dist/configure
CONFIGURE_ARGS+=	--enable-smallbuild \
			--disable-debug_rop \
			--disable-debug_wop \
			--disable-diagnostic \
			--disable-java \
			--disable-cxx \
			--enable-posixmutexes \
			--disable-uimutexes \
			--disable-tcl \
			--disable-compat185 \
			--disable-statistics \
			--disable-replication \
			--disable-cryptography \
			--disable-queue

libdb-install:
	${INSTALL_DIR} ${IDIR_LIBDB}/usr/lib
	${CP} ${WRKINST}/usr/lib/libdb*.so* ${IDIR_LIBDB}/usr/lib

include ${ADK_TOPDIR}/mk/pkg-bottom.mk
