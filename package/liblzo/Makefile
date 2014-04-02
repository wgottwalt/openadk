# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include ${TOPDIR}/rules.mk

PKG_NAME:=		lzo
PKG_VERSION:=		2.06
PKG_RELEASE:=		1
PKG_MD5SUM:=		95380bd4081f85ef08c5209f4107e9f8
PKG_DESCR:=		a real-time data compression library
PKG_SECTION:=		libs
PKG_URL:=		http://www.oberhumer.com/opensource/lzo
PKG_SITES:=		http://www.oberhumer.com/opensource/lzo/download/
PKG_LIBNAME:=		liblzo
PKG_OPTS:=		dev

ifeq ($(ADK_STATIC),y)
PKG_OPTS+=		libonly
endif

include ${TOPDIR}/mk/host.mk
include ${TOPDIR}/mk/package.mk

$(eval $(call HOST_template,LIBLZO,liblzo,${PKG_VERSION}-${PKG_RELEASE}))
$(eval $(call PKG_template,LIBLZO,liblzo,${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION},$(PKG_OPTS)))

HOST_STYLE:=		auto
CONFIGURE_ARGS+=	--enable-static
MAKE_FLAGS+=		CFLAGS_O="${TARGET_CFLAGS}"

liblzo-install:
	${INSTALL_DIR} ${IDIR_LIBLZO}/usr/lib
	${CP} ${WRKINST}/usr/lib/liblzo2.so* ${IDIR_LIBLZO}/usr/lib

include ${TOPDIR}/mk/host-bottom.mk
include ${TOPDIR}/mk/pkg-bottom.mk
