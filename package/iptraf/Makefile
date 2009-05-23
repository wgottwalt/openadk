# $Id$
#-
# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include ${TOPDIR}/rules.mk

PKG_NAME:=		iptraf
PKG_VERSION:=		3.0.0
PKG_RELEASE:=		1
PKG_MD5SUM:=		377371c28ee3c21a76f7024920649ea8
MASTER_SITES:=		ftp://iptraf.seul.org/pub/iptraf/ \
			ftp://the.wiretapped.net/pub/security/network-monitoring/iptraf/

include ${TOPDIR}/mk/package.mk

$(eval $(call PKG_template,IPTRAF,iptraf,${PKG_VERSION}-${PKG_RELEASE}))

do-build:
	${MAKE} -C ${WRKBUILD}/src \
		${TARGET_CONFIGURE_OPTS} \
		CFLAGS="${TARGET_CFLAGS}" \
		DEBUG="" \
		INCLUDEDIR="-I../support -I${STAGING_DIR}/usr/include -I${STAGING_DIR}/include" \
		LDOPTS="-L${STAGING_DIR}/usr/lib -L${STAGING_DIR}/lib" \
		PLATFORM="-DPLATFORM=\\\"Linux/${ARCH}\\\"" \
		TARGET="/usr/bin" \
		WORKDIR="/var/lib/iptraf" \
		all

do-install:
	${INSTALL_DIR} ${IDIR_IPTRAF}/usr/bin
	${INSTALL_BIN} ${WRKBUILD}/src/iptraf ${IDIR_IPTRAF}/usr/bin/

include ${TOPDIR}/mk/pkg-bottom.mk
