# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include ${ADK_TOPDIR}/rules.mk

PKG_NAME:=		log4cxx
PKG_VERSION:=		0.10.0
PKG_RELEASE:=		2
PKG_HASH:=		0de0396220a9566a580166e66b39674cb40efd2176f52ad2c65486c99c920c8c
PKG_DESCR:=		apache logging framework for c++
PKG_SECTION:=		libs/misc
PKG_DEPENDS:=		apr apr-util
PKG_BUILDDEP:=		apr apr-util
PKG_URL:=		http://logging.apache.org/log4cxx/
PKG_SITES:=		http://www.apache.org/dist/logging/log4cxx/0.10.0/
PKG_OPTS:=		dev

DISTFILES:=		apache-${PKG_NAME}-${PKG_VERSION}.tar.gz
WRKDIST=		${WRKDIR}/apache-${PKG_NAME}-${PKG_VERSION}

include ${ADK_TOPDIR}/mk/package.mk

$(eval $(call PKG_template,LOG4CXX,log4cxx,${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION},${PKG_OPTS}))

log4cxx-install:
	${INSTALL_DIR} ${IDIR_LOG4CXX}/usr/lib
	${CP} ${WRKINST}/usr/lib/*.so* ${IDIR_LOG4CXX}/usr/lib

include ${ADK_TOPDIR}/mk/pkg-bottom.mk
