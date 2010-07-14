# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include ${TOPDIR}/rules.mk

PKG_NAME:=		bison
PKG_VERSION:=		2.4.1
PKG_RELEASE:=		1
PKG_MD5SUM:=		c58aa1da418dc9704070872489e89bf5
PKG_DESCR:=		GNU parser generator
PKG_SECTION:=		lang
PKG_URL:=		http://www.gnu.org/software/bison
PKG_SITES:=		${MASTER_SITE_GNU:=${PKG_NAME}/}

include ${TOPDIR}/mk/package.mk

$(eval $(call PKG_template,BISON,${PKG_NAME},${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))

post-install:
	${INSTALL_DIR} ${IDIR_BISON}/usr/bin ${IDIR_BISON}/usr/share/bison
	${INSTALL_BIN} ${WRKINST}/usr/bin/bison ${IDIR_BISON}/usr/bin
	${CP} ${WRKINST}/usr/share/bison/* ${IDIR_BISON}/usr/share/bison

include ${TOPDIR}/mk/pkg-bottom.mk
