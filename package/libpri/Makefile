# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include ${TOPDIR}/rules.mk

PKG_NAME:=		libpri
PKG_VERSION:=		1.4.12
PKG_RELEASE:=		2
PKG_MD5SUM:=		9de39b866f049cc20a4f431cc6245166
PKG_DESCR:=		c implementation of the primary rate isdn specification
PKG_SECTION:=		libs/misc
PKG_URL:=		http://www.asterisk.org/
PKG_SITES:=		http://downloads.asterisk.org/pub/telephony/libpri/releases/
PKG_OPTS:=		dev

DISTFILES:=		${PKG_NAME}-${PKG_VERSION}.tar.gz

include ${TOPDIR}/mk/package.mk

$(eval $(call PKG_template,LIBPRI,libpri,${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION},${PKG_OPTS}))

CONFIG_STYLE:=		manual

MAKE_FLAGS+=		CC='${TARGET_CC}' LDCONFIG='' ARCH=$(ADK_TARGET_ARCH)
FAKE_FLAGS+=		INSTALL_BASE=/usr

libpri-install:
	${INSTALL_DIR} ${IDIR_LIBPRI}/usr/lib
	${CP} ${WRKINST}/usr/lib/libpri.so* ${IDIR_LIBPRI}/usr/lib

include ${TOPDIR}/mk/pkg-bottom.mk
