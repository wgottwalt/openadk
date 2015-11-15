# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include ${ADK_TOPDIR}/rules.mk

PKG_NAME:=		kismet
PKG_VERSION:=		2013-03-R1b
PKG_RELEASE:=		1
PKG_HASH:=		636d4d7ef8c67ae6ee8d8e1635f5115700eecb9fa4c208afaee30238db527c2c
PKG_DESCR:=		wireless network detector, sniffer, and intrusion detection system
PKG_SECTION:=		net/wifi
PKG_DEPENDS:=		libpcap libncurses
PKG_BUILDDEP:=		libpcap ncurses
PKG_NEEDS:=		threads
PKG_URL:=		http://www.kismetwireless.net/
PKG_SITES:=		http://www.kismetwireless.net/code/

PKG_SUBPKGS:=		KISMET KISMET_CLIENT KISMET_DRONE KISMET_SERVER
PKGSD_KISMET_CLIENT:=	kismet client
PKGSD_KISMET_SERVER:=	kismet server
PKGSD_KISMET_DRONE:=	kismet drone

include ${ADK_TOPDIR}/mk/package.mk

$(eval $(call PKG_template,KISMET,kismet,${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))
$(eval $(call PKG_template,KISMET_CLIENT,kismet-client,${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKGSD_KISMET_CLIENT},${PKG_SECTION}))
$(eval $(call PKG_template,KISMET_DRONE,kismet-drone,${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKGSD_KISMET_DRONE},${PKG_SECTION}))
$(eval $(call PKG_template,KISMET_SERVER,kismet-server,${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKGSD_KISMET_SERVER},${PKG_SECTION}))

AUTOTOOL_STYLE:=	autoreconf
TARGET_LDFLAGS+=	-lpthread -ltinfo
CONFIGURE_ARGS+=	--sysconfdir=/etc/kismet

pre-build:
	(cd ${WRKBUILD} && ${MAKE} dep);

kismet-install:
	${INSTALL_DIR} ${IDIR_KISMET}/usr/bin/
	${INSTALL_BIN} ${WRKINST}/usr/bin/kismet ${IDIR_KISMET}/usr/bin/kismet

kismet-client-install:
	${INSTALL_DIR} ${IDIR_KISMET_CLIENT}/usr/bin
	${INSTALL_BIN} ${WRKINST}/usr/bin/kismet_client \
		${IDIR_KISMET_CLIENT}/usr/bin/

kismet-drone-install:
	${INSTALL_DIR} ${IDIR_KISMET_DRONE}/usr/bin
	${INSTALL_BIN} ${WRKINST}/usr/bin/kismet_drone \
		${IDIR_KISMET_DRONE}/usr/bin/

kismet-server-install:
	${INSTALL_DIR} ${IDIR_KISMET_SERVER}/usr/bin
	${INSTALL_DIR} ${IDIR_KISMET_SERVER}/etc/kismet
	${INSTALL_BIN} ${WRKINST}/usr/bin/kismet_server \
		${IDIR_KISMET_SERVER}/usr/bin/
	${INSTALL_DATA} ${WRKINST}/etc/kismet/kismet.conf \
		${IDIR_KISMET_SERVER}/etc/kismet

include ${ADK_TOPDIR}/mk/pkg-bottom.mk
