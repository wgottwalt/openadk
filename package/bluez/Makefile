# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include ${ADK_TOPDIR}/rules.mk

PKG_NAME:=		bluez
PKG_VERSION:=		5.39
PKG_RELEASE:=		1
PKG_HASH:=		21d1bc9150d3576296595217efb98a746b592389d25d5637e8bee5da7272593b
PKG_DESCR:=		bluetooth applications
PKG_SECTION:=		net/wifi
PKG_DEPENDS:=		glib dbus libreadline
PKG_BUILDDEP:=		glib dbus readline
PKG_URL:=		http://www.bluez.org/
PKG_SITES:=		http://www.kernel.org/pub/linux/bluetooth/

include ${ADK_TOPDIR}/mk/package.mk

$(eval $(call PKG_template,BLUEZ,bluez,${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))

TARGET_LDFLAGS+=	-lncurses

ifeq ($(ADK_TARGET_USE_STATIC_LIBS),y)
XAKE_FLAGS+=		CCLD="$(TARGET_CC) -all-static -pthread"
endif

ifeq ($(ADK_TARGET_USE_PIE),y)
CONFIGURE_ARGS+=	--enable-pie
else
CONFIGURE_ENV+=		ac_cv_prog_cc_pie=no
CONFIGURE_ARGS+=	--disable-pie
endif

CONFIGURE_ARGS+=	--enable-tools \
			--disable-udev \
			--disable-test \
			--disable-systemd \
			--disable-obex \
			--disable-cups

bluez-install:
	${INSTALL_DIR} $(IDIR_BLUEZ)/etc/dbus-1/system.d
	${INSTALL_DIR} ${IDIR_BLUEZ}/usr/bin
	${CP} ${WRKINST}/usr/bin/* ${IDIR_BLUEZ}/usr/bin
	${INSTALL_DIR} ${IDIR_BLUEZ}/etc/bluetooth
	$(INSTALL_DATA) ./files/main.conf \
		${IDIR_BLUEZ}/etc/bluetooth
	$(INSTALL_DATA) ./files/bluetooth.conf \
		$(IDIR_BLUEZ)/etc/dbus-1/system.d

include ${ADK_TOPDIR}/mk/pkg-bottom.mk
