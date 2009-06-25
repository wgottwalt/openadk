# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(TOPDIR)/rules.mk

PKG_NAME:=		nss
PKG_VERSION:=		3.12.3
PKG_RELEASE:=		1
PKG_MD5SUM:=		ecb7079ba4ebcf29b7716775384f1f18
PKG_DESCR:=		Network Security Services (NSS) library
PKG_SECTION:=		libs
PKG_URL:=		http://www.mozilla.org/projects/security/pki/nss/
PKG_SITES:=		ftp://ftp.mozilla.org/pub/mozilla.org/security/nss/releases/NSS_3_12_3_RTM/src/

DISTFILES:=		${PKG_NAME}-${PKG_VERSION}.tar.bz2
WRKSRC=			${WRKDIST}/mozilla/security/nss

include $(TOPDIR)/mk/package.mk

$(eval $(call PKG_template,NSS,${PKG_NAME},$(PKG_VERSION)-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))

ifeq ($(ADK_LINUX_64),y)
TCFLAGS+=		-DUSE_64
MAKE_FLAGS+=		USE_64=1
endif

MAKE_FLAGS+=		NATIVE_CC="${HOSTCC}" NATIVE_FLAGS="${HOSTCFLAGS}" NATIVE_LDFLAGS="${HOSTLDFLAGS}"
TCPPFLAGS+=		-I${STAGING_DIR}/usr/include/nspr
TCFLAGS+=		-I${STAGING_DIR}/usr/include/nspr
BUILD_STYLE=		auto
INSTALL_STYLE=		auto
MAKE_FLAGS+=		SOURCE_MD_DIR=${WRKDIST}/dist DIST=${WRKDIST}/dist NSS_DISABLE_DBM=1 OS_TEST=${ARCH} \
			ARCHFLAG="${TCFLAGS} ${TCPPFLAGS}"
ALL_TARGET:=		build_coreconf all
XAKE_FLAGS+=		OS_TEST=${ARCH} NSS_DISABLE_DBM=1

post-install:
	$(INSTALL_DIR) $(IDIR_NSS)/usr/lib
	${INSTALL_DATA} ${WRKDIST}/dist/lib/*.so $(IDIR_NSS)/usr/lib
	${INSTALL_DIR} ${STAGING_DIR}/usr/include/nss
	${INSTALL_DATA} ${WRKDIST}/mozilla/dist/public/nss/* ${STAGING_DIR}/usr/include/nss

include ${TOPDIR}/mk/pkg-bottom.mk
