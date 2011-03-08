# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include ${TOPDIR}/rules.mk

PKG_NAME:=		m4
PKG_VERSION:=		1.4.16
PKG_RELEASE:=		1
PKG_MD5SUM:=		a5dfb4f2b7370e9d34293d23fd09b280
PKG_DESCR:=		macro processor
PKG_SECTION:=		lang
PKG_URL:=		http://www.gnu.org/software/m4/
PKG_SITES:=		${MASTER_SITE_GNU:=m4/}

include ${TOPDIR}/mk/package.mk

$(eval $(call PKG_template,M4,m4,${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))

m4-install:
	${INSTALL_DIR} ${IDIR_M4}/usr/bin
	${INSTALL_BIN} ${WRKINST}/usr/bin/m4 ${IDIR_M4}/usr/bin

include ${TOPDIR}/mk/pkg-bottom.mk
