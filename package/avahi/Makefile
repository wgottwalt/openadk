# $Id$
#-
# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include ${TOPDIR}/rules.mk

PKG_NAME:=		avahi
PKG_VERSION:=		0.6.25
PKG_RELEASE:=		1
PKG_MD5SUM:=		a83155a6e29e3988f07e5eea3287b21e
PKG_DESCR:=		mDNS/DNS-SD (aka RendezVous/Bonjour/ZeroConf) daemon
PKG_SECTION:=		net
PKG_DEPENDS:=		libavahi libdaemon libexpat
PKG_URL:=		http://avahi.org
PKG_SITES:=		http://avahi.org/download/
PKG_DEPENDS_1:=		libavahi libdaemon avahi-daemon
PKG_DESCR_1:=		Unicast DNS server from mDNS/DNS-SD configuration daemon
PKG_DESCR_2:=		DNS-SD over mDNS (aka RendezVous/Bonjour/ZeroConf) library
PKG_SECTION_2:=		libs

include ${TOPDIR}/mk/package.mk

$(eval $(call PKG_template,AVAHI_DAEMON,avahi-daemon,${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))
$(eval $(call PKG_template,AVAHI_DNSCONFD,avahi-dnsconfd,${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS_1},${PKG_DESCR_1},${PKG_SECTION}))
$(eval $(call PKG_template,LIBAVAHI,libavahi,${PKG_VERSION}-${PKG_RELEASE},,${PKG_DESCR_2},${PKG_SECTION_2}))

CONFIGURE_STYLE=	gnu
CONFIGURE_ARGS+=	--disable-glib \
			--disable-qt3 \
			--disable-qt4 \
			--disable-gtk \
			--disable-dbus \
			--enable-expat \
			--enable-libdaemon \
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
BUILD_STYLE=		auto
INSTALL_STYLE=		auto

post-install:
	# avahi daemon
	${INSTALL_DIR} ${IDIR_AVAHI_DAEMON}/etc/avahi
	${INSTALL_DATA} ./files/avahi-daemon.conf ${IDIR_AVAHI_DAEMON}/etc/avahi/
	${INSTALL_DIR} ${IDIR_AVAHI_DAEMON}/etc/avahi/services
	${INSTALL_DATA} ./files/service-http \
		${IDIR_AVAHI_DAEMON}/etc/avahi/services/http.service
	${INSTALL_DATA} ./files/service-ssh \
		${IDIR_AVAHI_DAEMON}/etc/avahi/services/ssh.service
	${INSTALL_DIR} ${IDIR_AVAHI_DAEMON}/usr/sbin
	${CP} ${WRKINST}/usr/sbin/avahi-daemon ${IDIR_AVAHI_DAEMON}/usr/sbin/
	# avahi dnsconfd
	${INSTALL_DIR} ${IDIR_AVAHI_DNSCONFD}/etc/avahi
	${CP} ${WRKINST}/etc/avahi/avahi-dnsconfd.action \
		${IDIR_AVAHI_DNSCONFD}/etc/avahi/
	${INSTALL_DIR} ${IDIR_AVAHI_DNSCONFD}/usr/sbin
	${CP} ${WRKINST}/usr/sbin/avahi-dnsconfd ${IDIR_AVAHI_DNSCONFD}/usr/sbin/
	# libavahi
	${INSTALL_DIR} ${IDIR_LIBAVAHI}/usr/lib
	${CP} ${WRKINST}/usr/lib/libavahi-common.so.* ${IDIR_LIBAVAHI}/usr/lib/
	${CP} ${WRKINST}/usr/lib/libavahi-core.so.* ${IDIR_LIBAVAHI}/usr/lib/
	${SED} 's,-I$$(includedir),,g' ${WRKINST}/usr/lib/pkgconfig/avahi-core.pc
	${SED} 's,-L$$(libdir),,g' ${WRKINST}/usr/lib/pkgconfig/avahi-core.pc

include ${TOPDIR}/mk/pkg-bottom.mk
