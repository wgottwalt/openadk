# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include ${TOPDIR}/rules.mk

PKG_NAME:=		gpsd
PKG_VERSION:=		3.9
PKG_RELEASE:=		1
PKG_MD5SUM:=		53a88f24a0973d23427e82e9a8914f19
PKG_DESCR:=		An interface daemon for GPS receivers
PKG_SECTION:=		misc
PKG_DEPENDS:=		libpthread
PKG_BUILDDEP:=		ncurses scons-host python2-host
PKG_URL:=		http://catb.org/gpsd/
PKG_SITES:=		http://download-mirror.savannah.gnu.org/releases/gpsd/

PKG_SUBPKGS:=		GPSD GPSD_CLIENTS
PKGSD_GPSD_CLIENTS:=	GPS client utilities

include ${TOPDIR}/mk/package.mk

$(eval $(call PKG_template,GPSD,gpsd,${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))
$(eval $(call PKG_template,GPSD_CLIENTS,gpsd-clients,${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKGSD_GPSD_CLIENTS},${PKG_SECTION}))

CONFIG_STYLE:=		manual
BUILD_STYLE:=		manual
INSTALL_STYLE:=		manual

do-install:
	(cd $(WRKBUILD); PATH='$(TARGET_PATH)' CCFLAGS='' \
		scons install prefix=$(WRKINST)/usr python=no chrpath=no bluez=no usb=no libgpsmm=no)

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
