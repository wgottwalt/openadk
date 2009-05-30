# $Id$
#-
# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include ${TOPDIR}/rules.mk

PKG_NAME:=		bluez
PKG_VERSION:=		4.40
PKG_RELEASE:=		1
PKG_MD5SUM:=		a25fa37c97c309338649f6a5fd4cea76
PKG_DESCR:=		bluetooth libraries and applications
PKG_SECTION:=		bluetooth
PKG_DEPENDS:=		kmod-bluetooth
PKG_URL:=		http://www.bluez.org
PKG_SITES:=		${MASTER_SITE_KERNEL:=bluetooth/}

include ${TOPDIR}/mk/package.mk

$(eval $(call PKG_template,BLUEZ,${PKG_NAME},${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))

CONFIGURE_STYLE:=	gnu
CONFIGURE_ARGS+=	--enable-tools \
			--enable-alsa \
			--enable-usb \
			--enable-bccmd \
			--enable-hidd \
			--enable-pand \
			--enable-dund \
			--disable-cups
BUILD_STYLE:=		auto
INSTALL_STYLE:=		auto

post-install:
	${INSTALL_DIR} ${IDIR_BLUEZ}/usr/lib
	${CP} ${WRKINST}/usr/lib/libbluetooth.so.* ${IDIR_BLUEZ}/usr/lib/
	${INSTALL_DIR} $(IDIR_BLUEZ)/etc/dbus-1/system.d
	${INSTALL_DIR} ${IDIR_BLUEZ}/usr/bin
	${CP} ${WRKINST}/usr/bin/* ${IDIR_BLUEZ}/usr/bin/
	${INSTALL_DIR} ${IDIR_BLUEZ}/usr/sbin
	${CP} ${WRKINST}/usr/sbin/* ${IDIR_BLUEZ}/usr/sbin/
	${INSTALL_DIR} ${IDIR_BLUEZ}/etc/bluetooth
	${CP} ${WRKINST}/etc/bluetooth/rfcomm.conf \
	    ${IDIR_BLUEZ}/etc/bluetooth/
	$(INSTALL_DATA) $(WRKINST)/etc/dbus-1/system.d/bluetooth.conf \
		$(IDIR_BLUEZ)/etc/dbus-1/system.d

include ${TOPDIR}/mk/pkg-bottom.mk
