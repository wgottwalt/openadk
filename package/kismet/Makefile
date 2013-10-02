# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include ${TOPDIR}/rules.mk

PKG_NAME:=		kismet
PKG_VERSION:=		2011-01-R1
PKG_RELEASE:=		2
PKG_MD5SUM:=		1fb1f024a7ca52814b255e2f2faccf3b
PKG_DESCR:=		Kismet
PKG_SECTION:=		wifi
PKG_DEPENDS:=		libpcap libncurses libpthread
PKG_BUILDDEP:=		libpcap ncurses
PKG_URL:=		http://www.kismetwireless.net/
PKG_SITES:=		http://www.kismetwireless.net/code/

PKG_SUBPKGS:=		KISMET KISMET_CLIENT KISMET_DRONE KISMET_SERVER
PKGSD_KISMET_CLIENT:=	Kismet client
PKGSD_KISMET_SERVER:=	Kismet server
PKGSD_KISMET_DRONE:=	Kismet drone

include ${TOPDIR}/mk/package.mk

$(eval $(call PKG_template,KISMET,kismet,${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))
$(eval $(call PKG_template,KISMET_CLIENT,kismet-client,${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKGSD_KISMET_CLIENT},${PKG_SECTION}))
$(eval $(call PKG_template,KISMET_DRONE,kismet-drone,${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKGSD_KISMET_DRONE},${PKG_SECTION}))
$(eval $(call PKG_template,KISMET_SERVER,kismet-server,${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKGSD_KISMET_SERVER},${PKG_SECTION}))

TARGET_LDFLAGS+=	-lpthread
CONFIGURE_ARGS+=	--sysconfdir=/etc/kismet

pre-build:
	(cd ${WRKBUILD} && ${MAKE} dep);

post-install:
	${INSTALL_DIR} ${IDIR_KISMET}/usr/bin/
	${INSTALL_BIN} ${WRKINST}/usr/bin/kismet ${IDIR_KISMET}/usr/bin/kismet
	${INSTALL_DIR} ${IDIR_KISMET_CLIENT}/usr/bin
	${INSTALL_BIN} ${WRKINST}/usr/bin/kismet_client \
		${IDIR_KISMET_CLIENT}/usr/bin/
	${INSTALL_DIR} ${IDIR_KISMET_DRONE}/usr/bin
	${INSTALL_BIN} ${WRKINST}/usr/bin/kismet_drone \
		${IDIR_KISMET_DRONE}/usr/bin/
	${INSTALL_DIR} ${IDIR_KISMET_SERVER}/usr/bin
	${INSTALL_DIR} ${IDIR_KISMET_SERVER}/etc/kismet
	${INSTALL_BIN} ${WRKINST}/usr/bin/kismet_server \
		${IDIR_KISMET_SERVER}/usr/bin/
	${INSTALL_DATA} ${WRKINST}/etc/kismet/kismet.conf \
		${IDIR_KISMET_SERVER}/etc/kismet

include ${TOPDIR}/mk/pkg-bottom.mk
