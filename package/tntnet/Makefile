# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include ${TOPDIR}/rules.mk

PKG_NAME:=		tntnet
PKG_VERSION:=		1.6.4
PKG_RELEASE:=		1
PKG_MD5SUM:=		e2c3c5075a890711a7569730493c0996
PKG_DESCR:=		small C++ application server
PKG_SECTION:=		net
PKG_BUILDDEP+=		cxxtools zlib
ifneq (${ADK_COMPILE_TNTNET_WITH_OPENSSL},)
PKG_BUILDDEP+=		openssl
else ifneq (${ADK_COMPILE_TNTNET_WITH_GNUTLS},)
PKG_BUILDDEP+=		gnutls
endif
PKG_DEPENDS:=		cxxtools zlib libpthread libiconv
PKG_URL:=		http://www.tntnet.org
PKG_SITES:=		http://www.tntnet.org/download/
#PKG_CXX:=		TNTNET

include ${TOPDIR}/mk/package.mk

ifneq (${ADK_COMPILE_TNTNET_WITH_OPENSSL},)
PKG_DEPENDS+=		libopenssl
else ifneq (${ADK_COMPILE_TNTNET_WITH_GNUTLS},)
PKG_DEPENDS+=		libgnutls
endif

$(eval $(call PKG_template,TNTNET,${PKG_NAME},${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))

ifeq (${ADK_COMPILE_TNTNET_WITH_UCLIBCXX},y)
TCXXFLAGS+=		-fno-builtin -nostdinc++ -nodefaultlibs -I${STAGING_DIR}/usr/include/uClibc++ -Wl,-E
TLDFLAGS+=		-nodefaultlibs -luClibc++ -liconv -lpthread -lcxxtools -lm -ldl
else
TLDFLAGS+=		-liconv -lpthread -lcxxtools -lm -ldl
endif

CONFIGURE_STYLE:=	gnu
CONFIGURE_ARGS+=	--without-epoll \
			--without-sdk \
			--without-cgi \
			--without-sendfile
ifeq (${ADK_COMPILE_TNTNET_WITH_OPENSSL},y)
CONFIGURE_ARGS+=	--with-ssl=openssl
else ifeq (${ADK_COMPILE_TNTNET_WITH_GNUTLS},y)
CONFIGURE_ARGS+=	--with-ssl=gnutls
else
CONFIGURE_ARGS+=	--without-ssl
endif
CONFIGURE_ENV+= 	CXXFLAGS='${TCXXFLAGS}' \
			ac_cv_path_cxxtools_config=${STAGING_DIR}/usr/bin
BUILD_STYLE:=		auto
INSTALL_STYLE:=		auto

#ifeq (${ADK_COMPILE_TNTNET_WITH_UCLIBCXX},y)
# add workaround because libtool tries to link libstdc++
#post-configure:
#	${SED} 's#postdeps="-lstdc.*#postdeps="-lm"#' \
#	    ${WRKBUILD}/libtool
#endif

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

include ${TOPDIR}/mk/pkg-bottom.mk
