# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include ${ADK_TOPDIR}/rules.mk

PKG_NAME:=		scanlogd
PKG_VERSION:=		2.2.6
PKG_RELEASE:=		8
PKG_MD5SUM:=		7b8187ea718ebe47f22805b921b909ab
PKG_DESCR:=		portscan logger
PKG_SECTION:=		net/security
PKG_DEPENDS:=		libpcap libnet libnids
PKG_BUILDDEP:=		libpcap libnids libnet
PKG_URL:=		http://www.openwall.com/scanlogd/
PKG_SITES:=		http://www.openwall.com/scanlogd/

DISTFILES:=		${PKG_NAME}-${PKG_VERSION}.tar.gz
PKG_ARCH_DEPENDS:=	!arm
PKG_LIBC_DEPENDS:=	uclibc glibc

include ${ADK_TOPDIR}/mk/package.mk

$(eval $(call PKG_template,SCANLOGD,scanlogd,${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))

CONFIG_STYLE:=          manual
INSTALL_STYLE:=         manual

MAKE_FLAGS+=		PCAP_H="-I${STAGING_TARGET_DIR}/usr/include" \
			NIDS_H="-I${STAGING_TARGET_DIR}/usr/include" \
			NIDS_L="-L${STAGING_TARGET_DIR}/usr/lib -lnids -lnet -lpcap"
ALL_TARGET:=		libnids

do-configure:
	${SED} "s,/var/empty,/tmp/.scanlogd," ${WRKBUILD}/params.h
	${SED} "s,#undef SCANLOGD_DEVICE,#define SCANLOGD_DEVICE \"all\"," ${WRKBUILD}/params.h

do-install:
	${INSTALL_DIR} ${IDIR_SCANLOGD}/usr/sbin
	${INSTALL_BIN} ${WRKBUILD}/${PKG_NAME} ${IDIR_SCANLOGD}/usr/sbin/

include ${ADK_TOPDIR}/mk/pkg-bottom.mk
