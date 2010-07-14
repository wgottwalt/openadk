# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include ${TOPDIR}/rules.mk

PKG_NAME:=		pipacs
PKG_RELEASE:=		2
PKG_DESCR:=		an UNIX socket accounting/wiewer program
PKG_SECTION:=		net/misc

NO_DISTFILES:=		1

include ${TOPDIR}/mk/package.mk

$(eval $(call PKG_template,PIPACS,${PKG_NAME},${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))

CONFIG_STYLE:=          manual
INSTALL_STYLE:=         manual

MAKE_FLAGS+=		CFLAGS="${TCFLAGS} ${TCPPFLAGS}" \
			${TARGET_CONFIGURE_OPTS}

do-install:
	${INSTALL_DIR} ${IDIR_PIPACS}/usr/bin
	${INSTALL_BIN} ${WRKBUILD}/pipacs ${IDIR_PIPACS}/usr/bin

include ${TOPDIR}/mk/pkg-bottom.mk
