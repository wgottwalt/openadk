# $Id$
#-
# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include ${TOPDIR}/rules.mk

PKG_NAME:=		tntnet
PKG_VERSION:=		1.6.4
PKG_RELEASE:=		1
PKG_MD5SUM:=		e2c3c5075a890711a7569730493c0996
MASTER_SITES:=		http://www.tntnet.org/download/

include ${TOPDIR}/mk/package.mk

$(eval $(call PKG_template,TNTNET,tntnet,${PKG_VERSION}-${PKG_RELEASE},${ARCH}))

ifeq (${ADK_COMPILE_CXXTOOLS_WITH_UCLIBCXX},y)
TCXXFLAGS+=		-fno-builtin -nostdinc++ -nodefaultlibs -I${STAGING_DIR}/usr/include/uClibc++
TLDFLAGS+=		-nodefaultlibs -luClibc++ -liconv -lpthread -lcxxtools -lm
DEPENDS=		libgcc, uclibc++, cxxtools, zlib, libpthread, libiconv
else
TLDFLAGS+=		-liconv -lpthread -lcxxtools -lm -ldl
DEPENDS=		libgcc, libstdcxx, cxxtools, zlib, libpthread, libiconv
endif

CONFIGURE_STYLE:=	gnu
CONFIGURE_ARGS+=	--without-epoll \
			--without-sdk \
			--without-cgi \
			--without-sendfile
ifeq (${ADK_COMPILE_TNTNET_WITH_OPENSSL},y)
CONFIGURE_ARGS+=	--with-ssl=openssl
SSL_DEPS=		", libopenssl"
else ifeq (${ADK_COMPILE_TNTNET_WITH_GNUTLS},y)
CONFIGURE_ARGS+=	--with-ssl=gnutls
SSL_DEPS=		", libgnutls"
else
CONFIGURE_ARGS+=	--without-ssl
endif
CONFIGURE_ENV+= 	CXXFLAGS='${TCXXFLAGS}' \
			ac_cv_path_cxxtools_config=${STAGING_DIR}/usr/bin
BUILD_STYLE:=		auto
INSTALL_STYLE:=		auto

ifeq (${ADK_COMPILE_CXXTOOLS_WITH_UCLIBCXX},y)
# add workaround because libtool tries to link libstdc++
post-configure:
	${SED} 's#postdeps="-lstdc.*#postdeps="-lm"#' \
	    ${WRKBUILD}/libtool
endif

post-install:
	${INSTALL_DIR} ${IDIR_TNTNET}/www
	${INSTALL_DIR} ${IDIR_TNTNET}/etc/tntnet
	${INSTALL_DIR} ${IDIR_TNTNET}/usr/bin
	${INSTALL_DIR} ${IDIR_TNTNET}/usr/lib/tntnet
	${INSTALL_DATA} ./files/tntnet.{conf,properties} \
		${IDIR_TNTNET}/etc/tntnet
	${INSTALL_DATA} ./files/mime.conf \
		${IDIR_TNTNET}/etc/tntnet
	${CP} ${WRKINST}/usr/bin/tntnet ${IDIR_TNTNET}/usr/bin
	${CP} ${WRKINST}/usr/lib/tntnet/tntnet.so* ${IDIR_TNTNET}/usr/lib/tntnet
	${CP} ${WRKINST}/usr/lib/libtntnet.so.* ${IDIR_TNTNET}/usr/lib
	echo Depends: ${DEPENDS}${SSL_DEPS} >>${IDIR_TNTNET}/CONTROL/control

include ${TOPDIR}/mk/pkg-bottom.mk
