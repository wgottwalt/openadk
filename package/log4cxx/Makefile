# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include ${TOPDIR}/rules.mk

PKG_NAME:=		log4cxx
PKG_VERSION:=		0.10.0
PKG_RELEASE:=		1
PKG_MD5SUM:=		b30ffb8da3665178e68940ff7a61084c
PKG_DESCR:=		Apache logging framework for C++
PKG_SECTION:=		libs
PKG_DEPENDS:=		apr apr-util
PKG_BUILDDEP:=		apr apr-util
PKG_URL:=		http://logging.apache.org/log4cxx/
PKG_SITES:=		http://www.apache.org/dist/logging/log4cxx/0.10.0/

DISTFILES:=		apache-${PKG_NAME}-${PKG_VERSION}.tar.gz
WRKDIST=		${WRKDIR}/apache-${PKG_NAME}-${PKG_VERSION}

PKG_ARCH_DEPENDS:=	!cris

PKG_SUBPKGS:=		LOG4CXX LOG4CXX_DEV
PKGSD_LOG4CXX_DEV:=	log4cxx development headers
PKGSC_LOG4CXX_DEV:=	devel

include ${TOPDIR}/mk/package.mk

$(eval $(call PKG_template,LOG4CXX,${PKG_NAME},${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))
$(eval $(call PKG_template,LOG4CXX_DEV,${PKG_NAME}_dev,${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKGSD_LOG4CXX_DEV},${PKGSC_LOG4CXX_DEV}))

log4cxx-install:
	${INSTALL_DIR} ${IDIR_LOG4CXX}/usr/lib
	${CP} ${WRKINST}/usr/lib/*.a ${IDIR_LOG4CXX}/usr/lib
	${CP} ${WRKINST}/usr/lib/*.so* ${IDIR_LOG4CXX}/usr/lib

log4cxx_dev-install:
	${INSTALL_DIR} ${IDIR_LOG4CXX_DEV}/usr/include
	${CP} ${WRKINST}/usr/include/* ${IDIR_LOG4CXX_DEV}/usr/include

include ${TOPDIR}/mk/pkg-bottom.mk
