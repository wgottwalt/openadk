# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include ${TOPDIR}/rules.mk

PKG_NAME:=		gperf
PKG_VERSION:=		3.0.4
PKG_RELEASE:=		1
PKG_MD5SUM:=		c1f1db32fb6598d6a93e6e88796a8632
PKG_DESCR:=		perfect hash function generator
PKG_SECTION:=		comp
PKG_URL:=		http://www.gnu.org/software/gperf/
PKG_SITES:=		${MASTER_SITE_GNU:=${PKG_NAME}/}

include ${TOPDIR}/mk/package.mk

$(eval $(call PKG_template,GPERF,${PKG_NAME},${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))

CONFIGURE_STYLE:=	gnu
BUILD_STYLE:=		auto
INSTALL_STYLE:=		auto

post-install:
	${INSTALL_DIR} ${IDIR_GPERF}/usr/bin
	${INSTALL_BIN} ${WRKINST}/usr/bin/gperf ${IDIR_GPERF}/usr/bin

include ${TOPDIR}/mk/pkg-bottom.mk
