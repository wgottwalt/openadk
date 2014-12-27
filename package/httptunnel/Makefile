# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include ${ADK_TOPDIR}/rules.mk

PKG_NAME:=		httptunnel
PKG_VERSION:=		3.0.5
PKG_RELEASE:=		1
PKG_HASH:=		0d4c3b276f47c06fc39f77e45babef1b3ede53512928c7a59ad0dd795ef0e617
PKG_DESCR:=		http tunneling software
PKG_SECTION:=		net/security
PKG_URL:=		http://www.nocrew.org/software/httptunnel/
PKG_SITES:=		http://www.nocrew.org/software/httptunnel/

DISTFILES:=		${PKG_NAME}-${PKG_VERSION}.tar.gz

include ${ADK_TOPDIR}/mk/package.mk

$(eval $(call PKG_template,HTTPTUNNEL,httptunnel,${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))

httptunnel-install:
	${INSTALL_DIR} ${IDIR_HTTPTUNNEL}/usr/bin
	${INSTALL_BIN} ${WRKINST}/usr/bin/hts ${IDIR_HTTPTUNNEL}/usr/bin/
	${INSTALL_BIN} ${WRKINST}/usr/bin/htc ${IDIR_HTTPTUNNEL}/usr/bin/

include ${ADK_TOPDIR}/mk/pkg-bottom.mk
