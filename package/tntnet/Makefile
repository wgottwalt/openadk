# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include ${TOPDIR}/rules.mk

PKG_NAME:=		tntnet
PKG_VERSION:=		1.6.4
PKG_RELEASE:=		1
PKG_MD5SUM:=		e2c3c5075a890711a7569730493c0996
PKG_DESCR:=		small C++ application server
PKG_SECTION:=		www
PKG_DEPENDS:=		cxxtools zlib libiconv libpthread
PKG_BUILDDEP:=		cxxtools zlib libiconv
PKG_URL:=		http://www.tntnet.org/
PKG_SITES:=		http://www.tntnet.org/download/

include ${TOPDIR}/mk/package.mk

$(eval $(call PKG_template,TNTNET,${PKG_NAME},${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))

CONFIGURE_ARGS+=	--without-epoll \
			--without-sdk \
			--without-cgi \
			--without-sendfile \
			--without-ssl
CONFIGURE_ENV+= 	CXXFLAGS='${TARGET_CXXFLAGS}' \
			ac_cv_path_cxxtools_config=${STAGING_TARGET_DIR}/usr/bin
TARGET_LDFLAGS+=	-ldl

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
	${CP} ${WRKINST}/usr/lib/tntnet/tntnet.so* \
		${IDIR_TNTNET}/usr/lib/tntnet
	${CP} ${WRKINST}/usr/lib/libtntnet.so.* \
		${IDIR_TNTNET}/usr/lib

include ${TOPDIR}/mk/pkg-bottom.mk
