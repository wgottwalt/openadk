# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include ${ADK_TOPDIR}/rules.mk

PKG_NAME:=		lzo
PKG_VERSION:=		2.08
PKG_RELEASE:=		1
PKG_HASH:=		ac1b3e4dee46febe9fd28737eb7f5692d3232ef1a01da10444394c3d47536614
PKG_DESCR:=		real-time data compression library
PKG_SECTION:=		libs/comp
PKG_URL:=		http://www.oberhumer.com/opensource/lzo
PKG_SITES:=		http://www.oberhumer.com/opensource/lzo/download/
PKG_LIBNAME:=		liblzo
PKG_OPTS:=		dev

DISTFILES:=             ${PKG_NAME}-${PKG_VERSION}.tar.gz

include ${ADK_TOPDIR}/mk/host.mk
include ${ADK_TOPDIR}/mk/package.mk

$(eval $(call HOST_template,LIBLZO,liblzo,${PKG_VERSION}-${PKG_RELEASE}))
$(eval $(call PKG_template,LIBLZO,liblzo,${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION},$(PKG_OPTS)))

AUTOTOOL_STYLE:=	autoreconf
MAKE_FLAGS+=		CFLAGS_O="${TARGET_CFLAGS}"

liblzo-install:
	${INSTALL_DIR} ${IDIR_LIBLZO}/usr/lib
	${CP} ${WRKINST}/usr/lib/liblzo2.so* ${IDIR_LIBLZO}/usr/lib

include ${ADK_TOPDIR}/mk/host-bottom.mk
include ${ADK_TOPDIR}/mk/pkg-bottom.mk
