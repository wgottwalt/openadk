# $Id$
#-
# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include ${TOPDIR}/rules.mk

PKG_NAME:=			pipacs
PKG_RELEASE:=		2
WRKDIST=				${WRKDIR}/${PKG_NAME}
NO_DISTFILES:=		1

include ${TOPDIR}/mk/package.mk

$(eval $(call PKG_template,PIPACS,pipacs,${PKG_RELEASE}))

BUILD_STYLE:=		auto
MAKE_FLAGS+=		CFLAGS="${TCFLAGS} ${TCPPFLAGS}" \
	    				${TARGET_CONFIGURE_OPTS}

do-configure:
	mkdir -p ${WRKBUILD}
	${CP} ./src/* ${WRKBUILD}

do-install:
	${INSTALL_DIR} ${IDIR_PIPACS}/usr/bin
	${INSTALL_BIN} ${WRKBUILD}/pipacs ${IDIR_PIPACS}/usr/bin

include ${TOPDIR}/mk/pkg-bottom.mk
