# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include ${ADK_TOPDIR}/rules.mk

PKG_NAME:=		dbus
PKG_VERSION:=		1.8.4
PKG_RELEASE:=		1
PKG_MD5SUM:=		4717cb8ab5b80978fcadf2b4f2f72e1b
PKG_DESCR:=		desktop bus daemon
PKG_SECTION:=		sys/misc
PKG_DEPENDS:=		libdbus libexpat
PKG_BUILDDEP:=		expat util-linux
PKG_URL:=		http://dbus.freedesktop.org/
PKG_SITES:=		http://dbus.freedesktop.org/releases/dbus/
PKG_LIBNAME:=		libdbus
PKG_OPTS:=		dev

DISTFILES:=		${PKG_NAME}-${PKG_VERSION}.tar.gz

PKG_SUBPKGS:=		DBUS LIBDBUS
PKGSD_LIBDBUS:=		DBUS library
PKGSC_LIBDBUS:=		libs/misc
PKGSS_LIBDBUS:=		libexpat libuuid

include ${ADK_TOPDIR}/mk/package.mk

$(eval $(call PKG_template,DBUS,dbus,${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))
$(eval $(call PKG_template,LIBDBUS,libdbus,${PKG_VERSION}-${PKG_RELEASE},${PKGSS_LIBDBUS},${PKGSD_LIBDBUS},${PKGSC_LIBDBUS},${PKG_OPTS}))

TARGET_LDFLAGS+=	-luuid
CONFIGURE_ARGS+=	--disable-tests \
			--disable-abstract-sockets \
			--enable-checks \
			--disable-verbose-mode \
			--with-session-socket-dir=/var/tmp \
			--disable-kqueue \
			--disable-systemd \
			--disable-xml-docs \
			--without-x \
			--disable-doxygen-docs
CONFIGURE_ENV+=		ac_cv_have_abstract_sockets=no

pre-install:
	${INSTALL_DIR} $(STAGING_TARGET_DIR)/usr/include/dbus-1.0/dbus
	$(CP) $(WRKBUILD)/dbus/dbus-arch-deps.h \
		$(STAGING_TARGET_DIR)/usr/include/dbus-1.0/dbus

libdbus-install:
	${INSTALL_DIR} ${IDIR_LIBDBUS}/usr/lib
	${CP} ${WRKINST}/usr/lib/libdbus-1.so* ${IDIR_LIBDBUS}/usr/lib

dbus-install:
	${INSTALL_DIR} ${IDIR_DBUS}/etc \
		${IDIR_DBUS}/usr/bin ${IDIR_DBUS}/usr/libexec
	${INSTALL_BIN} ${WRKINST}/usr/libexec/dbus-daemon-launch-helper \
		${IDIR_DBUS}/usr/libexec/
	${CP} ${WRKINST}/etc/dbus-1 ${IDIR_DBUS}/etc
	${INSTALL_BIN} ${WRKINST}/usr/bin/dbus-daemon ${IDIR_DBUS}/usr/bin
	${INSTALL_BIN} ${WRKINST}/usr/bin/dbus-launch ${IDIR_DBUS}/usr/bin
	${INSTALL_BIN} ${WRKINST}/usr/bin/dbus-uuidgen ${IDIR_DBUS}/usr/bin
	${INSTALL_BIN} ${WRKINST}/usr/bin/dbus-send ${IDIR_DBUS}/usr/bin
	${INSTALL_BIN} ${WRKINST}/usr/bin/dbus-monitor ${IDIR_DBUS}/usr/bin
	# workaround for dev subpackage
	${INSTALL_DIR} $(IDIR_DBUS_DEV)/usr/include/dbus-1.0/dbus
	$(CP) $(WRKBUILD)/dbus/dbus-arch-deps.h \
		$(IDIR_DBUS_DEV)/usr/include/dbus-1.0/dbus

include ${ADK_TOPDIR}/mk/pkg-bottom.mk
