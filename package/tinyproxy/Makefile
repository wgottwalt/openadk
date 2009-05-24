# $Id$
#-
# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include ${TOPDIR}/rules.mk

PKG_NAME:=		tinyproxy
PKG_VERSION:=		1.6.4
PKG_RELEASE:=		1
PKG_MD5SUM:=		3157b9159a8d005f4248cf4d4d6c65e2
MASTER_SITES:=		https://www.banu.com/pub/tinyproxy/1.6/

include ${TOPDIR}/mk/package.mk

$(eval $(call PKG_template,TINYPROXY,tinyproxy,${PKG_VERSION}-${PKG_RELEASE}))

CONFIGURE_STYLE:=	gnu
BUILD_STYLE:=		auto
INSTALL_STYLE:=		auto
CONFIGURE_ENV+=		ac_cv_header_libintl_h=no

ifeq (${ADK_COMPILE_TINYPROXY_WITH_TRANSPARENT_PROXY},y)
CONFIGURE_ARGS+=	--enable-transparent-proxy
endif
ifneq (${ADK_COMPILE_TINYPROXY_WITH_UPSTREAM},y)
CONFIGURE_ARGS+=	--disable-upstream
endif
ifneq (${ADK_COMPILE_TINYPROXY_WITH_FILTER},y)
CONFIGURE_ARGS+=	--disable-filter
endif

post-install:
	${INSTALL_DIR} ${IDIR_TINYPROXY}/usr/sbin \
		       ${IDIR_TINYPROXY}/etc/tinyproxy \
		       ${IDIR_TINYPROXY}/etc/init.d \
		       ${IDIR_TINYPROXY}/usr/share/tinyproxy
	${INSTALL_BIN} ${WRKINST}/usr/sbin/tinyproxy ${IDIR_TINYPROXY}/usr/sbin/
	${INSTALL_DATA} ${WRKINST}/usr/share/tinyproxy/{debug,default,stats}.html ${IDIR_TINYPROXY}/usr/share/tinyproxy/
	${INSTALL_DATA} ${WRKINST}/usr/share/tinyproxy/HTML_VARIABLES ${IDIR_TINYPROXY}/usr/share/tinyproxy/
	${INSTALL_DATA} ${WRKINST}/etc/tinyproxy/tinyproxy.conf ${IDIR_TINYPROXY}/etc/tinyproxy/
	${INSTALL_BIN} files/${PKG_NAME}.init ${IDIR_TINYPROXY}/etc/init.d/${PKG_NAME}

include ${TOPDIR}/mk/pkg-bottom.mk
