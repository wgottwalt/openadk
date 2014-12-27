# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include ${ADK_TOPDIR}/rules.mk

PKG_NAME:=		diffutils
PKG_VERSION:=		2.8.1
PKG_RELEASE:=		1
PKG_HASH:=		c5001748b069224dd98bf1bb9ee877321c7de8b332c8aad5af3e2a7372d23f5a
PKG_DESCR:=		show differences between two files
PKG_SECTION:=		sys/utils
PKG_URL:=		http://www.gnu.org/software/diffutils/
PKG_SITES:=		${MASTER_SITE_GNU:=${PKG_NAME}/}
PKG_BB:=		1

DISTFILES:=		${PKG_NAME}-${PKG_VERSION}.tar.gz

include ${ADK_TOPDIR}/mk/package.mk

$(eval $(call PKG_template,DIFFUTILS,diffutils,${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))

CONFIGURE_ENV+=		ac_use_included_regex=no

diffutils-install:
	${INSTALL_DIR} ${IDIR_DIFFUTILS}/usr/bin
	${INSTALL_BIN} ${WRKINST}/usr/bin/diff ${IDIR_DIFFUTILS}/usr/bin

include ${ADK_TOPDIR}/mk/pkg-bottom.mk
