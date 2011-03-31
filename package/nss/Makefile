# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(TOPDIR)/rules.mk

PKG_NAME:=		nss
PKG_VERSION:=		3.12.9
PKG_RELEASE:=		1
PKG_MAJ_VERSION:=	3
PKG_MIN_VERSION:=	12
PKG_PATCH_VERSION:=	9
PKG_MD5SUM:=		bd32f183ca28440c1744650be31a9ccc
PKG_DESCR:=		Network Security Services (NSS) library
PKG_SECTION:=		libs
PKG_BUILDDEP:=		nspr zlib
PKG_URL:=		http://www.mozilla.org/projects/security/pki/nss/
PKG_SITES:=		ftp://ftp.mozilla.org/pub/mozilla.org/security/nss/releases/NSS_3_12_9_RTM/src/
PKG_NOPARALLEL:=	1

PKG_HOST_DEPENDS:=	!cygwin
PKG_ARCH_DEPENDS:=	!cris

WRKSRC=			${WRKDIST}/mozilla/security/nss

include $(TOPDIR)/mk/package.mk

$(eval $(call PKG_template,NSS,${PKG_NAME},$(PKG_VERSION)-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))

CONFIG_STYLE:=		manual

ifeq ($(ADK_LINUX_64),y)
TARGET_CFLAGS+=		-DUSE_64
XAKE_FLAGS+=		USE_64=1
endif

MAKE_FLAGS+=		NATIVE_CC="${CC_FOR_BUILD}" NATIVE_FLAGS="${CFLAGS_FOR_BUILD}"
TARGET_CPPFLAGS+=	-I${STAGING_TARGET_DIR}/usr/include/nspr
TARGET_CFLAGS+=		-I${STAGING_TARGET_DIR}/usr/include/nspr
TARGET_LDFLAGS+=	-ldl -pthread

XAKE_FLAGS+=		SOURCE_MD_DIR=${WRKDIST}/dist DIST=${WRKDIST}/dist
XAKE_FLAGS+=		ARCHFLAG="${TARGET_CFLAGS} ${TARGET_CPPFLAGS} ${TARGET_LDFLAGS}"
XAKE_FLAGS+=		NSS_DISABLE_DBM=1 OS_TEST=${CPU_ARCH} OS_TARGET=Linux OS_RELEASE=2.6 OS_ARCH=Linux
XAKE_FLAGS+=		ARTOOL="${TARGET_CROSS}ar" RANLIB="${TARGET_CROSS}ranlib"
ALL_TARGET:=		build_coreconf all

post-install:
	$(INSTALL_DIR) $(WRKINST)/usr/lib/pkgconfig
	sed 's/@VERSION@/$(PKG_VERSION)/' ./files/nss.pc.in > $(WRKINST)/usr/lib/pkgconfig/nss.pc
	$(INSTALL_DIR) $(WRKINST)/usr/bin
	sed -e 's/@MOD_MAJOR_VERSION@/$(PKG_MAJ_VERSION)/' \
		-e 's/@MOD_MINOR_VERSION@/$(PKG_MIN_VERSION)/' \
		-e 's/@MOD_PATCH_VERSION@/$(PKG_PATCH_VERSION)/' \
		./files/nss-config.in > $(WRKINST)/usr/bin/nss-config
	$(INSTALL_DIR) $(IDIR_NSS)/usr/lib
	${INSTALL_DATA} ${WRKDIST}/dist/lib/lib{ssl3,smime3,nss3,nssutil3}.so \
		$(IDIR_NSS)/usr/lib
	${INSTALL_DIR} ${STAGING_TARGET_DIR}/usr/include/nss
	${INSTALL_DATA} ${WRKDIST}/mozilla/dist/public/nss/* \
		${STAGING_TARGET_DIR}/usr/include/nss

include ${TOPDIR}/mk/pkg-bottom.mk
