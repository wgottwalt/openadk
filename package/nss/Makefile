# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(TOPDIR)/rules.mk

PKG_NAME:=		nss
PKG_VERSION:=		3.12.4
PKG_RELEASE:=		2
PKG_MD5SUM:=		1ee3ed9c1900079319bd1de51388d856
PKG_DESCR:=		Network Security Services (NSS) library
PKG_SECTION:=		libs
PKG_BUILDDEP+=		nspr zlib
PKG_NOPARALLEL:=	1
PKG_URL:=		http://www.mozilla.org/projects/security/pki/nss/
PKG_SITES:=		https://ftp.mozilla.org/pub/mozilla.org/security/nss/releases/NSS_3_12_4_RTM/src/

PKG_TARGET_DEPENDS:=    !foxboard

WRKSRC=			${WRKDIST}/mozilla/security/nss

include $(TOPDIR)/mk/package.mk

$(eval $(call PKG_template,NSS,${PKG_NAME},$(PKG_VERSION)-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))

CONFIG_STYLE:=		manual

ifeq ($(ADK_LINUX_64),y)
TCFLAGS+=		-DUSE_64
MAKE_FLAGS+=		USE_64=1
endif

MAKE_FLAGS+=		NATIVE_CC="${HOSTCC}" NATIVE_FLAGS="${HOSTCFLAGS}"
TCPPFLAGS+=		-I${STAGING_DIR}/usr/include/nspr
TCFLAGS+=		-I${STAGING_DIR}/usr/include/nspr
TLDFLAGS:=		''

MAKE_FLAGS+=		SOURCE_MD_DIR=${WRKDIST}/dist DIST=${WRKDIST}/dist \
			ARCHFLAG="${TCFLAGS} ${TCPPFLAGS} -ldl"
ALL_TARGET:=		build_coreconf all
XAKE_FLAGS+=		OS_TEST=${ARCH} NSS_DISABLE_DBM=1 OS_TARGET=Linux OS_RELEASE=2.6

post-install:
	$(INSTALL_DIR) $(IDIR_NSS)/usr/lib
	${INSTALL_DATA} ${WRKDIST}/dist/lib/lib{ssl3,smime3,nss3,nssutil3}.so \
		$(IDIR_NSS)/usr/lib
	${INSTALL_DIR} ${STAGING_DIR}/usr/include/nss
	${INSTALL_DATA} ${WRKDIST}/mozilla/dist/public/nss/* \
		${STAGING_DIR}/usr/include/nss

include ${TOPDIR}/mk/pkg-bottom.mk
