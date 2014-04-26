# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include ${TOPDIR}/rules.mk

PKG_NAME:=		httptunnel
PKG_VERSION:=		3.0.5
PKG_RELEASE:=		1
PKG_MD5SUM:=		2a710f377c82ab4eb201458f7b9f99c5
PKG_DESCR:=		http tunneling software
PKG_SECTION:=		net/security
PKG_URL:=		http://www.nocrew.org/software/httptunnel/
PKG_SITES:=		http://www.nocrew.org/software/httptunnel/

DISTFILES:=		${PKG_NAME}-${PKG_VERSION}.tar.gz

include ${TOPDIR}/mk/package.mk

$(eval $(call PKG_template,HTTPTUNNEL,httptunnel,${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))

httptunnel-install:
	${INSTALL_DIR} ${IDIR_HTTPTUNNEL}/usr/bin
	${INSTALL_BIN} ${WRKINST}/usr/bin/hts ${IDIR_HTTPTUNNEL}/usr/bin/
	${INSTALL_BIN} ${WRKINST}/usr/bin/htc ${IDIR_HTTPTUNNEL}/usr/bin/

include ${TOPDIR}/mk/pkg-bottom.mk
