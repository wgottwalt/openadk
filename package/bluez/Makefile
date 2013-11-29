# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include ${TOPDIR}/rules.mk

PKG_NAME:=		bluez
PKG_VERSION:=		4.101
PKG_RELEASE:=		2
PKG_MD5SUM:=		fb42cb7038c380eb0e2fa208987c96ad
PKG_DESCR:=		bluetooth applications
PKG_SECTION:=		bluetooth
PKG_DEPENDS:=		kmod-bt libbluetooth
PKG_URL:=		http://www.bluez.org/
PKG_SITES:=		http://mirror.anl.gov/pub/linux/bluetooth/
PKG_LIBNAME:=		libbluetooth
PKG_OPTS:=		dev

PKG_SUBPKGS:=		BLUEZ LIBBLUETOOTH
PKGSC_LIBBLUETOOTH:=	libs
PKGSD_LIBBLUETOOTH:=	bluetooth libraries
PKGSS_LIBBLUETOOTH:=	glib libusb dbus libusb-compat
PKGSB_LIBBLUETOOTH:=	glib libusb dbus libusb-compat

PKG_ARCH_DEPENDS:=	!avr32

ifeq ($(ADK_STATIC),y)
PKG_OPTS+=              libmix
endif

include ${TOPDIR}/mk/package.mk

$(eval $(call PKG_template,BLUEZ,bluez,${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))
$(eval $(call PKG_template,LIBBLUETOOTH,libbluetooth,${PKG_VERSION}-${PKG_RELEASE},${PKGSS_LIBBLUETOOTH},${PKGSD_LIBBLUETOOTH},${PKGSC_LIBBLUETOOTH},${PKG_OPTS}))

ifeq ($(ADK_STATIC),y)
XAKE_FLAGS+=		CCLD="$(TARGET_CC) -all-static -pthread"
endif
TARGET_CFLAGS:=         $(filter-out -flto,$(TARGET_CFLAGS))
CONFIGURE_ENV+=		ac_cv_prog_cc_pie=no
CONFIGURE_ARGS+=	--enable-tools \
			--enable-alsa \
			--enable-usb \
			--enable-bccmd \
			--enable-hidd \
			--enable-pand \
			--enable-dund \
			--enable-netlink \
			--disable-pie \
			--disable-cups

bluez-install:
	${INSTALL_DIR} $(IDIR_BLUEZ)/etc/dbus-1/system.d
	${INSTALL_DIR} ${IDIR_BLUEZ}/usr/bin
	${CP} ${WRKINST}/usr/bin/* ${IDIR_BLUEZ}/usr/bin
	${INSTALL_DIR} ${IDIR_BLUEZ}/usr/sbin
	${CP} ${WRKINST}/usr/sbin/* ${IDIR_BLUEZ}/usr/sbin
	${INSTALL_DIR} ${IDIR_BLUEZ}/etc/bluetooth
	$(INSTALL_DATA) ./files/main.conf \
		${IDIR_BLUEZ}/etc/bluetooth
	$(INSTALL_DATA) ./files/bluetooth.conf \
		$(IDIR_BLUEZ)/etc/dbus-1/system.d

libbluetooth-install:
	${INSTALL_DIR} ${IDIR_LIBBLUETOOTH}/usr/lib
	${CP} ${WRKINST}/usr/lib/libbluetooth.so* ${IDIR_LIBBLUETOOTH}/usr/lib

include ${TOPDIR}/mk/pkg-bottom.mk
