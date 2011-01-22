# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include ${TOPDIR}/rules.mk

PKG_NAME:=		setpwc
PKG_VERSION:=		1.2
PKG_RELEASE:=		1
PKG_MD5SUM:=		1bc721cdfcbac24027e2afc93685d29f
PKG_DESCR:=		Philips (and compatibles) WebCams (PWC) control utility
PKG_SECTION:=		multimedia
PKG_URL:=		http://www.vanheusden.com/setpwc/
PKG_SITES:=		http://www.vanheusden.com/setpwc/

DISTFILES:=		${PKG_NAME}-${PKG_VERSION}.tgz

include ${TOPDIR}/mk/package.mk

$(eval $(call PKG_template,SETPWC,${PKG_NAME},${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))

CONFIG_STYLE:=          manual
BUILD_STYLE:=           manual
INSTALL_STYLE:=         manual

TARGET_CPPFLAGS+=	-DVERSION=\"${PKG_VERSION}\"
TARGET_CFLAGS+=		-Wall

do-build:
	${TARGET_CC} ${TARGET_CPPFLAGS} ${TARGET_CFLAGS} ${TARGET_LDFLAGS} \
		-o ${WRKBUILD}/setpwc ${WRKBUILD}/setpwc.c

do-install:
	${INSTALL_DIR} ${IDIR_SETPWC}/usr/bin
	${INSTALL_BIN} ${WRKBUILD}/setpwc ${IDIR_SETPWC}/usr/bin/

include ${TOPDIR}/mk/pkg-bottom.mk
