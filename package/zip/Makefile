# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include ${TOPDIR}/rules.mk

PKG_NAME:=		zip
PKG_VERSION:=		3.0
PKG_RELEASE:=		1
PKG_MD5SUM:=		7b74551e63f8ee6aab6fbc86676c0d37
PKG_DESCR:=		zip compression utility
PKG_SECTION:=		archive
PKG_URL:=		http://www.info-zip.org/Zip.html
PKG_SITES:=		ftp://ftp.info-zip.org/pub/infozip/src/

WRKDIST=		$(WRKDIR)/$(PKG_NAME)30
DISTFILES:=		$(PKG_NAME)30.tgz

include ${TOPDIR}/mk/package.mk

$(eval $(call PKG_template,ZIP,zip,${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))

CONFIG_STYLE:=		minimal
INSTALL_STYLE:=		manual

XAKE_FLAGS+=		GCC_HONOUR_COPTS=s
CONFIGURE_PROG:=	unix/configure
MAKE_FILE:=		unix/Makefile
ALL_TARGET:=		generic_gcc

zip-install:
	${INSTALL_DIR} ${IDIR_ZIP}/usr/bin
	${CP} ${WRKBUILD}/zip ${IDIR_ZIP}/usr/bin

include ${TOPDIR}/mk/pkg-bottom.mk
