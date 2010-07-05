# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include ${TOPDIR}/rules.mk

PKG_NAME:=		uClibc++
PKG_VERSION:=		0.2.2
PKG_RELEASE:=		1
PKG_MD5SUM:=		1ceef3209cca88be8f1bd9de99735954
PKG_DESCR:=		A standard c++ library for embedded systems
PKG_SECTION:=		libs
PKG_URL:=		http://cxx.uclibc.org
PKG_SITES:=		http://cxx.uclibc.org/src/

DISTFILES:=		${PKG_NAME}-${PKG_VERSION}.tar.bz2

CFLINE_UCLIBCXX:= 	depends on ADK_TARGET_LIB_UCLIBC

include ${TOPDIR}/mk/package.mk

$(eval $(call PKG_template,UCLIBCXX,uclibc++,${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))

CONFIG_STYLE:=          manual
INSTALL_STYLE:=         manual

MAKE_FLAGS+=		TOPDIR="${WRKBUILD}/" \
			${TARGET_CONFIGURE_OPTS} \
			ARCH_CFLAGS="${TARGET_CFLAGS}" \
			CROSS="${TARGET_CROSS}"
TARGET_CONFIGURE_OPTS=

do-configure:
	${CP} ./files/config ${WRKBUILD}/.config

do-install:
	${INSTALL_DIR} ${IDIR_UCLIBCXX}/usr/lib
	${CP} ${WRKBUILD}/src/libuClibc++*.so* ${IDIR_UCLIBCXX}/usr/lib/
	${INSTALL_DIR} ${WRKINST}/usr/include
	${CP} ${WRKBUILD}/include ${WRKINST}/usr/include/uClibc++

include ${TOPDIR}/mk/pkg-bottom.mk
