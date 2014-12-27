# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include ${ADK_TOPDIR}/rules.mk

PKG_NAME:=		logrotate
PKG_VERSION:=		3.8.7
PKG_RELEASE:=		1
PKG_HASH:=		f6ba691f40e30e640efa2752c1f9499a3f9738257660994de70a45fe00d12b64
PKG_DESCR:=		logfile rotation utility
PKG_SECTION:=		sys/misc
PKG_DEPENDS:=		libpopt
PKG_BUILDDEP:=		popt
PKG_SITES:=		https://fedorahosted.org/releases/l/o/logrotate/

DISTFILES:=		${PKG_NAME}-${PKG_VERSION}.tar.gz

include ${ADK_TOPDIR}/mk/package.mk

$(eval $(call PKG_template,LOGROTATE,logrotate,${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))

CONFIG_STYLE:=		manual
TARGET_CFLAGS+=		-D_GNU_SOURCE -DVERSION=\"$(PKG_VERSION)\"

logrotate-install:
	${INSTALL_DIR} ${IDIR_LOGROTATE}/usr/sbin
	${INSTALL_BIN} ${WRKINST}/usr/sbin/logrotate ${IDIR_LOGROTATE}/usr/sbin
	${INSTALL_DIR} ${IDIR_LOGROTATE}/etc/logrotate.d
	${INSTALL_DATA} ./files/logrotate.conf ${IDIR_LOGROTATE}/etc

include ${ADK_TOPDIR}/mk/pkg-bottom.mk
