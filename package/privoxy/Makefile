# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include ${TOPDIR}/rules.mk

PKG_NAME:=		privoxy
PKG_VERSION:=		3.0.12
PKG_RELEASE:=		1
PKG_MD5SUM:=		c973e608d27b248ef567b47664308da1
PKG_DESCR:=		web proxy with advanced filtering capabilities
PKG_SECTION:=		net
PKG_DEPENDS:=		libpthread
PKG_URL:=		http://www.privoxy.org
PKG_SITES:=		${MASTER_SITE_SOURCEFORGE:=ijbswa/}

DISTFILES:=		${PKG_NAME}-${PKG_VERSION}-stable-src.tar.gz
WRKDIST=		${WRKDIR}/${PKG_NAME}-${PKG_VERSION}-stable

include ${TOPDIR}/mk/package.mk

$(eval $(call PKG_template,PRIVOXY,${PKG_NAME},${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))

TLDFLAGS+=		-pthread
CONFIGURE_STYLE:=	gnu
CONFIGURE_ENV+=		ac_cv_func_setpgrp_void=no \
			ac_cv_lib_nsl_gethostbyname=no
BUILD_STYLE:=		auto
MAKE_FLAGS+=		SPECIAL_CFLAGS='${TLDFLAGS}'
MAKE_FILE:=		GNUmakefile
INSTALL_STYLE:=		auto

post-extract:
	@find ${WRKBUILD} -name *.rej -delete

post-install:
	${INSTALL_DIR} ${IDIR_PRIVOXY}/usr/sbin 
	${INSTALL_BIN} ${WRKINST}/usr/sbin/privoxy ${IDIR_PRIVOXY}/usr/sbin/

include ${TOPDIR}/mk/pkg-bottom.mk
