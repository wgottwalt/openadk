# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include ${ADK_TOPDIR}/rules.mk

PKG_NAME:=		privoxy
PKG_VERSION:=		3.0.26
PKG_RELEASE:=		1
PKG_VARIANT:=		stable
PKG_HASH:=		57e415b43ee5dfdca74685cc034053eaae962952fdabd086171551a86abf9cd8
PKG_DESCR:=		web proxy with advanced filtering capabilities
PKG_SECTION:=		net/proxy
PKG_DEPENDS:=		libpcre
PKG_BUILDDEP:=		pcre
PKG_NEEDS:=		threads
PKG_URL:=		http://www.privoxy.org/
PKG_SITES:=		${MASTER_SITE_SOURCEFORGE:=ijbswa/}

DISTFILES:=		${PKG_NAME}-${PKG_VERSION}-${PKG_VARIANT}-src.tar.gz
WRKDIST=		${WRKDIR}/${PKG_NAME}-${PKG_VERSION}-${PKG_VARIANT}

include ${ADK_TOPDIR}/mk/package.mk

$(eval $(call PKG_template,PRIVOXY,privoxy,${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))

AUTOTOOL_STYLE:=	autoreconf
CONFIGURE_ARGS+=	--disable-editor \
			--disable-jar-files \
			--sysconfdir=/etc/privoxy
# uClibc setpgrp does not take arguments
CONFIGURE_ENV+=		ac_cv_func_setpgrp_void=yes \
			ac_cv_lib_nsl_gethostbyname=no
MAKE_FLAGS+=		SPECIAL_CFLAGS='${TARGET_LDFLAGS}'
MAKE_FILE:=		GNUmakefile

privoxy-install:
	${INSTALL_DIR} ${IDIR_PRIVOXY}/usr/sbin ${IDIR_PRIVOXY}/etc/privoxy
	${CP} ${WRKINST}/etc/privoxy/* ${IDIR_PRIVOXY}/etc/privoxy
	${INSTALL_BIN} ${WRKINST}/usr/sbin/privoxy ${IDIR_PRIVOXY}/usr/sbin/

include ${ADK_TOPDIR}/mk/pkg-bottom.mk
