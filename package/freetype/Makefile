# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include ${TOPDIR}/rules.mk

PKG_NAME:=		freetype
PKG_VERSION:=		2.5.1
PKG_RELEASE:=		1
PKG_MD5SUM:=		a359993ad0dc23323c676b04fdb57110
PKG_DESCR:=		A free, high-quality and portable font engine
PKG_SECTION:=		libs
PKG_DEPENDS:=		zlib
PKG_BUILDDEP:=		zlib freetype-host
PKG_URL:=		http://www.freetype.org/
PKG_SITES:=		${MASTER_SITE_SOURCEFORGE:=freetype/}
PKG_LIBNAME:=		libfreetype
PKG_OPTS:=		dev

ifeq ($(ADK_STATIC),y)
PKG_OPTS+=		libonly
endif

include ${TOPDIR}/mk/host.mk
include ${TOPDIR}/mk/package.mk

$(eval $(call HOST_template,LIBFREETYPE,libfreetype,${PKG_VERSION}-${PKG_RELEASE}))
$(eval $(call PKG_template,LIBFREETYPE,libfreetype,${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION},${PKG_OPTS}))

HOST_STYLE:=		auto
HOST_CONFIGURE_ARGS+=	--without-png
CONFIGURE_ARGS+=	--without-png

libfreetype-install:
	${INSTALL_DIR} ${IDIR_LIBFREETYPE}/usr/lib
	${CP} ${WRKINST}/usr/lib/libfreetype.so* ${IDIR_LIBFREETYPE}/usr/lib

include ${TOPDIR}/mk/host-bottom.mk
include ${TOPDIR}/mk/pkg-bottom.mk
