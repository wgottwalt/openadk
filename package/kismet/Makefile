# $Id$
#-
# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include ${TOPDIR}/rules.mk

PKG_NAME:=		kismet
PKG_VERSION:=		2008-05-R1
PKG_RELEASE:=		1
PKG_MD5SUM:=		6ee365d36354b4dee4945e67f8149294
MASTER_SITES:=		http://www.kismetwireless.net/code/

include ${TOPDIR}/mk/package.mk

$(eval $(call PKG_template,KISMET,kismet,${PKG_VERSION}-${PKG_RELEASE}))
$(eval $(call PKG_template,KISMET_CLIENT,kismet-client,${PKG_VERSION}-${PKG_RELEASE}))
$(eval $(call PKG_template,KISMET_DRONE,kismet-drone,${PKG_VERSION}-${PKG_RELEASE}))
$(eval $(call PKG_template,KISMET_SERVER,kismet-server,${PKG_VERSION}-${PKG_RELEASE}))

ifeq ($(ADK_COMPILE_KISMET_WITH_UCLIBCXX),y)
TCFLAGS+=		-fno-builtin -fno-rtti -nostdinc++ -I${STAGING_DIR}/usr/include/uClibc++
TLDFLAGS+=		-luClibc++ -lc -lm -lgcc_s -nodefaultlibs 
CONFIGURE_ENV+=		CXXFLAGS="-fno-builtin -fno-rtti -nostdinc++ \
			-I${STAGING_DIR}/usr/include/uClibc++"
else
TLDFLAGS+=		-shared
endif
CONFIGURE_STYLE=	gnu
CONFIGURE_ARGS+=	--sysconfdir=/etc/kismet \
			--enable-syspcap=yes \
			--disable-setuid \
			--disable-gpsmap
BUILD_STYLE=		auto

do-install:
	${INSTALL_DIR} ${IDIR_KISMET}/usr/bin/
	${INSTALL_BIN} ${WRKBUILD}/kismet ${IDIR_KISMET}/usr/bin/kismet
	${INSTALL_DIR} ${IDIR_KISMET_CLIENT}/usr/bin
	${INSTALL_DIR} ${IDIR_KISMET_CLIENT}/etc/kismet/
	${INSTALL_DATA} ./files/ap_manuf ${IDIR_KISMET_CLIENT}/etc/kismet/
	${INSTALL_DATA} ./files/client_manuf ${IDIR_KISMET_CLIENT}/etc/kismet/
	${INSTALL_DATA} ./files/kismet.conf ${IDIR_KISMET_CLIENT}/etc/kismet/
	${INSTALL_DATA} ./files/kismet_ui.conf ${IDIR_KISMET_CLIENT}/etc/kismet/
	${CP} ${WRKBUILD}/kismet_client ${IDIR_KISMET_CLIENT}/usr/bin/
	${INSTALL_DIR} ${IDIR_KISMET_DRONE}/usr/bin
	${INSTALL_DIR} ${IDIR_KISMET_DRONE}/etc/kismet/
	${INSTALL_DATA} ./files/kismet_drone.conf ${IDIR_KISMET_DRONE}/etc/kismet/
	${CP} ${WRKBUILD}/kismet_drone ${IDIR_KISMET_DRONE}/usr/bin/
	${INSTALL_DIR} ${IDIR_KISMET_SERVER}/usr/bin
	${INSTALL_DIR} ${IDIR_KISMET_SERVER}/etc/kismet/
	${INSTALL_DATA} ./files/ap_manuf ${IDIR_KISMET_SERVER}/etc/kismet/
	${INSTALL_DATA} ./files/client_manuf ${IDIR_KISMET_SERVER}/etc/kismet/
	${INSTALL_DATA} ./files/kismet.conf ${IDIR_KISMET_SERVER}/etc/kismet/
	${CP}  ${WRKBUILD}/kismet_server ${IDIR_KISMET_SERVER}/usr/bin/

include ${TOPDIR}/mk/pkg-bottom.mk
