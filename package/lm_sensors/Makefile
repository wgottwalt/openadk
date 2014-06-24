# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include ${ADK_TOPDIR}/rules.mk

PKG_NAME:=		lm_sensors
PKG_VERSION:=		3.3.1
PKG_RELEASE:=		2
PKG_MD5SUM:=		8c0eebda8524fc87da1393b4564d279b
PKG_DESCR:=		hardware sensor toolset
PKG_SECTION:=		sys/hw
PKG_DEPENDS:=		sysfsutils
PKG_URL:=		http://www.lm-sensors.org
PKG_SITES:=		http://dl.lm-sensors.org/lm-sensors/releases/

DISTFILES:=		${PKG_NAME}-${PKG_VERSION}.tar.bz2

PKG_ARCH_DEPENDS:=	x86 x86_64

PKG_SUBPKGS:=		LM_SENSORS LM_SENSORS_DETECT
PKGSD_LM_SENSORS_DETECT:=	lm_sensors perl scripts (e.g. sensors-detect)
PKGSC_LM_SENSORS_DETECT:=	sys/hw
PKGSS_LM_SENSORS_DETECT:=	perl
PKGSB_LM_SENSORS_DETECT:=	perl

include ${ADK_TOPDIR}/mk/package.mk

$(eval $(call PKG_template,LM_SENSORS,lm-sensors,${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION},${PKG_OPTS}))
$(eval $(call PKG_template,LM_SENSORS_DETECT,lm-sensors-detect,${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKGSD_LM_SENSORS_DETECT},${PKGSC_LM_SENSORS_DETECT}))

CONFIG_STYLE:=		manual
ALL_TARGET:=		user
TARGET_LDFLAGS+=	-liconv

lm-sensors-install:
	${INSTALL_DIR} ${IDIR_LM_SENSORS}/usr/bin
	${INSTALL_BIN} ${WRKINST}/usr/bin/sensors ${IDIR_LM_SENSORS}/usr/bin/sensors
	${INSTALL_DIR} ${IDIR_LM_SENSORS}/usr/lib
	${CP} ${WRKINST}/usr/lib/libsensors.so* ${IDIR_LM_SENSORS}/usr/lib
	${INSTALL_DIR} ${IDIR_LM_SENSORS}/etc
	${CP} ${WRKINST}/etc/sensors3.conf ${IDIR_LM_SENSORS}/etc

lm-sensors-detect-install:
	${INSTALL_DIR} ${IDIR_LM_SENSORS_DETECT}/usr/sbin
	${INSTALL_BIN} ${WRKINST}/usr/sbin/fancontrol ${IDIR_LM_SENSORS_DETECT}/usr/sbin/fancontrol
	${INSTALL_BIN} ${WRKINST}/usr/sbin/isadump ${IDIR_LM_SENSORS_DETECT}/usr/sbin/isadump
	${INSTALL_BIN} ${WRKINST}/usr/sbin/isaset ${IDIR_LM_SENSORS_DETECT}/usr/sbin/isaset
	${INSTALL_BIN} ${WRKINST}/usr/sbin/pwmconfig ${IDIR_LM_SENSORS_DETECT}/usr/sbin/pwmconfig
	${INSTALL_BIN} ${WRKINST}/usr/sbin/sensors-detect ${IDIR_LM_SENSORS_DETECT}/usr/sbin/sensors-detect

include ${ADK_TOPDIR}/mk/pkg-bottom.mk
