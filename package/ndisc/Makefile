# $Id$
#-
# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include ${TOPDIR}/rules.mk

PKG_NAME:=		ndisc6
PKG_VERSION:=		0.9.8
PKG_RELEASE:=		1
PKG_MD5SUM:=		cb8d70564b8d40aae95e19592c6be183
MASTER_SITES:=		http://www.remlab.net/files/ndisc6/
DISTFILES:=		${PKG_NAME}-${PKG_VERSION}.tar.bz2

include ${TOPDIR}/mk/package.mk

$(eval $(call PKG_template,NDISC6,ndisc6,${PKG_VERSION}-${PKG_RELEASE}))
$(eval $(call PKG_template,RDISC6,rdisc6,${PKG_VERSION}-${PKG_RELEASE}))
$(eval $(call PKG_template,TCPTRACEROUTE6,tcptraceroute6,${PKG_VERSION}-${PKG_RELEASE}))

CONFIGURE_STYLE:=	gnu
BUILD_STYLE:=		auto
INSTALL_STYLE:=		auto
MAKE_FLAGS+=		CC="${TARGET_CC}"
TCLFAGS+=		-std=c99

post-install:
	${INSTALL_DIR} ${IDIR_NDISC6}/usr/bin
	${INSTALL_BIN} ${WRKINST}/usr/bin/ndisc6 ${IDIR_NDISC6}/usr/bin/
	${INSTALL_DIR} ${IDIR_RDISC6}/usr/bin
	${INSTALL_BIN} ${WRKINST}//usr/bin/rdisc6 ${IDIR_RDISC6}/usr/bin/
	${INSTALL_DIR} ${IDIR_TCPTRACEROUTE6}/usr/bin
	${INSTALL_BIN} ${WRKINST}/usr/bin/tcptraceroute6 ${IDIR_TCPTRACEROUTE6}/usr/bin/

include ${TOPDIR}/mk/pkg-bottom.mk
