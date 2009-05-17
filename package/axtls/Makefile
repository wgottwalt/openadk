# $Id$
#-
# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include ${TOPDIR}/rules.mk

PKG_NAME:=		axtls
PKG_VERSION:=		1.1.0
PKG_RELEASE:=		8
PKG_MD5SUM:=		4a834edc93f46fdca4f9c93ec665376e
DISTFILES:=		axTLS-${PKG_VERSION}.tar.gz
MASTER_SITES:=		${MASTER_SITE_SOURCEFORGE:=axtls/}
WRKDIST=		${WRKDIR}/axTLS

include ${TOPDIR}/mk/package.mk

$(eval $(call PKG_template,LIBAXTLS,libaxtls,${PKG_VERSION}-${PKG_RELEASE},${ARCH}))
$(eval $(call PKG_template,AXHTTPD,axhttpd,$(PKG_VERSION)-$(PKG_RELEASE),$(ARCH)))

BUILD_STYLE=		auto
XAKE_FLAGS+=		STRIP='' \
			CC='${TARGET_CC}' \
			OPT_CFLAGS='${TARGET_CFLAGS}' \
			OPT_LDFLAGS=""

do-configure:
	${CP} ./files/config ${WRKBUILD}/config/.config
	${MAKE} -C ${WRKBUILD} oldconfig

do-install:
	# axtls library
	${INSTALL_DIR} ${IDIR_LIBAXTLS}/usr/lib
	$(CP) $(WRKBUILD)/_stage/libaxtls.so.* $(IDIR_LIBAXTLS)/usr/lib/
	# awhttpd server
	${INSTALL_DIR} ${IDIR_AXHTTPD}/etc/init.d
	${INSTALL_DIR} ${IDIR_AXHTTPD}/www
	${INSTALL_DIR} ${IDIR_AXHTTPD}/usr/sbin
	${INSTALL_BIN} $(WRKBUILD)/_stage/axhttpd $(IDIR_AXHTTPD)/usr/sbin/
	$(INSTALL_BIN) ./files/axhttpd.init \
	    $(IDIR_AXHTTPD)/etc/init.d/axhttpd

include ${TOPDIR}/mk/pkg-bottom.mk
