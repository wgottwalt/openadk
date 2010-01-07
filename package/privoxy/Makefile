# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include ${TOPDIR}/rules.mk

PKG_NAME:=		privoxy
PKG_VERSION:=		3.0.15
PKG_RELEASE:=		1
PKG_VARIANT:=		beta
PKG_MD5SUM:=		6571dc9524e945e79c2af62fefe7b107
PKG_DESCR:=		web proxy with advanced filtering capabilities
PKG_SECTION:=		net
PKG_DEPENDS:=		libpthread libpcre
PKG_BUILDDEP+=		pcre
PKG_URL:=		http://www.privoxy.org
PKG_SITES:=		${MASTER_SITE_SOURCEFORGE:=ijbswa/}

DISTFILES:=		${PKG_NAME}-${PKG_VERSION}-${PKG_VARIANT}-src.tar.gz
WRKDIST=		${WRKDIR}/${PKG_NAME}-${PKG_VERSION}-${PKG_VARIANT}

include ${TOPDIR}/mk/package.mk

$(eval $(call PKG_template,PRIVOXY,${PKG_NAME},${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))

TLDFLAGS+=		-pthread
CONFIGURE_STYLE:=	gnu
CONFIGURE_ARGS+=	--disable-editor \
			--disable-jar-files \
			--sysconfdir=/etc/privoxy
# uClibc setpgrp does not take arguments
CONFIGURE_ENV+=		ac_cv_func_setpgrp_void=yes \
			ac_cv_lib_nsl_gethostbyname=no
BUILD_STYLE:=		auto
MAKE_FLAGS+=		SPECIAL_CFLAGS='${TLDFLAGS}'
MAKE_FILE:=		GNUmakefile
INSTALL_STYLE:=		auto

post-install:
	${INSTALL_DIR} ${IDIR_PRIVOXY}/usr/sbin ${IDIR_PRIVOXY}/etc/privoxy
	${CP} ${WRKINST}/etc/privoxy/* ${IDIR_PRIVOXY}/etc/privoxy
	${INSTALL_BIN} ${WRKINST}/usr/sbin/privoxy ${IDIR_PRIVOXY}/usr/sbin/

include ${TOPDIR}/mk/pkg-bottom.mk
