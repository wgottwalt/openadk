# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include ${TOPDIR}/rules.mk

PKG_NAME:=		libdb
PKG_VERSION:=		4.7.25
PKG_RELEASE:=		1
PKG_MD5SUM:=		ec2b87e833779681a0c3a814aa71359e
PKG_DESCR:=		disk file format database which stores key/data-pairs in single files
PKG_SECTION:=		libs
PKG_URL:=		http://www.oracle.com/technology/software/products/berkeley-db
PKG_SITES:=		http://www.openadk.org/distfiles/

DISTFILES:=		db-${PKG_VERSION}.tar.gz
WRKDIST=		${WRKDIR}/db-${PKG_VERSION}
WRKBUILD=		${WRKSRC}/build_unix

include ${TOPDIR}/mk/package.mk

$(eval $(call PKG_template,LIBDB,${PKG_NAME},${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))

CONFIGURE_PROG:=	dist/configure
CONFIGURE_ARGS+=	--enable-smallbuild \
			--disable-debug_rop \
			--disable-debug_wop \
			--disable-diagnostic \
			--disable-java \
			--disable-cxx \
			--disable-posixmutexes \
			--disable-uimutexes \
			--disable-tcl \
			--disable-rpc \
			--disable-compat185 \
			--disable-statistics \
			--disable-replication \
			--disable-cryptography \
			--disable-queue \
			--with-mutex=UNIX/fcntl

post-install:
	${INSTALL_DIR} ${IDIR_LIBDB}/usr/lib
	${CP} ${WRKINST}/usr/lib/libdb*.so ${IDIR_LIBDB}/usr/lib/

include ${TOPDIR}/mk/pkg-bottom.mk
