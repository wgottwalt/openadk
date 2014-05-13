# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include ${TOPDIR}/rules.mk

PKG_NAME:=		bluez
PKG_VERSION:=		5.12
PKG_RELEASE:=		1
PKG_MD5SUM:=		5d37e581107b3d6f91b81194a5006407
PKG_DESCR:=		bluetooth applications
PKG_SECTION:=		wifi
PKG_DEPENDS:=		glib dbus libreadline
PKG_BUILDDEP:=		autotool glib dbus readline
PKG_URL:=		http://www.bluez.org/
PKG_SITES:=		http://mirror.anl.gov/pub/linux/bluetooth/
PKG_OPTS:=		dev

include ${TOPDIR}/mk/package.mk

$(eval $(call PKG_template,BLUEZ,bluez,${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))

AUTOTOOL_STYLE:=	autoreconf
ifeq ($(ADK_STATIC),y)
XAKE_FLAGS+=		CCLD="$(TARGET_CC) -all-static -pthread"
endif
TARGET_LDFLAGS+=	-lncurses
CONFIGURE_ENV+=		ac_cv_prog_cc_pie=no
CONFIGURE_ARGS+=	--enable-tools \
			--disable-udev \
			--disable-systemd \
			--disable-obex \
			--disable-pie \
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

include ${TOPDIR}/mk/pkg-bottom.mk
