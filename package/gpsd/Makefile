# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include ${TOPDIR}/rules.mk

PKG_NAME:=		gpsd
PKG_VERSION:=		3.10
PKG_RELEASE:=		3
PKG_MD5SUM:=		fc5b03aae38b9b5b6880b31924d0ace3
PKG_DESCR:=		interface daemon for gps receivers
PKG_SECTION:=		sys/misc
PKG_DEPENDS:=		libpthread
PKG_BUILDDEP:=		scons-host ncurses
PKG_URL:=		http://catb.org/gpsd/
PKG_SITES:=		http://download-mirror.savannah.gnu.org/releases/gpsd/

DISTFILES:=		${PKG_NAME}-${PKG_VERSION}.tar.gz

PKG_SUBPKGS:=		GPSD GPSD_CLIENTS
PKGSD_GPSD_CLIENTS:=	GPS client utilities

include ${TOPDIR}/mk/package.mk

$(eval $(call PKG_template,GPSD,gpsd,${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))
$(eval $(call PKG_template,GPSD_CLIENTS,gpsd-clients,${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKGSD_GPSD_CLIENTS},${PKG_SECTION}))

CONFIG_STYLE:=		manual
BUILD_STYLE:=		manual
INSTALL_STYLE:=		manual

do-install:
	(cd $(WRKBUILD); env PATH='$(TARGET_PATH)' CCFLAGS='' DESTDIR='$(WRKINST)' \
		scons install prefix=/usr platform=linux python=no chrpath=no bluez=no usb=no libgpsmm=no)

gpsd-install:
	${INSTALL_DIR} ${IDIR_GPSD}/usr/lib ${IDIR_GPSD}/usr/sbin
	${CP} ${WRKINST}/usr/lib/libgps.so* ${IDIR_GPSD}/usr/lib
	${CP} ${WRKINST}/usr/lib/libgpsd.so* ${IDIR_GPSD}/usr/lib
	${CP} ${WRKINST}/usr/sbin/gpsd ${IDIR_GPSD}/usr/sbin

gpsd-clients-install:
	${INSTALL_DIR} ${IDIR_GPSD_CLIENTS}/usr/bin
	${CP} ${WRKINST}/usr/bin/{cgps,gpxlogger} \
		${IDIR_GPSD_CLIENTS}/usr/bin

include ${TOPDIR}/mk/pkg-bottom.mk
