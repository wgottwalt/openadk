# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include ${ADK_TOPDIR}/rules.mk

PKG_NAME:=		uclibc++
PKG_VERSION:=		0.2.4
PKG_RELEASE:=		3
PKG_HASH:=		be16fc6a6eb2e59df420ee41e7042f38e27ebaf5c2762d90e75803364a7b00db
PKG_DESCR:=		standard c++ library for embedded systems
PKG_SECTION:=		libs/misc
PKG_URL:=		http://cxx.uclibc.org/
PKG_SITES:=		http://cxx.uclibc.org/src/
PKG_NOPARALLEL:=	1
PKG_LIBNAME:=		uclibc++
PKG_OPTS:=		dev

DISTFILES:=		uClibc++-${PKG_VERSION}.tar.bz2
WRKDIST=		${WRKDIR}/uClibc++-${PKG_VERSION}

PKG_LIBC_DEPENDS:=	uclibc-ng

include ${ADK_TOPDIR}/mk/package.mk

$(eval $(call PKG_template,UCLIBCXX,uclibc++,${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION},${PKG_OPTS}))

CONFIG_STYLE:=          manual
INSTALL_STYLE:=         manual

MAKE_FLAGS+=		ADK_TOPDIR="${WRKBUILD}/" \
			${TARGET_CONFIGURE_OPTS} \
			ARCH_CFLAGS="${TARGET_CFLAGS} -lgcc_s" \
			CROSS="${TARGET_CROSS}"
TARGET_CONFIGURE_OPTS=

do-configure:
	${CP} ./files/config ${WRKBUILD}/.config

do-install:
	${INSTALL_DIR} ${IDIR_UCLIBCXX}/usr/lib
	${CP} ${WRKBUILD}/src/libuClibc++*.so* ${IDIR_UCLIBCXX}/usr/lib/
	${INSTALL_DIR} ${WRKINST}/usr/include
	${CP} ${WRKBUILD}/include ${WRKINST}/usr/include/uClibc++

include ${ADK_TOPDIR}/mk/pkg-bottom.mk
