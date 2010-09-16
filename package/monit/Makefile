# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include ${TOPDIR}/rules.mk

PKG_NAME:=		monit
PKG_VERSION:=		5.1.1
PKG_RELEASE:=		1
PKG_MD5SUM:=		4bbd3845ae1cbab13ec211824e0486dc
PKG_DESCR:=		An utility for system services monitoring
PKG_SECTION:=		admin
PKG_DEPENDS:=		libpthread libopenssl
PKG_BUILDDEP:=		openssl
PKG_URL:=		http://mmonit.com/monit/
PKG_SITES:=		http://www.tildeslash.com/monit/dist/

include ${TOPDIR}/mk/package.mk

$(eval $(call PKG_template,MONIT,${PKG_NAME},${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))

CONFIGURE_ARGS+=	--with-ssl --with-ssl-dir="${STAGING_DIR}/usr"

post-install:
	${INSTALL_DIR} ${IDIR_MONIT}/etc
	install -m0600 ${WRKBUILD}/monitrc ${IDIR_MONIT}/etc/
	${INSTALL_DIR} ${IDIR_MONIT}/usr/sbin
	${INSTALL_BIN} ${WRKBUILD}/monit ${IDIR_MONIT}/usr/sbin/monit

include ${TOPDIR}/mk/pkg-bottom.mk
