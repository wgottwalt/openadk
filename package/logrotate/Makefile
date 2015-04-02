# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include ${ADK_TOPDIR}/rules.mk

PKG_NAME:=		logrotate
PKG_VERSION:=		3.8.9
PKG_RELEASE:=		1
PKG_HASH:=		700ed7ce9072a1cca324779a74797dfaefdae37ac50a817134b947c4ded1dfa7
PKG_DESCR:=		logfile rotation utility
PKG_SECTION:=		sys/misc
PKG_DEPENDS:=		libpopt
PKG_BUILDDEP:=		popt
PKG_SITES:=		https://fedorahosted.org/releases/l/o/logrotate/

DISTFILES:=		${PKG_NAME}-${PKG_VERSION}.tar.gz

include ${ADK_TOPDIR}/mk/package.mk

$(eval $(call PKG_template,LOGROTATE,logrotate,${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))

CONFIG_STYLE:=		manual
TARGET_CFLAGS+=		-DVERSION=\"$(PKG_VERSION)\"

logrotate-install:
	${INSTALL_DIR} ${IDIR_LOGROTATE}/usr/sbin
	${INSTALL_BIN} ${WRKINST}/usr/sbin/logrotate ${IDIR_LOGROTATE}/usr/sbin
	${INSTALL_DIR} ${IDIR_LOGROTATE}/etc/logrotate.d
	${INSTALL_DATA} ./files/logrotate.conf ${IDIR_LOGROTATE}/etc

include ${ADK_TOPDIR}/mk/pkg-bottom.mk
