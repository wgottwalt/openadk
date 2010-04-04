# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include ${TOPDIR}/rules.mk

PKG_NAME:=		syslog-ng
PKG_VERSION:=		1.6.12
PKG_RELEASE:=		1
PKG_MD5SUM:=		a3cbfdb6e1e5beea181a7349749719f3
PKG_DESCR:=		A powerful syslog daemon
PKG_SECTION:=		admin
PKG_DEPENDS:=		libol libwrap
PKG_BUILDDEP+=		libol tcp_wrappers
PKG_URL:=		http://www.balabit.com
PKG_SITES:=		http://www.balabit.com/downloads/files/syslog-ng/sources/1.6/src/

include ${TOPDIR}/mk/package.mk

$(eval $(call PKG_template,SYSLOG_NG,${PKG_NAME},${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))

CONFIGURE_ARGS+=	--enable-full-dynamic \
			--enable-tcp-wrapper
CONFIGURE_ENV+=		ac_cv_path_libol_config=${STAGING_DIR}/usr/bin
CONFIGURE_ENV+=		ac_cv_lib_nsl_gethostbyname=no

post-install:
	${INSTALL_DIR} ${IDIR_SYSLOG_NG}/usr/sbin \
		${IDIR_SYSLOG_NG}/etc/syslog-ng
	${INSTALL_BIN} ${WRKINST}/usr/sbin/syslog-ng \
		${IDIR_SYSLOG_NG}/usr/sbin/
	${INSTALL_DATA} ./files/syslog-ng.conf \
		${IDIR_SYSLOG_NG}/etc/syslog-ng/

include ${TOPDIR}/mk/pkg-bottom.mk
