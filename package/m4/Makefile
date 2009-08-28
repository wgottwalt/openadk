# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include ${TOPDIR}/rules.mk

PKG_NAME:=		m4
PKG_VERSION:=		1.4.13
PKG_RELEASE:=		1
PKG_MD5SUM:=		e9e36108b5f9855a82ca4a07ebc0fd2e
PKG_DESCR:=		macro processor
PKG_SECTION:=		comp
PKG_URL:=		http://www.gnu.org/software/m4/
PKG_SITES:=		${MASTER_SITE_GNU:=${PKG_NAME}/}

include ${TOPDIR}/mk/package.mk

$(eval $(call PKG_template,M4,${PKG_NAME},${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))

CONFIGURE_STYLE:=	gnu
BUILD_STYLE:=		auto
INSTALL_STYLE:=		auto

post-install:
	${INSTALL_DIR} ${IDIR_M4}/usr/bin
	${INSTALL_BIN} ${WRKINST}/usr/bin/m4 ${IDIR_M4}/usr/bin

include ${TOPDIR}/mk/pkg-bottom.mk
