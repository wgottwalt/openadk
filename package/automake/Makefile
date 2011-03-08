# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include ${TOPDIR}/rules.mk

PKG_NAME:=		automake
PKG_VERSION:=		1.11.1
PKG_RELEASE:=		1
PKG_EXTRAVER:=		1.11
PKG_MD5SUM:=		4ee7f0ff5f0e467d58b6bd5da96b1c74
PKG_DESCR:=		GNU automake
PKG_SECTION:=		lang
PKG_DEPENDS:=		microperl
PKG_URL:=		http://www.gnu.org/software/automake/
PKG_SITES:=		${MASTER_SITE_GNU:=${PKG_NAME}/}
PKG_OPTS:=		noscripts

include ${TOPDIR}/mk/package.mk

$(eval $(call PKG_template,AUTOMAKE,automake,${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION},${PKG_OPTS}))

XAKE_FLAGS+=		PERL="/usr/bin/perl"

automake-install:
	${INSTALL_DIR} ${IDIR_AUTOMAKE}/usr/bin
	${INSTALL_BIN} ${WRKINST}/usr/bin/automake ${IDIR_AUTOMAKE}/usr/bin
	${INSTALL_BIN} ${WRKINST}/usr/bin/aclocal ${IDIR_AUTOMAKE}/usr/bin
	${INSTALL_DIR} ${IDIR_AUTOMAKE}/usr/share/automake-${PKG_EXTRAVER}/
	${CP} ${WRKINST}/usr/share/automake-${PKG_EXTRAVER}/Automake \
		${IDIR_AUTOMAKE}/usr/share/automake-${PKG_EXTRAVER}/

include ${TOPDIR}/mk/pkg-bottom.mk
