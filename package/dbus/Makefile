# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include ${TOPDIR}/rules.mk

PKG_NAME:=		dbus
PKG_VERSION:=		1.2.24
PKG_RELEASE:=		1
PKG_MD5SUM:=		565346cecd9cfecf1463540c6086cc2c
PKG_DESCR:=		DBUS library
PKG_SECTION:=		libs
PKG_DEPENDS:=		libexpat
PKG_BUILDDEP:=		expat
PKG_URL:=		http://dbus.freedesktop.org/
PKG_SITES:=		http://dbus.freedesktop.org/releases/dbus/

PKG_SUBPKGS:=		DBUS DBUS_DEV
PKGSC_DBUS_DEV:=	devel
PKGSD_DBUS_DEV:=	DBUS headers

ifeq ($(ADK_STATIC),y)
PKG_OPTS:=		libonly
endif

include ${TOPDIR}/mk/package.mk

$(eval $(call PKG_template,DBUS,dbus,${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION},${PKG_OPTS}))
$(eval $(call PKG_template,DBUS_DEV,dbus-dev,${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKGSD_DBUS_DEV},${PKGSC_DBUS_DEV},${PKG_OPTS}))

CONFIGURE_ARGS+=	--disable-tests \
			--disable-abstract-sockets \
			--without-x \
			--enable-checks \
			--with-xml=expat \
			--disable-dnotify \
			--disable-kqueue \
			--disable-xml-docs \
			--disable-doxygen-docs
CONFIGURE_ENV+=		ac_cv_have_abstract_sockets=no

pre-install:
	${INSTALL_DIR} $(STAGING_DIR)/usr/include/dbus-1.0/dbus
	$(CP) $(WRKBUILD)/dbus/dbus-arch-deps.h \
		$(STAGING_DIR)/usr/include/dbus-1.0/dbus

dbus-install:
	${INSTALL_DIR} ${IDIR_DBUS}/etc ${IDIR_DBUS}/usr/lib \
		${IDIR_DBUS}/usr/bin
	${CP} ${WRKINST}/etc/dbus-1 ${IDIR_DBUS}/etc
	${CP} ${WRKINST}/usr/lib/libdbus-1.so* ${IDIR_DBUS}/usr/lib
	${INSTALL_BIN} ${WRKINST}/usr/bin/dbus-daemon ${IDIR_DBUS}/usr/bin
	${INSTALL_BIN} ${WRKINST}/usr/bin/dbus-launch ${IDIR_DBUS}/usr/bin

dbus-dev-install:
	${INSTALL_DIR} ${IDIR_DBUS_DEV}/usr/include
	${CP} ${WRKINST}/usr/include/* ${IDIR_DBUS_DEV}/usr/include
	${INSTALL_DIR} $(IDIR_DBUS_DEV)/usr/include/dbus-1.0/dbus
	$(CP) $(WRKBUILD)/dbus/dbus-arch-deps.h \
		$(IDIR_DBUS_DEV)/usr/include/dbus-1.0/dbus
	${INSTALL_DIR} ${IDIR_DBUS_DEV}/usr/lib/pkgconfig
	${CP} ${WRKINST}/usr/lib/pkgconfig/*.pc \
		${IDIR_DBUS_DEV}/usr/lib/pkgconfig

include ${TOPDIR}/mk/pkg-bottom.mk
