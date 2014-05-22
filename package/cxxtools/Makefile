# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include ${TOPDIR}/rules.mk

PKG_NAME:=		cxxtools
PKG_VERSION:=		2.2.1
PKG_RELEASE:=		2
PKG_MD5SUM:=		aab00068ae5237435b37ac86f2ac7576
PKG_DESCR:=		collection of general-purpose C++ classes
PKG_SECTION:=		libs
PKG_URL:=		http://www.tntnet.org/
PKG_SITES:=		http://www.tntnet.org/download/
PKG_NEED_CXX:=		1
PKG_OPTS:=		dev

DISTFILES:=		${PKG_NAME}-${PKG_VERSION}.tar.gz

include ${TOPDIR}/mk/package.mk

$(eval $(call PKG_template,CXXTOOLS,cxxtools,${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION},${PKG_OPTS}))

CONFIGURE_ARGS+=	--disable-demos \
			--disable-unittest

cxxtools-install:
	${INSTALL_DIR} ${IDIR_CXXTOOLS}/usr/lib
	${CP} ${WRKINST}/usr/lib/libcxxtools.so* ${IDIR_CXXTOOLS}/usr/lib

include ${TOPDIR}/mk/pkg-bottom.mk
