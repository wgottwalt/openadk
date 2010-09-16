# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include ${TOPDIR}/rules.mk

PKG_NAME:=		libpri
PKG_VERSION:=		1.4.10.2
PKG_RELEASE:=		1
PKG_MD5SUM:=		dc1523d8ee027cd62f20fc6cc9727489
PKG_DESCR:=		C implementation of the Primary Rate ISDN specification
PKG_SECTION:=		libs
PKG_URL:=		http://www.asterisk.org/
PKG_SITES:=		http://downloads.asterisk.org/pub/telephony/libpri/releases/

include ${TOPDIR}/mk/package.mk

$(eval $(call PKG_template,LIBPRI,${PKG_NAME},${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))

CONFIG_STYLE:=		manual

MAKE_FLAGS+=		CC='${TARGET_CC}' LDCONFIG=''
FAKE_FLAGS+=		INSTALL_BASE=/usr

post-install:
	${INSTALL_DIR} ${IDIR_LIBPRI}/usr/lib
	${CP} ${WRKINST}/usr/lib/libpri.so* ${IDIR_LIBPRI}/usr/lib

include ${TOPDIR}/mk/pkg-bottom.mk
