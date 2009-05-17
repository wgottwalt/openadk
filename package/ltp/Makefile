# $Id$
#-
# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include ${TOPDIR}/rules.mk

PKG_NAME:=		ltp-full
PKG_VERSION:=		20061121
PKG_RELEASE:=		2
PKG_MD5SUM:=		f01dd2119c5d4462e876229df394ecbf
MASTER_SITES:=		http://switch.dl.sourceforge.net/sourceforge/ltp/
DISTFILES:=		${PKG_NAME}-${PKG_VERSION}.tgz

include ${TOPDIR}/mk/package.mk

$(eval $(call PKG_template,LTP,ltp,${PKG_VERSION}-${PKG_RELEASE},${ARCH}))

BUILD_STYLE:=		auto
INSTALL_STYLE:=		auto
XAKE_FLAGS+=		CROSS_COMPILER="${TARGET_CROSS}" \
			CROSS_CFLAGS="${TCFLAGS} -I${WRKBUILD}/include" \
			CPPFLAGS="${TCPPFLAGS}" \
			LDFLAGS="${TLDFLAGS}"

post-install:
	${CP} ${WRKBUILD} ${IDIR_LTP}
	find ${IDIR_LTP} \( -name '*.c' -o -name '*.h' -o -name '*.o' \) -exec rm '{}' \;

include ${TOPDIR}/mk/pkg-bottom.mk
