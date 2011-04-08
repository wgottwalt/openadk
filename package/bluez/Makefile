# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include ${TOPDIR}/rules.mk

PKG_NAME:=		bluez
PKG_VERSION:=		4.89
PKG_RELEASE:=		1
PKG_MD5SUM:=		67fd9ad2852ce01f01b16ddd2336d1ea
PKG_DESCR:=		bluetooth libraries and applications
PKG_SECTION:=		bluetooth
PKG_DEPENDS:=		kmod-bt libusb glib dbus
PKG_BUILDDEP:=		libusb dbus glib
PKG_URL:=		http://www.bluez.org/
PKG_SITES:=		${MASTER_SITE_KERNEL:=bluetooth/}

include ${TOPDIR}/mk/package.mk

$(eval $(call PKG_template,BLUEZ,bluez,${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))

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
ifneq ($(ADK_STATIC),y)
	${INSTALL_DIR} ${IDIR_BLUEZ}/usr/lib
	${CP} ${WRKINST}/usr/lib/libbluetooth.so* ${IDIR_BLUEZ}/usr/lib
endif
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

include ${TOPDIR}/mk/pkg-bottom.mk
