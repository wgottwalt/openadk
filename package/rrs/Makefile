# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include ${TOPDIR}/rules.mk

PKG_NAME:=		rrs
PKG_VERSION:=		1.70
PKG_RELEASE:=		2
PKG_MD5SUM:=		b400d03c0e39e3e78a7327ba78f789f0
PKG_DESCR:=		A reverse (connecting) remote shell, with SSL support.
PKG_SECTION:=		net/misc
PKG_DEPENDS:=		zlib libopenssl
PKG_BUILDDEP:=		zlib openssl
PKG_URL:=		http://www.cycom.se/dl/rrs/
PKG_SITES:=		http://www.cycom.se/uploads/36/19/
PKG_CXX:=		RRS

include ${TOPDIR}/mk/package.mk

$(eval $(call PKG_template,RRS,${PKG_NAME},${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))

CONFIG_STYLE:=          manual
BUILD_STYLE:=		manual
INSTALL_STYLE:=         manual

do-build:
	${MAKE} -C ${WRKBUILD} \
		CC="${TARGET_CC}" \
		CFLAGS="${TARGET_CFLAGS} -I${STAGING_DIR}/usr/include ${PKG_FLAGS}" \
		LDFLAGS="-L${STAGING_DIR}/usr/lib -L${STAGING_DIR}/lib ${PKG_LDFLAGS} -lutil -lssl -lcrypto -lz" \
		generic

do-install:
	${INSTALL_DIR} ${IDIR_RRS}/usr/bin
	${INSTALL_BIN} ${WRKBUILD}/rrs ${IDIR_RRS}/usr/bin/

include ${TOPDIR}/mk/pkg-bottom.mk
