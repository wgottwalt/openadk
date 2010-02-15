# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include ${TOPDIR}/rules.mk

PKG_NAME:=		automake
PKG_VERSION:=		1.10
PKG_RELEASE:=		2
PKG_MD5SUM:=		452163c32d061c53a7acc0e8c1b689ba
PKG_DESCR:=		GNU automake
PKG_SECTION:=		utils
PKG_DEPENDS:=		microperl
PKG_URL:=		http://www.gnu.org/software/automake/
PKG_SITES:=		${MASTER_SITE_GNU:=${PKG_NAME}/}
PKG_OPTS:=		noscripts

include ${TOPDIR}/mk/package.mk

$(eval $(call PKG_template,AUTOMAKE,${PKG_NAME},${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION},${PKG_OPTS}))

post-install:
	${INSTALL_DIR} ${IDIR_AUTOMAKE}/usr/bin
	${INSTALL_BIN} ${WRKINST}/usr/bin/automake ${IDIR_AUTOMAKE}/usr/bin
	${INSTALL_BIN} ${WRKINST}/usr/bin/aclocal ${IDIR_AUTOMAKE}/usr/bin
	${INSTALL_DIR} ${IDIR_AUTOMAKE}/usr/share/automake-${PKG_VERSION}/
	${CP} ${WRKINST}/usr/share/automake-${PKG_VERSION}/Automake \
		${IDIR_AUTOMAKE}/usr/share/automake-${PKG_VERSION}/

include ${TOPDIR}/mk/pkg-bottom.mk
