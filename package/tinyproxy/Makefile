# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include ${TOPDIR}/rules.mk

PKG_NAME:=		tinyproxy
PKG_VERSION:=		1.8.3
PKG_RELEASE:=		2
PKG_MD5SUM:=		eca927f7f6a9ce8394b2b256361978a7
PKG_DESCR:=		lightweight HTTP and HTTPS proxy
PKG_BUILDDEP:=		autotool
PKG_SECTION:=		proxy
PKG_URL:=		https://www.banu.com/tinyproxy/
PKG_SITES:=		https://www.banu.com/pub/tinyproxy/1.8/

DISTFILES:=		${PKG_NAME}-${PKG_VERSION}.tar.gz

include ${TOPDIR}/mk/package.mk

$(eval $(call PKG_template,TINYPROXY,tinyproxy,${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))

AUTOTOOL_STYLE:=	autoreconf
CONFIGURE_ARGS+=	--disable-regexcheck

tinyproxy-install:
	${INSTALL_DIR} ${IDIR_TINYPROXY}/usr/sbin \
		       ${IDIR_TINYPROXY}/etc/tinyproxy \
		       ${IDIR_TINYPROXY}/usr/share/tinyproxy
	${INSTALL_DATA} ./files/tinyproxy.conf \
		${IDIR_TINYPROXY}/etc/tinyproxy
	${INSTALL_BIN} ${WRKINST}/usr/sbin/tinyproxy \
		${IDIR_TINYPROXY}/usr/sbin/
	${INSTALL_DATA} ${WRKINST}/usr/share/tinyproxy/debug.html \
		${IDIR_TINYPROXY}/usr/share/tinyproxy/
	${INSTALL_DATA} ${WRKINST}/usr/share/tinyproxy/default.html \
		${IDIR_TINYPROXY}/usr/share/tinyproxy/
	${INSTALL_DATA} ${WRKINST}/usr/share/tinyproxy/stats.html \
		${IDIR_TINYPROXY}/usr/share/tinyproxy/

include ${TOPDIR}/mk/pkg-bottom.mk
