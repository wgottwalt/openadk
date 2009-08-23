# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include ${TOPDIR}/rules.mk

PKG_NAME:=		libpri
PKG_VERSION:=		1.4.10.1
PKG_RELEASE:=		1
PKG_MD5SUM:=		55ce81cd0b2cf0c40e287fc5bd5b4883
PKG_DESCR:=		C implementation of the Primary Rate ISDN specification
PKG_SECTION:=		libs
PKG_URL:=		http://www.asterisk.org
PKG_SITES:=		http://downloads.asterisk.org/pub/telephony/libpri/releases/

include ${TOPDIR}/mk/package.mk

$(eval $(call PKG_template,LIBPRI,${PKG_NAME},${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))

BUILD_STYLE:=		auto
MAKE_FLAGS+=		CC='${TARGET_CC}' LDCONFIG=''
FAKE_FLAGS+=		INSTALL_BASE=/usr
INSTALL_STYLE:=		auto

post-install:
	${INSTALL_DIR} ${IDIR_LIBPRI}/usr/lib
	${CP} ${WRKINST}/usr/lib/libpri.so.* ${IDIR_LIBPRI}/usr/lib

include ${TOPDIR}/mk/pkg-bottom.mk
