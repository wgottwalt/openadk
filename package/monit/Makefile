# $Id$
#-
# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include ${TOPDIR}/rules.mk

PKG_NAME:=		monit
PKG_VERSION:=		4.10.1
PKG_RELEASE:=		1
PKG_MD5SUM:=		d3143b0bbd79b53f1b019d2fc1dae656
MASTER_SITES:=		http://www.tildeslash.com/monit/dist/

include ${TOPDIR}/mk/package.mk

$(eval $(call PKG_template,MONIT,monit,${PKG_VERSION}-${PKG_RELEASE},${ARCH}))

PKG_DEPENDS:=		libpthread,

ifeq ($(ADK_COMPILE_MONIT_WITH_SSL),y)
PKG_DEPENDS+=		libopenssl
CONFIGURE_ARGS+=	--with-ssl --with-ssl-dir="${STAGING_DIR}/usr"
else
CONFIGURE_ARGS+=	--without-ssl
endif

CONFIGURE_STYLE:=	gnu
BUILD_STYLE:=		auto
INSTALL_STYLE:=		auto

post-install:
	${INSTALL_DIR} ${IDIR_MONIT}/etc
	install -m0600 ${WRKBUILD}/monitrc ${IDIR_MONIT}/etc/
	${INSTALL_DIR} ${IDIR_MONIT}/etc/init.d
	${INSTALL_BIN} ./files/monit.init ${IDIR_MONIT}/etc/init.d/monit
	${INSTALL_DIR} ${IDIR_MONIT}/usr/sbin
	${INSTALL_BIN} ${WRKBUILD}/monit ${IDIR_MONIT}/usr/sbin/monit
	echo 'Depends: ${PKG_DEPENDS}' >>${IDIR_MONIT}/CONTROL/control

include ${TOPDIR}/mk/pkg-bottom.mk
