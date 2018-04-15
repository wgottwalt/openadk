# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include ${ADK_TOPDIR}/rules.mk

PKG_NAME:=		cxxtools
PKG_VERSION:=		2.2.1
PKG_RELEASE:=		2
PKG_HASH:=		8cebb6d6cda7c93cc4f7c0d552a68d50dd5530b699cf87916bb3b708fdc4e342
PKG_DESCR:=		collection of general-purpose c++ classes
PKG_NEEDS:=		c++
PKG_SECTION:=		libs/misc
PKG_URL:=		http://www.tntnet.org/
PKG_SITES:=		http://www.tntnet.org/download/
PKG_OPTS:=		dev

DISTFILES:=		${PKG_NAME}-${PKG_VERSION}.tar.gz

include ${ADK_TOPDIR}/mk/package.mk

$(eval $(call PKG_template,CXXTOOLS,cxxtools,${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION},${PKG_OPTS}))

ifeq ($(ADK_TARGET_ARCH_XTENSA),y)
CONFIGURE_ARGS+=	--with-atomictype=generic
endif
ifeq ($(ADK_TARGET_SYSTEM_RASPBERRY_PI3),y)
CONFIGURE_ARGS+=	--with-atomictype=pthread
endif
ifeq ($(ADK_TARGET_SYSTEM_RASPBERRY_PI3P),y)
CONFIGURE_ARGS+=	--with-atomictype=pthread
endif
CONFIGURE_ARGS+=	--disable-demos \
			--disable-unittest

cxxtools-install:
	${INSTALL_DIR} ${IDIR_CXXTOOLS}/usr/lib
	${CP} ${WRKINST}/usr/lib/libcxxtools.so* ${IDIR_CXXTOOLS}/usr/lib

include ${ADK_TOPDIR}/mk/pkg-bottom.mk
