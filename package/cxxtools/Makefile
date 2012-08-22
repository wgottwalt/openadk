# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include ${TOPDIR}/rules.mk

PKG_NAME:=		cxxtools
PKG_VERSION:=		2.1.1
PKG_RELEASE:=		1
PKG_MD5SUM:=		2026a2bb23b966f13893167b4dbc5d70
PKG_DESCR:=		a collection of general-purpose C++ classes (libraries)
PKG_SECTION:=		libs
PKG_DEPENDS:=		libiconv
PKG_BUILDDEP:=		libiconv
PKG_URL:=		http://www.tntnet.org/
PKG_SITES:=		http://www.tntnet.org/download/
PKG_NEED_CXX:=		1
PKG_CXX:=		CXXTOOLS

PKG_ARCH_DEPENDS:=	!arm !avr32

PKG_SUBPKGS:=		CXXTOOLS CXXTOOLS_DEV
PKGSC_CXXTOOLS_DEV:=	devel
PKGSD_CXXTOOLS_DEV:=	a collection of general-purpose C++ classes (headers)

include ${TOPDIR}/mk/package.mk

$(eval $(call PKG_template,CXXTOOLS,${PKG_NAME},${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))
$(eval $(call PKG_template,CXXTOOLS_DEV,${PKG_NAME}-dev,${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))

TARGET_CFLAGS:=         $(filter-out -flto,$(TARGET_CFLAGS))
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

cxxtools-dev-install:
	${INSTALL_DIR} ${IDIR_CXXTOOLS_DEV}/usr/include
	${CP} ${WRKINST}/usr/include/* \
		${IDIR_CXXTOOLS_DEV}/usr/include
	${INSTALL_DIR} ${IDIR_CXXTOOLS_DEV}/usr/bin
	${CP} ${WRKINST}/usr/bin/cxxtools-config ${IDIR_CXXTOOLS_DEV}/usr/bin

include ${TOPDIR}/mk/pkg-bottom.mk
