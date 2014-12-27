# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include ${ADK_TOPDIR}/rules.mk

PKG_NAME:=		setpwc
PKG_VERSION:=		1.3
PKG_RELEASE:=		1
PKG_HASH:=		4d32d4d54d584cd42aaf52dfa1ba874122e825ad39e4493d45f89b85de4e95cf
PKG_DESCR:=		philips webcam control utility
PKG_SECTION:=		sys/hw
PKG_URL:=		http://www.vanheusden.com/setpwc/
PKG_SITES:=		http://www.vanheusden.com/setpwc/

DISTFILES:=		${PKG_NAME}-${PKG_VERSION}.tgz

include ${ADK_TOPDIR}/mk/package.mk

$(eval $(call PKG_template,SETPWC,setpwc,${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))

CONFIG_STYLE:=          manual
BUILD_STYLE:=           manual
INSTALL_STYLE:=         manual

TARGET_CPPFLAGS+=	-DVERSION=\"${PKG_VERSION}\"

do-build:
	${TARGET_CC} ${TARGET_CPPFLAGS} ${TARGET_CFLAGS} ${TARGET_LDFLAGS} \
		-o ${WRKBUILD}/setpwc ${WRKBUILD}/setpwc.c

do-install:
	${INSTALL_DIR} ${IDIR_SETPWC}/usr/bin
	${INSTALL_BIN} ${WRKBUILD}/setpwc ${IDIR_SETPWC}/usr/bin/

include ${ADK_TOPDIR}/mk/pkg-bottom.mk
