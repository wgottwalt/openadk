# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include ${TOPDIR}/rules.mk

PKG_NAME:=		dbus
PKG_VERSION:=		1.2.14
PKG_RELEASE:=		1
PKG_MD5SUM:=		2c267ccd45d0b18db8c9edacad63ec98
PKG_DESCR:=		DBUS library
PKG_SECTION:=		net
PKG_DEPENDS:=		libexpat
PKG_URL:=		http://dbus.freedesktop.org
PKG_SITES:=		http://dbus.freedesktop.org/releases/dbus/

include ${TOPDIR}/mk/package.mk

$(eval $(call PKG_template,DBUS,${PKG_NAME},${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))

CONFIGURE_STYLE:=	gnu
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
BUILD_STYLE:=		auto
INSTALL_STYLE:=		confprog auto

post-install:
	${INSTALL_DIR} ${IDIR_DBUS}/etc ${IDIR_DBUS}/usr/lib ${IDIR_DBUS}/usr/bin
	${INSTALL_DIR} $(STAGING_DIR)/usr/include/dbus-1.0/dbus
	${CP} ${WRKINST}/etc/dbus-1 ${IDIR_DBUS}/etc/
	${CP} ${WRKINST}/usr/lib/libdbus-1.so.* ${IDIR_DBUS}/usr/lib/
	$(CP) $(WRKINST)/usr/lib/dbus-1.0/include/dbus/dbus-arch-deps.h \
		$(STAGING_DIR)/usr/include/dbus-1.0/dbus/
	${INSTALL_BIN} ${WRKINST}/usr/bin/dbus-daemon ${IDIR_DBUS}/usr/bin/
	${INSTALL_BIN} ${WRKINST}/usr/bin/dbus-launch ${IDIR_DBUS}/usr/bin/

include ${TOPDIR}/mk/pkg-bottom.mk
