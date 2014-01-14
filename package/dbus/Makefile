# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include ${TOPDIR}/rules.mk

PKG_NAME:=		dbus
PKG_VERSION:=		1.6.18
PKG_RELEASE:=		1
PKG_MD5SUM:=		b02e9c95027a416987b81f9893831061
PKG_DESCR:=		DBUS library and daemon
PKG_SECTION:=		libs
PKG_DEPENDS:=		libexpat libx11 libuuid
PKG_BUILDDEP:=		expat libX11 util-linux
PKG_URL:=		http://dbus.freedesktop.org/
PKG_SITES:=		http://dbus.freedesktop.org/releases/dbus/
PKG_OPTS:=		dev

ifeq ($(ADK_STATIC),y)
PKG_OPTS+=		libonly
endif

include ${TOPDIR}/mk/package.mk

$(eval $(call PKG_template,DBUS,dbus,${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION},${PKG_OPTS}))

TARGET_LDFLAGS+=	-luuid
TARGET_CFLAGS:=         $(filter-out -flto,$(TARGET_CFLAGS))
CONFIGURE_ARGS+=	--disable-tests \
			--disable-abstract-sockets \
			--enable-checks \
			--disable-verbose-mode \
			--with-xml=expat \
			--with-session-socket-dir=/var/tmp \
			--disable-dnotify \
			--disable-kqueue \
			--disable-systemd \
			--disable-xml-docs \
			--with-x \
			--disable-doxygen-docs
CONFIGURE_ENV+=		ac_cv_have_abstract_sockets=no

pre-install:
	${INSTALL_DIR} $(STAGING_DIR)/usr/include/dbus-1.0/dbus
	$(CP) $(WRKBUILD)/dbus/dbus-arch-deps.h \
		$(STAGING_DIR)/usr/include/dbus-1.0/dbus

dbus-install:
	${INSTALL_DIR} ${IDIR_DBUS}/etc ${IDIR_DBUS}/usr/lib \
		${IDIR_DBUS}/usr/bin ${IDIR_DBUS}/usr/libexec
	${INSTALL_BIN} ${WRKINST}/usr/libexec/dbus-daemon-launch-helper \
		${IDIR_DBUS}/usr/libexec/
	${CP} ${WRKINST}/etc/dbus-1 ${IDIR_DBUS}/etc
	${CP} ${WRKINST}/usr/lib/libdbus-1.so* ${IDIR_DBUS}/usr/lib
	${INSTALL_BIN} ${WRKINST}/usr/bin/dbus-daemon ${IDIR_DBUS}/usr/bin
	${INSTALL_BIN} ${WRKINST}/usr/bin/dbus-launch ${IDIR_DBUS}/usr/bin
	${INSTALL_BIN} ${WRKINST}/usr/bin/dbus-uuidgen ${IDIR_DBUS}/usr/bin
	${INSTALL_BIN} ${WRKINST}/usr/bin/dbus-send ${IDIR_DBUS}/usr/bin
	${INSTALL_BIN} ${WRKINST}/usr/bin/dbus-monitor ${IDIR_DBUS}/usr/bin
	# workaround for dev subpackage
	${INSTALL_DIR} $(IDIR_DBUS_DEV)/usr/include/dbus-1.0/dbus
	$(CP) $(WRKBUILD)/dbus/dbus-arch-deps.h \
		$(IDIR_DBUS_DEV)/usr/include/dbus-1.0/dbus


include ${TOPDIR}/mk/pkg-bottom.mk
