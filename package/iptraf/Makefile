# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include ${TOPDIR}/rules.mk

PKG_NAME:=		iptraf
PKG_VERSION:=		3.0.1
PKG_RELEASE:=		1
PKG_MD5SUM:=		004c2c005a1b78739e22bc49d33e244d
PKG_DESCR:=		console-based network monitoring program.
PKG_SECTION:=		net
PKG_DEPENDS:=		libncurses
PKG_BUILDDEP:=		ncurses
PKG_URL:=		http://iptraf.seul.org/
PKG_SITES:=		ftp://iptraf.seul.org/pub/iptraf/

DISTFILES:=		${PKG_NAME}-${PKG_VERSION}.tar.gz

include ${TOPDIR}/mk/package.mk

$(eval $(call PKG_template,IPTRAF,iptraf,${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))

CONFIG_STYLE:=		manual
BUILD_STYLE:=		manual
INSTALL_STYLE:=		manual

TARGET_CPPFLAGS+=	-D_GNU_SOURCE
TARGET_LDFLAGS+=	-ltinfo

do-build:
	${MAKE} -C ${WRKBUILD}/src \
		${TARGET_CONFIGURE_OPTS} \
		CFLAGS="${TARGET_CFLAGS}" \
		DEBUG="" \
		INCLUDEDIR="-I../support -I${STAGING_TARGET_DIR}/usr/include" \
		LDOPTS="${TARGET_LDFLAGS}" \
		PLATFORM="-DPLATFORM=\\\"Linux/${ARCH}\\\"" \
		TARGET="/usr/bin" \
		WORKDIR="/var/lib/iptraf" \
		all

do-install:
	${INSTALL_DIR} ${IDIR_IPTRAF}/usr/bin
	${INSTALL_BIN} ${WRKBUILD}/src/iptraf ${IDIR_IPTRAF}/usr/bin/

include ${TOPDIR}/mk/pkg-bottom.mk
