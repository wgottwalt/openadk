# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include ${ADK_TOPDIR}/rules.mk

PKG_NAME:=		avahi
PKG_VERSION:=		0.6.31
PKG_RELEASE:=		4
PKG_MD5SUM:=		2f22745b8f7368ad5a0a3fddac343f2d
PKG_DESCR:=		multicast dns daemon
PKG_SECTION:=		net/dns
PKG_DEPENDS:=		libstdcxx
PKG_BUILDDEP:=		libdaemon expat gdbm glib
PKG_BUILDDEP+=		gettext-tiny gtk+ dbus
PKG_URL:=		http://avahi.org/
PKG_SITES:=		http://avahi.org/download/
PKG_LIBNAME:=		libavahi
PKG_OPTS:=		dev

DISTFILES:=		${PKG_NAME}-${PKG_VERSION}.tar.gz

PKG_SUBPKGS:=		AVAHI_DAEMON AVAHI_DNSCONFD LIBAVAHI
PKGSS_AVAHI_DAEMON:=	libavahi libdaemon libexpat libintl libgtk dbus
PKGSS_AVAHI_DNSCONFD:=	libavahi libdaemon avahi-daemon
PKGSD_AVAHI_DNSCONFD:=	DNS server from mDNS configuration daemon
PKGSD_LIBAVAHI:=	DNS-SD over mDNS library
PKGSC_LIBAVAHI:=	libs/misc

include ${ADK_TOPDIR}/mk/package.mk

$(eval $(call PKG_template,AVAHI_DAEMON,avahi-daemon,${PKG_VERSION}-${PKG_RELEASE},${PKGSS_AVAHI_DAEMON},${PKG_DESCR},${PKG_SECTION}))
$(eval $(call PKG_template,AVAHI_DNSCONFD,avahi-dnsconfd,${PKG_VERSION}-${PKG_RELEASE},${PKGSS_AVAHI_DNSCONFD},${PKGSD_AVAHI_DNSCONFD},${PKG_SECTION}))
$(eval $(call PKG_template,LIBAVAHI,libavahi,${PKG_VERSION}-${PKG_RELEASE},,${PKGSD_LIBAVAHI},${PKGSC_LIBAVAHI},${PKG_OPTS}))

AUTOTOOL_STYLE:=	autoreconf
CONFIGURE_ARGS+=	--enable-glib \
			--enable-gtk2 \
			--enable-libdaemon \
			--enable-dbus \
			--disable-qt3 \
			--disable-qt4 \
			--disable-gtk3 \
			--disable-python \
			--disable-pygtk \
			--disable-python-dbus \
			--disable-mono \
			--disable-monodoc \
			--disable-doxygen-doc \
			--disable-doxygen-dot \
			--disable-doxygen-man \
			--disable-doxygen-rtf \
			--disable-doxygen-xml \
			--disable-doxygen-chm \
			--disable-doxygen-chi \
			--disable-doxygen-html \
			--disable-doxygen-ps \
			--disable-doxygen-pdf \
			--disable-xmltoman \
			--with-distro=none \
			--with-avahi-user=avahi \
			--with-avahi-group=avahi

ifeq ($(ADK_TARGET_USE_SSP),y)
CONFIGURE_ARGS+=	--enable-stack-protector
else
CONFIGURE_ARGS+=	--disable-stack-protector
endif

avahi-daemon-install:
	${INSTALL_DIR} ${IDIR_AVAHI_DAEMON}/etc/dbus-1/system.d
	$(INSTALL_DATA) $(WRKINST)/etc/dbus-1/system.d/avahi-dbus.conf \
		${IDIR_AVAHI_DAEMON}/etc/dbus-1/system.d
	${INSTALL_DIR} ${IDIR_AVAHI_DAEMON}/etc/avahi
	${INSTALL_DATA} ./files/avahi-daemon.conf \
		${IDIR_AVAHI_DAEMON}/etc/avahi
	${INSTALL_DIR} ${IDIR_AVAHI_DAEMON}/etc/avahi/services
	${INSTALL_DATA} ./files/service-http \
		${IDIR_AVAHI_DAEMON}/etc/avahi/services/http.service
	${INSTALL_DATA} ./files/service-ssh \
		${IDIR_AVAHI_DAEMON}/etc/avahi/services/ssh.service
	${INSTALL_DIR} ${IDIR_AVAHI_DAEMON}/usr/sbin
	${CP} ${WRKINST}/usr/sbin/avahi-daemon \
		${IDIR_AVAHI_DAEMON}/usr/sbin

avahi-dnsconfd-install:
	${INSTALL_DIR} ${IDIR_AVAHI_DNSCONFD}/etc/avahi
	${CP} ${WRKINST}/etc/avahi/avahi-dnsconfd.action \
		${IDIR_AVAHI_DNSCONFD}/etc/avahi
	${INSTALL_DIR} ${IDIR_AVAHI_DNSCONFD}/usr/sbin
	${CP} ${WRKINST}/usr/sbin/avahi-dnsconfd \
		${IDIR_AVAHI_DNSCONFD}/usr/sbin

libavahi-install:
	${INSTALL_DIR} ${IDIR_LIBAVAHI}/usr/lib
	${CP} ${WRKINST}/usr/lib/libavahi-common.so* \
		${IDIR_LIBAVAHI}/usr/lib
	${CP} ${WRKINST}/usr/lib/libavahi-client.so* \
		${IDIR_LIBAVAHI}/usr/lib
	${CP} ${WRKINST}/usr/lib/libavahi-core.so* \
		${IDIR_LIBAVAHI}/usr/lib
	${CP} ${WRKINST}/usr/lib/libavahi-glib.so* \
		${IDIR_LIBAVAHI}/usr/lib

include ${ADK_TOPDIR}/mk/pkg-bottom.mk
