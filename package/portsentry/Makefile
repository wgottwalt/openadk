# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include ${ADK_TOPDIR}/rules.mk

PKG_NAME:=		portsentry
PKG_VERSION:=		1.2
PKG_RELEASE:=		1
PKG_MD5SUM:=		3ebd3618ba9abfea2525e236bd44cebd
PKG_DESCR:=		software for protection against port scans
PKG_SECTION:=		net/security
PKG_URL:=		http://sourceforge.net/projects/sentrytools
PKG_SITES:=		${MASTER_SITE_SOURCEFORGE:=sentrytools/}

PKG_LIBC_DEPENDS:=	uclibc glibc

DISTFILES:=		${PKG_NAME}-${PKG_VERSION}.tar.gz
WRKDIST=		${WRKDIR}/${PKG_NAME}_beta

include ${ADK_TOPDIR}/mk/package.mk

$(eval $(call PKG_template,PORTSENTRY,portsentry,${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))

CONFIG_STYLE:=          manual
INSTALL_STYLE:=         manual

ALL_TARGET:=		linux
MAKE_FLAGS+=		CC="${TARGET_CC}" CFLAGS="${TARGET_CFLAGS}"

do-install:
	${INSTALL_DIR} ${IDIR_PORTSENTRY}/usr/bin ${IDIR_PORTSENTRY}/etc
	${INSTALL_DATA} ${WRKBUILD}/${PKG_NAME}.conf ${IDIR_PORTSENTRY}/etc/
	${INSTALL_BIN} ${WRKBUILD}/${PKG_NAME} ${IDIR_PORTSENTRY}/usr/bin/

include ${ADK_TOPDIR}/mk/pkg-bottom.mk
