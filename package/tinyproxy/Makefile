# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include ${TOPDIR}/rules.mk

PKG_NAME:=		tinyproxy
PKG_VERSION:=		1.6.5
PKG_RELEASE:=		2
PKG_MD5SUM:=		2b2862ba33d2939e4572688d442ba415
PKG_DESCR:=		Tinyproxy is a lightweight HTTP and HTTPS proxy.
PKG_SECTION:=		net
PKG_URL:=		https://www.banu.com/tinyproxy
PKG_SITES:=		https://www.banu.com/pub/tinyproxy/1.6/

include ${TOPDIR}/mk/package.mk

$(eval $(call PKG_template,TINYPROXY,${PKG_NAME},${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))

CONFIGURE_STYLE:=	gnu
BUILD_STYLE:=		auto
INSTALL_STYLE:=		auto
CONFIGURE_ENV+=		ac_cv_header_libintl_h=no \
			ac_cv_lib_nsl_gethostbyaddr=no \
			ac_cv_lib_nsl_gethostname=no

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
		       ${IDIR_TINYPROXY}/usr/share/tinyproxy
	${INSTALL_DATA} ./files/tinyproxy.conf ${IDIR_TINYPROXY}/etc/tinyproxy
	${INSTALL_BIN} ${WRKINST}/usr/sbin/tinyproxy ${IDIR_TINYPROXY}/usr/sbin/
	${INSTALL_DATA} ${WRKINST}/usr/share/tinyproxy/{debug,default,stats}.html ${IDIR_TINYPROXY}/usr/share/tinyproxy/
	${INSTALL_DATA} ${WRKINST}/usr/share/tinyproxy/HTML_VARIABLES ${IDIR_TINYPROXY}/usr/share/tinyproxy/

include ${TOPDIR}/mk/pkg-bottom.mk
