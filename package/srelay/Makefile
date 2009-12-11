# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include ${TOPDIR}/rules.mk

PKG_NAME:=		srelay
PKG_VERSION:=		0.4.7b2
PKG_RELEASE:=		1
PKG_MD5SUM:=		73904ecbb5d305135b3e8907ce7d0513
PKG_DESCR:=		A socks 4/5 proxy server
PKG_SECTION:=		net
PKG_SITES:=		${MASTER_SITE_SOURCEFORGE:=socks-relay/}

include ${TOPDIR}/mk/package.mk

$(eval $(call PKG_template,SRELAY,${PKG_NAME},${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))

CONFIGURE_STYLE:=	gnu
CONFIGURE_ENV+=		ac_cv_lib_nsl_getaddrinfo=no
CONFIGURE_ARGS+=	--disable-thread \
			--with-libwrap=no
BUILD_STYLE:=		auto

do-install:
	${INSTALL_DIR} ${IDIR_SRELAY}/usr/bin ${IDIR_SRELAY}/etc
	${INSTALL_DATA} ./files/srelay.conf ${IDIR_SRELAY}/etc
	${INSTALL_BIN} ${WRKBUILD}/srelay ${IDIR_SRELAY}/usr/bin

include ${TOPDIR}/mk/pkg-bottom.mk
