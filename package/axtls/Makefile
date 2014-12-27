# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include ${ADK_TOPDIR}/rules.mk

PKG_NAME:=		axtls
PKG_VERSION:=		1.4.9
PKG_RELEASE:=		2
PKG_HASH:=		9bc08f4c7a6bda3079af8e3f5ceee6b2ee92af34e8efbc9acfeee6c27b1f7cc3
PKG_DESCR:=		small embedded webserver with tls
PKG_SECTION:=		net/http
PKG_DEPENDS:=		libaxtls
PKG_URL:=		http://axtls.sourceforge.net/
PKG_SITES:=		${MASTER_SITE_SOURCEFORGE:=axtls/}
PKG_LIBNAME:=		libaxtls
PKG_OPTS:=		dev

PKG_SUBPKGS:=		AXHTTPD LIBAXTLS
PKGSD_LIBAXTLS:=	small tls library
PKGSC_LIBAXTLS:=	libs/crypto

DISTFILES:=		axTLS-${PKG_VERSION}.tar.gz
WRKDIST=		${WRKDIR}/axTLS

include ${ADK_TOPDIR}/mk/package.mk

$(eval $(call PKG_template,AXHTTPD,axhttpd,${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))
$(eval $(call PKG_template,LIBAXTLS,libaxtls,${PKG_VERSION}-${PKG_RELEASE},,${PKGSD_LIBAXTLS},${PKGSC_LIBAXTLS},${PKG_OPTS}))

CONFIG_STYLE:=		manual
INSTALL_STYLE:=		manual

TARGET_CFLAGS+=		-fPIC
XAKE_FLAGS+=		STRIP='' \
			CC='${TARGET_CC}'

do-configure:
	${CP} ./files/config ${WRKBUILD}/config/.config
	${MAKE} -C ${WRKBUILD} oldconfig

do-install:
	# axtls library
	${INSTALL_DIR} ${IDIR_LIBAXTLS}/usr/lib
	$(CP) $(WRKBUILD)/_stage/libaxtls.so* $(IDIR_LIBAXTLS)/usr/lib/
	# awhttpd server
	${INSTALL_DIR} ${IDIR_AXHTTPD}/www
	${INSTALL_DIR} ${IDIR_AXHTTPD}/usr/sbin
	${INSTALL_BIN} $(WRKBUILD)/_stage/axhttpd $(IDIR_AXHTTPD)/usr/sbin/

include ${ADK_TOPDIR}/mk/pkg-bottom.mk
