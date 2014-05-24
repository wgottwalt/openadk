# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include ${TOPDIR}/rules.mk

PKG_NAME:=		diffutils
PKG_VERSION:=		2.8.1
PKG_RELEASE:=		1
PKG_MD5SUM:=		71f9c5ae19b60608f6c7f162da86a428
PKG_DESCR:=		show differences between two files
PKG_SECTION:=		lang
PKG_URL:=		http://www.gnu.org/software/diffutils/
PKG_SITES:=		${MASTER_SITE_GNU:=${PKG_NAME}/}
PKG_BB:=		1

DISTFILES:=		${PKG_NAME}-${PKG_VERSION}.tar.gz

include ${TOPDIR}/mk/package.mk

$(eval $(call PKG_template,DIFFUTILS,diffutils,${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))

CONFIGURE_ENV+=		ac_use_included_regex=no

diffutils-install:
	${INSTALL_DIR} ${IDIR_DIFFUTILS}/usr/bin
	${INSTALL_BIN} ${WRKINST}/usr/bin/diff ${IDIR_DIFFUTILS}/usr/bin

include ${TOPDIR}/mk/pkg-bottom.mk
