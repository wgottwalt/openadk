# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include ${TOPDIR}/rules.mk

PKG_NAME:=		freetype
PKG_VERSION:=		2.4.4
PKG_RELEASE:=		1
PKG_MD5SUM:=		9273efacffb683483e58a9e113efae9f
PKG_DESCR:=		A free, high-quality and portable font engine
PKG_SECTION:=		libs
PKG_DEPENDS:=		zlib
PKG_BUILDDEP:=		zlib
PKG_URL:=		http://www.freetype.org/
PKG_SITES:=		${MASTER_SITE_SOURCEFORGE:=freetype/}
PKG_LIBNAME:=		libfreetype
PKG_OPTS:=		dev

ifeq ($(ADK_STATIC),y)
PKG_OPTS+=		libonly
endif

include ${TOPDIR}/mk/package.mk

$(eval $(call PKG_template,LIBFREETYPE,libfreetype,${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION},${PKG_OPTS}))

libfreetype-install:
	${INSTALL_DIR} ${IDIR_LIBFREETYPE}/usr/lib
	${CP} ${WRKINST}/usr/lib/libfreetype.so* ${IDIR_LIBFREETYPE}/usr/lib

include ${TOPDIR}/mk/pkg-bottom.mk
