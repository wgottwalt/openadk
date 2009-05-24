# $Id$
#-
# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include ${TOPDIR}/rules.mk

PKG_NAME:=		id3lib
PKG_VERSION:=		3.8.3
PKG_RELEASE:=		1
PKG_MD5SUM:=		19f27ddd2dda4b2d26a559a4f0f402a7
MASTER_SITES:=		${MASTER_SITE_SOURCEFORGE:=id3lib/}

PKG_DEPENDS:=		zlib libiconv
ifeq ($(ADK_COMPILE_ID3LIB_WITH_UCLIBCXX),y)
PKG_DEPENDS+=		uclibc++
else
PKG_DEPENDS+=		libstdcxx
endif

include ${TOPDIR}/mk/package.mk

$(eval $(call PKG_template,ID3LIB,id3lib,${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS}))

CONFIGURE_STYLE:=	gnu
CONFIGURE_ARGS+=	--enable-cxx-warnings=no
BUILD_STYLE:=		auto
INSTALL_STYLE:=		auto

ifeq ($(ADK_COMPILE_ID3LIB_WITH_UCLIBCXX),y)
TCXXFLAGS+=		-fno-builtin -fno-rtti -nostdinc++ \
			-I${STAGING_DIR}/usr/include/uClibc++
CONFIGURE_ENV+=		LIBS="-nodefaultlibs -luClibc++ -lz -lm -lc"
else
TLDFLAGS+=		-shared
endif

post-install:
	${INSTALL_DIR} ${IDIR_ID3LIB}/usr/lib
	${CP} ${WRKINST}/usr/lib/libid3-*.so.* ${IDIR_ID3LIB}/usr/lib/

include ${TOPDIR}/mk/pkg-bottom.mk
