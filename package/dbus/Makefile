# $Id$
#-
# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include ${TOPDIR}/rules.mk

PKG_NAME:=		dbus
PKG_VERSION:=		1.0.2
PKG_RELEASE:=		7
PKG_MD5SUM:=		0552a9b54beb4a044951b7cdbc8fc855
MASTER_SITES:=		http://dbus.freedesktop.org/releases/dbus/

include ${TOPDIR}/mk/package.mk

$(eval $(call PKG_template,DBUS,dbus,${PKG_VERSION}-${PKG_RELEASE}))

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
	${INSTALL_DIR} ${IDIR_DBUS}/etc
	${INSTALL_DIR} ${IDIR_DBUS}/usr/lib
	${INSTALL_DIR} ${IDIR_DBUS}/usr/bin
	${INSTALL_DIR} $(STAGING_DIR)/usr/include/dbus-1.0/dbus
	${CP} ${WRKINST}/etc/dbus-1 ${IDIR_DBUS}/etc/
	${CP} ${WRKINST}/usr/lib/libdbus-1.so.* ${IDIR_DBUS}/usr/lib/
	$(CP) $(WRKINST)/usr/lib/dbus-1.0/include/dbus/dbus-arch-deps.h \
		$(STAGING_DIR)/usr/include/dbus-1.0/dbus/
	${INSTALL_BIN} ${WRKINST}/usr/bin/dbus-daemon ${IDIR_DBUS}/usr/bin/
	${INSTALL_BIN} ${WRKINST}/usr/bin/dbus-launch ${IDIR_DBUS}/usr/bin/
	${INSTALL_DIR} ${IDIR_DBUS}/etc/init.d
	${INSTALL_BIN} ./files/dbus.init \
		${IDIR_DBUS}/etc/init.d/dbus

include ${TOPDIR}/mk/pkg-bottom.mk
