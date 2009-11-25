# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include ${TOPDIR}/rules.mk

PKG_NAME:=		iproute2
PKG_VERSION:=		2.6.29-1
PKG_RELEASE:=		2
PKG_MD5SUM:=		c1bc258a6c345905e79935ac7a3cc582
PKG_DESCR:=		iproute2 routing control utility
PKG_SECTION:=		net
PKG_URL:=		http://www.linuxfoundation.org/en/Net:Iproute2
PKG_SITES:=		http://developer.osdl.org/dev/iproute2/download/

PKG_DESCR_TC:=		iproute2 traffic control utility
PKG_DEPENDS_TC:=	kmod-sched
PKG_DESCR_TC_ATM:=	iproute2 traffic control ATM support library
PKG_DEPENDS_TC_ATM:=	tc
PKG_DESCR_IFSTAT:=	iproute2 interface statistics utility
PKG_DESCR_LNSTAT:=	iproute2 network statistics utilities
PKG_DESCR_ROUTEL:=	iproute2 route list and flush utilities
PKG_DESCR_RTMON:=	iproute2 RTnetlink monitor
PKG_DESCR_SS:=		iproute2 socket statistics utility

DISTFILES:=		$(PKG_NAME)-$(PKG_VERSION).tar.bz2

include ${TOPDIR}/mk/package.mk

$(eval $(call PKG_template,IP,ip,${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))
$(eval $(call PKG_template,TC,tc,${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS_TC},${PKG_DESCR_TC},${PKG_SECTION}))
$(eval $(call PKG_template,TC_ATM,tc-atm,${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS_TC_ATM},${PKG_DESCR_TC_ATM},${PKG_SECTION}))
$(eval $(call PKG_template,IFSTAT,ifstat,${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS_IFSTAT},${PKG_DESCR_IFSTAT},${PKG_SECTION}))
$(eval $(call PKG_template,LNSTAT,lnstat,${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS_LNSTAT},${PKG_DESCR_LNSTAT},${PKG_SECTION}))
$(eval $(call PKG_template,ROUTEL,routel,${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS_ROUTEL},${PKG_DESCR_ROUTEL},${PKG_SECTION}))
$(eval $(call PKG_template,RTMON,rtmon,${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS_RTMON},${PKG_DESCR_RTMON},${PKG_SECTION}))
$(eval $(call PKG_template,SS,ss,${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS_SS},${PKG_DESCR_SS},${PKG_SECTION}))

TCFLAGS+=		-D_GNU_SOURCE
XAKE_FLAGS+=		CCOPTS="${TCFLAGS}" MFLAGS="CC=${TARGET_CC}"

CONFIGURE_STYLE:=	gnu
CONFIGURE_FLAGS+=	KERNEL_INCLUDE="${LINUX_DIR}/include"
BUILD_STYLE:=		auto
INSTALL_STYLE:=		auto

INSTALL_y:=
INSTALL_m:=
INSTALL_${ADK_PACKAGE_IP}:=	install-ip
INSTALL_${ADK_PACKAGE_TC}:=	install-tc
INSTALL_${ADK_PACKAGE_TC_ATM}:=	install-tc-atm
INSTALL_${ADK_PACKAGE_IFSTAT}:=	install-ifstat
INSTALL_${ADK_PACKAGE_LNSTAT}:=	install-lnstat
INSTALL_${ADK_PACKAGE_ROUTEL}:=	install-routel
INSTALL_${ADK_PACKAGE_RTMON}:=	install-rtmon
INSTALL_${ADK_PACKAGE_SS}:=	install-ss

post-install: ${INSTALL_y} ${INSTALL_m}

install-ip:
	${INSTALL_DIR} ${IDIR_IP}/{etc/iproute2,usr/sbin}
	${INSTALL_DATA} ${WRKINST}/etc/iproute2/* ${IDIR_IP}/etc/iproute2/
	${INSTALL_BIN} ${WRKINST}/sbin/ip ${IDIR_IP}/usr/sbin/ip

install-tc:
	${INSTALL_DIR} ${IDIR_TC}/{lib/tc,usr/sbin}
	${INSTALL_DATA} ${WRKINST}/lib/tc/* ${IDIR_TC}/lib/tc/
	${INSTALL_BIN} ${WRKINST}/sbin/tc ${IDIR_TC}/usr/sbin/

install-tc-atm:
	${INSTALL_DIR} ${IDIR_TC_ATM}/usr/lib/tc
	${INSTALL_DATA} ${WRKINST}/usr/lib/tc/q_atm.so ${IDIR_TC_ATM}/usr/lib/tc/

install-ifstat:
	${INSTALL_DIR} ${IDIR_IFSTAT}/usr/sbin
	${INSTALL_BIN} ${WRKINST}/sbin/ifstat ${IDIR_IFSTAT}/usr/sbin

install-lnstat:
	${INSTALL_DIR} ${IDIR_LNSTAT}/usr/sbin
	${INSTALL_BIN} ${WRKINST}/sbin/{ln,n}stat ${IDIR_LNSTAT}/usr/sbin
	ln -sf lnstat ${IDIR_LNSTAT}/usr/sbin/rtstat
	ln -sf lnstat ${IDIR_LNSTAT}/usr/sbin/ctstat
	${INSTALL_BIN} ${WRKINST}/sbin/rtacct ${IDIR_LNSTAT}/usr/sbin

install-routel:
	${INSTALL_DIR} ${IDIR_ROUTEL}/usr/sbin
	${INSTALL_BIN} ${WRKINST}/sbin/route{l,f} ${IDIR_ROUTEL}/usr/sbin

install-rtmon:
	${INSTALL_DIR} ${IDIR_RTMON}/usr/sbin
	${INSTALL_BIN} ${WRKINST}/sbin/rtmon ${IDIR_RTMON}/usr/sbin

install-ss:
	${INSTALL_DIR} ${IDIR_SS}/usr/sbin
	${INSTALL_BIN} ${WRKINST}/sbin/ss ${IDIR_SS}/usr/sbin

include ${TOPDIR}/mk/pkg-bottom.mk
