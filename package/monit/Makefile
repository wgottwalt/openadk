# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include ${TOPDIR}/rules.mk

PKG_NAME:=		monit
PKG_VERSION:=		5.0.3
PKG_RELEASE:=		1
PKG_MD5SUM:=		dae7859ec10551fc941daeae60dee9d3
PKG_DESCR:=		An utility for system services monitoring
PKG_SECTION:=		admin
PKG_DEPENDS:=		libpthread
ifeq ($(ADK_COMPILE_MONIT_WITH_SSL),y)
PKG_DEPENDS:=		libopenssl
PKG_BUILDDEP+=		openssl
endif
PKG_URL:=		http://mmonit.com/monit
PKG_SITES:=		http://www.tildeslash.com/monit/dist/

include ${TOPDIR}/mk/package.mk

$(eval $(call PKG_template,MONIT,${PKG_NAME},${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))

ifeq ($(ADK_COMPILE_MONIT_WITH_SSL),y)
CONFIGURE_ARGS+=	--with-ssl --with-ssl-dir="${STAGING_DIR}/usr"
else
CONFIGURE_ARGS+=	--without-ssl
endif

post-install:
	${INSTALL_DIR} ${IDIR_MONIT}/etc
	install -m0600 ${WRKBUILD}/monitrc ${IDIR_MONIT}/etc/
	${INSTALL_DIR} ${IDIR_MONIT}/usr/sbin
	${INSTALL_BIN} ${WRKBUILD}/monit ${IDIR_MONIT}/usr/sbin/monit

include ${TOPDIR}/mk/pkg-bottom.mk
