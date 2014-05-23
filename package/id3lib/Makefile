# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include ${TOPDIR}/rules.mk

PKG_NAME:=		id3lib
PKG_VERSION:=		3.8.3
PKG_RELEASE:=		2
PKG_MD5SUM:=		19f27ddd2dda4b2d26a559a4f0f402a7
PKG_DESCR:=		An ID3v1/ID3v2 tagging library
PKG_SECTION:=		libs
PKG_DEPENDS:=		zlib
PKG_BUILDDEP:=		zlib libiconv-tiny
PKG_URL:=		http://id3lib.sourceforge.net/
PKG_SITES:=		${MASTER_SITE_SOURCEFORGE:=id3lib/}
PKG_NEED_CXX:=		1
PKG_CXX:=		ID3LIB
PKG_OPTS:=		dev

DISTFILES:=		${PKG_NAME}-${PKG_VERSION}.tar.gz

include ${TOPDIR}/mk/package.mk

$(eval $(call PKG_template,ID3LIB,id3lib,${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION},${PKG_OPTS}))

TARGET_CFLAGS+=		-fPIC
CONFIGURE_ARGS+=	--enable-cxx-warnings=no

ifeq ($(ADK_COMPILE_ID3LIB_WITH_UCLIBCXX),y)
LIBRARIES:=-nodefaultlibs -luClibc++ -lz -lm -lc
endif

ifeq ($(ADK_TARGET_USE_SSP),y)
LIBRARIES+=-lssp -fstack-protector
endif

ifeq ($(ADK_COMPILE_ID3LIB_WITH_UCLIBCXX),y)
TARGET_CXXFLAGS+=	-fno-builtin -fno-rtti -nostdinc++ \
			-I${STAGING_TARGET_DIR}/usr/include/uClibc++
CONFIGURE_ENV+=		LIBS="${LIBRARIES}"
else
TARGET_LDFLAGS+=	-shared
endif

id3lib-install:
	${INSTALL_DIR} ${IDIR_ID3LIB}/usr/lib
	${CP} ${WRKINST}/usr/lib/libid3-*.so* ${IDIR_ID3LIB}/usr/lib/

include ${TOPDIR}/mk/pkg-bottom.mk
