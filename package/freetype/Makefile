# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include ${TOPDIR}/rules.mk

PKG_NAME:=		freetype
PKG_VERSION:=		2.3.11
PKG_RELEASE:=		2
PKG_MD5SUM:=		a693c9a4b0121890ca71e39364ffea4a
PKG_DESCR:=		A free, high-quality and portable font engine
PKG_SECTION:=		libs
PKG_DEPENDS:=		zlib
PKG_BUILDDEP+=		zlib
PKG_URL:=		http://www.freetype.org
PKG_SITES:=		${MASTER_SITE_SOURCEFORGE:=freetype/}

ifeq ($(ADK_STATIC),y)
PKG_OPTS:=		libonly
endif

include ${TOPDIR}/mk/package.mk

$(eval $(call PKG_template,LIBFREETYPE,libfreetype,${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION},${PKG_OPTS}))

CONFIGURE_STYLE:=	gnu
BUILD_STYLE:=		auto
INSTALL_STYLE:=		auto

post-install:
	${INSTALL_DIR} ${IDIR_LIBFREETYPE}/usr/lib
	${CP} ${WRKINST}/usr/lib/libfreetype.so.* ${IDIR_LIBFREETYPE}/usr/lib/

include ${TOPDIR}/mk/pkg-bottom.mk
