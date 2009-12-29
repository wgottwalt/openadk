# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include ${TOPDIR}/rules.mk

PKG_NAME:=		fontconfig
PKG_VERSION:=		2.8.0
PKG_RELEASE:=		1
PKG_MD5SUM:=		77e15a92006ddc2adbb06f840d591c0e
PKG_DESCR:=		fontconfig
PKG_SECTION:=		libs
PKG_URL:=		http://fontconfig.org
PKG_SITES:=		http://fontconfig.org/release/

ifeq ($(ADK_STATIC),y)
PKG_OPTS:=		libonly
endif

include ${TOPDIR}/mk/package.mk

$(eval $(call PKG_template,FONTCONFIG,${PKG_NAME},${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION},${PKG_OPTS}))

CONFIGURE_STYLE:=	gnu
CONFIGURE_ARGS+=	--with-arch=${ARCH} \
			--disable-docs
BUILD_STYLE:=		auto
INSTALL_STYLE:=		auto

post-install:
	${INSTALL_DIR} ${IDIR_FONTCONFIG}/usr/lib
	${CP} ${WRKINST}/usr/lib/libfontconfig.so* ${IDIR_FONTCONFIG}/usr/lib

include ${TOPDIR}/mk/pkg-bottom.mk
