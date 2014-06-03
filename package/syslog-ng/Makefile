# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include ${TOPDIR}/rules.mk

PKG_NAME:=		syslog-ng
PKG_VERSION:=		3.5.4.1
PKG_RELEASE:=		1
PKG_MD5SUM:=		ff3bf223ebafbaa92b69a2d5b729f368
PKG_DESCR:=		powerful syslog daemon
PKG_SECTION:=		sys/misc
PKG_BUILDDEP:=		eventlog
PKG_DEPENDS:=		eventlog
PKG_URL:=		http://www.balabit.com/
PKG_SITES:=		http://www.balabit.com/downloads/files/syslog-ng/open-source-edition/${PKG_VERSION}/source/

PKG_LIBC_DEPENDS:=	glibc musl

DISTFILES:=		${PKG_NAME}_${PKG_VERSION}.tar.gz

include ${TOPDIR}/mk/package.mk

$(eval $(call PKG_template,SYSLOG_NG,syslog-ng,${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))

CONFIGURE_ARGS+=	--enable-full-dynamic \
			--disable-tcp-wrapper
CONFIGURE_ENV+=		ac_cv_lib_nsl_gethostbyname=no

syslog-ng-install:
	${INSTALL_DIR} ${IDIR_SYSLOG_NG}/usr/sbin \
		${IDIR_SYSLOG_NG}/etc/syslog-ng
	${INSTALL_BIN} ${WRKINST}/usr/sbin/syslog-ng \
		${IDIR_SYSLOG_NG}/usr/sbin/
	${INSTALL_DATA} ./files/syslog-ng.conf \
		${IDIR_SYSLOG_NG}/etc/syslog-ng/

include ${TOPDIR}/mk/pkg-bottom.mk
