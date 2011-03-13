# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include ${TOPDIR}/rules.mk

PKG_NAME:=		autoconf
PKG_VERSION:=		2.68
PKG_RELEASE:=		1
PKG_MD5SUM:=		c3b5247592ce694f7097873aa07d66fe
PKG_DESCR:=		GNU autoconf
PKG_SECTION:=		lang
PKG_URL:=		http://www.gnu.org/software/autoconf/
PKG_SITES:=		${MASTER_SITE_GNU:=autoconf/}
PKG_OPTS:=		noscripts

include ${TOPDIR}/mk/package.mk

$(eval $(call PKG_template,AUTOCONF,autoconf,${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION},${PKG_OPTS}))

XAKE_FLAGS+=		PERL="/usr/bin/perl" \
			M4="/usr/bin/m4"

autoconf-install:
	${INSTALL_DIR} ${IDIR_AUTOCONF}/usr/bin
	${INSTALL_DIR} ${IDIR_AUTOCONF}/usr/share/autoconf
	${CP} ${WRKINST}/usr/bin/auto* ${IDIR_AUTOCONF}/usr/bin
	${CP} ${WRKINST}/usr/share/autoconf/* \
		${IDIR_AUTOCONF}/usr/share/autoconf

include ${TOPDIR}/mk/pkg-bottom.mk
