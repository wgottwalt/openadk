# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include ${TOPDIR}/rules.mk

PKG_NAME:=		cxxtools
PKG_VERSION:=		2.2.1
PKG_RELEASE:=		1
PKG_MD5SUM:=		aab00068ae5237435b37ac86f2ac7576
PKG_DESCR:=		collection of general-purpose C++ classes
PKG_SECTION:=		libs
PKG_BUILDDEP:=		libiconv-tiny
PKG_URL:=		http://www.tntnet.org/
PKG_SITES:=		http://www.tntnet.org/download/
PKG_NEED_CXX:=		1
PKG_CXX:=		CXXTOOLS
PKG_OPTS:=		dev

DISTFILES:=		${PKG_NAME}-${PKG_VERSION}.tar.gz

include ${TOPDIR}/mk/package.mk

$(eval $(call PKG_template,CXXTOOLS,cxxtools,${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION},${PKG_OPTS}))

ifeq (${ADK_COMPILE_CXXTOOLS_WITH_UCLIBCXX},y)
TARGET_CXXFLAGS+=	-fno-builtin -nostdinc++ \
			-I${STAGING_TARGET_DIR}/usr/include/uClibc++ -Wl,-E
TARGET_LDFLAGS+=	-luClibc++ -liconv -lm -lc -nodefaultlibs -shared
else
TARGET_LDFLAGS+=	-liconv -shared
endif

TARGET_CFLAGS+=		-fPIC
TARGET_CXXFLAGS+=	-fPIC
CONFIGURE_ARGS+=	--with-libiconv-prefix='${STAGING_TARGET_DIR}/usr' \
			--disable-demos --disable-unittest

cxxtools-install:
	${INSTALL_DIR} ${IDIR_CXXTOOLS}/usr/lib
	${CP} ${WRKINST}/usr/lib/libcxxtools.so* ${IDIR_CXXTOOLS}/usr/lib

include ${TOPDIR}/mk/pkg-bottom.mk
