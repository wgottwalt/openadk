# $Id$
#-
# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include ${TOPDIR}/rules.mk

PKG_NAME:=		udp-broadcast-relay
PKG_VERSION:=		0.3
PKG_RELEASE:=		1
PKG_MD5SUM:=		a32f983b7063d6ac670e6b22be9b9d24

MASTER_SITES:=		http://www.joachim-breitner.de/udp-broadcast-relay/files/

include ${TOPDIR}/mk/package.mk

$(eval $(call PKG_template,UDP_BROADCAST_RELAY,udp-broadcast-relay,${PKG_VERSION}-${PKG_RELEASE}))

do-build:
	${TARGET_CC} ${WRKBUILD}/main.c -o ${WRKBUILD}/${PKG_NAME}

do-install:
	${INSTALL_DIR} ${IDIR_UDP_BROADCAST_RELAY}/usr/sbin
	${INSTALL_BIN} ${WRKBUILD}/${PKG_NAME} ${IDIR_UDP_BROADCAST_RELAY}/usr/sbin/

include ${TOPDIR}/mk/pkg-bottom.mk
