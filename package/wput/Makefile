# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include ${TOPDIR}/rules.mk

PKG_NAME:=		wput
PKG_VERSION:=		0.5
PKG_RELEASE:=		1
PKG_MD5SUM:=		441b2e07219f78167b29a7ac33488fff
PKG_DESCR:=		a wget-like command-line FTP client
PKG_SECTION:=		net
PKG_SITES:=		${MASTER_SITE_SOURCEFORGE:=wput/}

DISTFILES:=		${PKG_NAME}-${PKG_VERSION}.tgz
WRKDIST=		${WRKDIR}/${PKG_NAME}

include ${TOPDIR}/mk/package.mk

$(eval $(call PKG_template,WPUT,${PKG_NAME},${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))

CONFIGURE_STYLE:=	gnu
CONFIGURE_ARGS+=	--disable-g-switch
BUILD_STYLE:=		auto

post-install:
	${INSTALL_DIR} ${IDIR_WPUT}/usr/bin
	${INSTALL_BIN} ${WRKBUILD}/wput ${IDIR_WPUT}/usr/bin/

include ${TOPDIR}/mk/pkg-bottom.mk
