# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include ${TOPDIR}/rules.mk

PKG_NAME:=		flex
PKG_VERSION:=		2.5.35
PKG_RELEASE:=		1
PKG_MD5SUM:=		201d3f38758d95436cbc64903386de0b
PKG_DESCR:=		fast lexical analyzer
PKG_SECTION:=		lang
PKG_URL:=		http://flex.sourceforge.net/
PKG_SITES:=		${MASTER_SITE_SOURCEFORGE:=${PKG_NAME}/}

PKG_SUBPKGS:=		FLEX FLEX_DEV
PKGSD_FLEX_DEV:=	fast lexical analyzer (static library)
PKGSC_FLEX_DEV:=	devel

include ${TOPDIR}/mk/package.mk

$(eval $(call PKG_template,FLEX,flex,${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))
$(eval $(call PKG_template,FLEX_DEV,flex-dev,${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKGSD_FLEX_DEV},${PKGSC_FLEX_DEV}))

flex-install:
	${INSTALL_DIR} ${IDIR_FLEX}/usr/bin
	${INSTALL_BIN} ${WRKINST}/usr/bin/flex ${IDIR_FLEX}/usr/bin

flex-dev-install:
	${INSTALL_DIR} ${IDIR_FLEX_DEV}/usr/lib
	${CP} ${WRKINST}/usr/lib/libfl.a \
		${IDIR_FLEX_DEV}/usr/lib


include ${TOPDIR}/mk/pkg-bottom.mk
