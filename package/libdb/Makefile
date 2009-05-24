# $Id$
#-
# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include ${TOPDIR}/rules.mk

PKG_NAME:=		libdb
PKG_VERSION:=		4.7.25
PKG_RELEASE:=		1
PKG_MD5SUM:=		ec2b87e833779681a0c3a814aa71359e
MASTER_SITES:=		http://www.oracle.com/technology/software/products/berkeley-db/
DISTFILES:=		db-${PKG_VERSION}.tar.gz
WRKDIST=		${WRKDIR}/db-${PKG_VERSION}

include ${TOPDIR}/mk/package.mk

$(eval $(call PKG_template,LIBDB,libdb,${PKG_VERSION}-${PKG_RELEASE}))

ifeq ($(DEBUG),1)
PKG_CONFIGURE:=		--enable-debug
else
PKG_CONFIGURE:=		--disable-debug
endif

do-configure:
	(cd ${WRKBUILD}/build_unix ; \
		${TARGET_CONFIGURE_OPTS} \
		CFLAGS="${TARGET_CFLAGS_ARCH} -pipe" \
		CPPFLAGS="-I${STAGING_DIR}/usr/include" \
		LDFLAGS="-L${STAGING_DIR}/usr/lib" \
		../dist/configure \
		--target=${GNU_TARGET_NAME} \
		--host=${GNU_TARGET_NAME} \
		--build=${GNU_HOST_NAME} \
		--program-prefix="" \
		--program-suffix="" \
		--prefix=/usr \
		--exec-prefix=/usr \
		--bindir=/usr/bin \
		--datadir=/usr/share \
		--includedir=/usr/include \
		--infodir=/usr/share/info \
		--libdir=/usr/lib \
		--libexecdir=/usr/lib \
		--localstatedir=/var \
		--mandir=/usr/share/man \
		--sbindir=/usr/sbin \
		--sysconfdir=/etc \
		--disable-nls \
		--enable-shared \
		--enable-static \
		--enable-smallbuild \
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
		--with-mutex=UNIX/fcntl \
		${PKG_CONFIGURE} \
		);

do-install:
	${MAKE} -C ${WRKBUILD}/build_unix \
		DESTDIR="${WRKINST}" install

post-install:
	${INSTALL_DIR} ${IDIR_LIBDB}/usr/lib
	${CP} ${WRKINST}/usr/lib/libdb*.so ${IDIR_LIBDB}/usr/lib/

include ${TOPDIR}/mk/pkg-bottom.mk
