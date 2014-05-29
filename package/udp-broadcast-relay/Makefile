# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include ${TOPDIR}/rules.mk

PKG_NAME:=		udp-broadcast-relay
PKG_VERSION:=		0.3
PKG_RELEASE:=		1
PKG_MD5SUM:=		a32f983b7063d6ac670e6b22be9b9d24
PKG_DESCR:=		listens for packets on a specified udp broadcast port
PKG_SECTION:=		net/misc
PKG_URL:=		http://www.joachim-breitner.de/udp-broadcast-relay/
PKG_SITES:=		http://www.joachim-breitner.de/udp-broadcast-relay/files/

DISTFILES:=		${PKG_NAME}-${PKG_VERSION}.tar.gz

include ${TOPDIR}/mk/package.mk

$(eval $(call PKG_template,UDP_BROADCAST_RELAY,udp-broadcast-relay,${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))

CONFIG_STYLE:=		manual
BUILD_STYLE:=		manual
INSTALL_STYLE:=		manual

do-build:
	${TARGET_CC} -Wall ${TARGET_CFLAGS} ${WRKBUILD}/main.c \
		-o ${WRKBUILD}/udp-broadcast-relay

do-install:
	${INSTALL_DIR} ${IDIR_UDP_BROADCAST_RELAY}/usr/sbin
	${INSTALL_BIN} ${WRKBUILD}/udp-broadcast-relay \
		${IDIR_UDP_BROADCAST_RELAY}/usr/sbin/

include ${TOPDIR}/mk/pkg-bottom.mk
