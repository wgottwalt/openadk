# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include ${TOPDIR}/rules.mk

PKG_NAME:=		wget
PKG_VERSION:=		1.11.4
PKG_RELEASE:=		1
PKG_MD5SUM:=		69e8a7296c0e12c53bd9ffd786462e87
PKG_DESCR:=		retrieving files using HTTP, HTTPS and FTP
PKG_SECTION:=		net
PKG_URL:=		http://www.gnu.org/software/wget/
PKG_SITES:=		${MASTER_SITE_GNU:=wget/}

include ${TOPDIR}/mk/package.mk

$(eval $(call PKG_template,WGET,${PKG_NAME},${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))

CONFIGURE_STYLE:=	gnu
BUILD_STYLE:=		auto
INSTALL_STYLE:=		auto

post-install:
	${INSTALL_DIR} ${IDIR_WGET}/usr/bin
	${INSTALL_BIN} ${WRKINST}/usr/bin/wget ${IDIR_WGET}/usr/bin

include ${TOPDIR}/mk/pkg-bottom.mk
