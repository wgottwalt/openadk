# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(TOPDIR)/rules.mk

PKG_NAME:=		tzdata
PKG_VERSION:=		2013d
PKG_RELEASE:=		1
PKG_MD5SUM:=		65b6818162230fc02f86f293376c73df 4616a9560270f180eeb9a08540636890
PKG_DESCR:=		Timezone data (/usr/share/zoneinfo)
PKG_SECTION:=		utils
PKG_URL:=		http://www.iana.org/time-zones/
PKG_SITES:=		http://www.iana.org/time-zones/repository/releases/
PKG_NOPARALLEL:=	1

DISTFILES:=             ${PKG_NAME}${PKG_VERSION}.tar.gz tzcode${PKG_VERSION}.tar.gz
# both archives do not extract into subdirectories
WRKDIST=		${WRKDIR}

# no use for tzselect, since that is a ksh-script
PKG_SUBPKGS:=		TZDATA ZDUMP ZIC DATE
PKGSD_ZDUMP:=		timezone file dumper
PKGSD_ZIC:=		timezone file compiler
PKGSD_DATE:=		famous date utility

include $(TOPDIR)/mk/package.mk

$(eval $(call PKG_template,TZDATA,$(PKG_NAME),$(PKG_VERSION)-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))
$(eval $(call PKG_template,ZDUMP,zdump,$(PKG_VERSION)-${PKG_RELEASE},${PKG_DEPENDS},${PKGSD_ZDUMP},${PKG_SECTION}))
$(eval $(call PKG_template,ZIC,zic,$(PKG_VERSION)-${PKG_RELEASE},${PKG_DEPENDS},${PKGSD_ZIC},${PKG_SECTION}))
$(eval $(call PKG_template,DATE,date,$(PKG_VERSION)-${PKG_RELEASE},${PKG_DEPENDS},${PKGSD_DATE},${PKG_SECTION}))

CONFIG_STYLE:=		manual
CFLAGS_FOR_BUILD+=	-DSTD_INSPIRED=1
XAKE_FLAGS+=		TOPDIR="${WRKINST}" TZDIR="${WRKINST}/usr/share/zoneinfo" cc="${TARGET_CC}"
# the uppercase targets enable building and installation of the date utility
ALL_TARGET:=		ALL
INSTALL_TARGET:=	INSTALL

post-install:
	$(INSTALL_DIR) $(IDIR_TZDATA)/usr/share
	$(CP) $(WRKINST)/usr/share/zoneinfo $(IDIR_TZDATA)/usr/share
	${INSTALL_DIR} ${IDIR_ZDUMP}/usr/sbin
	${INSTALL_BIN} ${WRKINST}/etc/zdump ${IDIR_ZDUMP}/usr/sbin/
	${INSTALL_DIR} ${IDIR_ZIC}/usr/sbin
	${INSTALL_BIN} ${WRKINST}/etc/zic ${IDIR_ZIC}/usr/sbin/
	${INSTALL_DIR} ${IDIR_DATE}/usr/bin
	${INSTALL_BIN} ${WRKINST}/bin/date ${IDIR_DATE}/usr/bin/

include ${TOPDIR}/mk/pkg-bottom.mk
