# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include ${TOPDIR}/rules.mk

PKG_NAME:=		scanlogd
PKG_VERSION:=		2.2.6
PKG_RELEASE:=		8
PKG_BUILDDEP+=		libpcap libnids libnet
PKG_MD5SUM:=		7b8187ea718ebe47f22805b921b909ab
PKG_DESCR:=		Portscan logger
PKG_SECTION:=		net
PKG_DEPENDS:=		libpcap libnet libnids
PKG_URL:=		http://www.openwall.com/scanlogd
PKG_SITES:=		http://www.openwall.com/scanlogd/ \
			ftp://ftp.wiretapped.net/pub/openwall/ \
			http://distro.ibiblio.org/pub/linux/distributions/openwall/

include ${TOPDIR}/mk/package.mk

$(eval $(call PKG_template,SCANLOGD,${PKG_NAME},${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))

BUILD_STYLE:=		auto
MAKE_FLAGS+=		CC="${TARGET_CC}" LD="${TARGET_CC}" CFLAGS="-c ${TARGET_CFLAGS}" \
			LDFLAGS= \
			PCAP_H="-I${STAGING_DIR}/usr/include" \
			NIDS_H="-I${STAGING_DIR}/usr/include" \
			NIDS_L="-L${STAGING_DIR}/usr/lib -lnids -lnet -lpcap"
ALL_TARGET:=		libnids

do-configure:
	${SED} "s,/var/empty,/tmp/.scanlogd," ${WRKBUILD}/params.h
	${SED} "s,#undef SCANLOGD_DEVICE,#define SCANLOGD_DEVICE \"all\"," ${WRKBUILD}/params.h

do-install:
	${INSTALL_DIR} ${IDIR_SCANLOGD}/usr/sbin
	${INSTALL_BIN} ${WRKBUILD}/${PKG_NAME} ${IDIR_SCANLOGD}/usr/sbin/

include ${TOPDIR}/mk/pkg-bottom.mk
