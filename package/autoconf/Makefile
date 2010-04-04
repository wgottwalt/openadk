# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include ${TOPDIR}/rules.mk

PKG_NAME:=		autoconf
<<<<<<< HEAD
PKG_VERSION:=		2.64
PKG_RELEASE:=		2
PKG_MD5SUM:=		30a198cef839471dd4926e92ab485361
=======
PKG_VERSION:=		2.65
PKG_RELEASE:=		1
PKG_MD5SUM:=		46cfb40e0babf4c64f8325f03da81c9b
>>>>>>> 4d569ed1a3305c7b7abe8fa4273cea3b559cc85a
PKG_DESCR:=		GNU autoconf
PKG_SECTION:=		utils
PKG_URL:=		http://www.gnu.org/software/autoconf/
PKG_SITES:=		${MASTER_SITE_GNU:=autoconf/}
PKG_OPTS:=		noscripts

include ${TOPDIR}/mk/package.mk

$(eval $(call PKG_template,AUTOCONF,${PKG_NAME},${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION},${PKG_OPTS}))

post-install:
	${INSTALL_DIR} ${IDIR_AUTOCONF}/usr/bin
	${INSTALL_DIR} ${IDIR_AUTOCONF}/usr/share/autoconf
	${CP} ${WRKINST}/usr/bin/auto* ${IDIR_AUTOCONF}/usr/bin
	${CP} ${WRKINST}/usr/share/autoconf/* \
		${IDIR_AUTOCONF}/usr/share/autoconf

include ${TOPDIR}/mk/pkg-bottom.mk
