# $Id$
#-
# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include ${TOPDIR}/rules.mk

PKG_NAME:=		avahi
PKG_VERSION:=		0.6.16
PKG_RELEASE:=		6
PKG_MD5SUM:=		3cbc460bbd55bae35f7b57443c063640
MASTER_SITES:=		http://avahi.org/download/

include ${TOPDIR}/mk/package.mk

$(eval $(call PKG_template,AVAHI_DAEMON,avahi-daemon,${PKG_VERSION}-${PKG_RELEASE},${ARCH}))
$(eval $(call PKG_template,AVAHI_DNSCONFD,avahi-dnsconfd,${PKG_VERSION}-${PKG_RELEASE},${ARCH}))
$(eval $(call PKG_template,LIBAVAHI,libavahi,${PKG_VERSION}-${PKG_RELEASE},${ARCH}))

TCFLAGS+=		-DNDEBUG
CONFIGURE_STYLE=	gnu
CONFIGURE_ENV+=		ac_cv_func_malloc_0_nonnull=yes \
			ac_cv_func_realloc_0_nonnull=yes \
			ac_cv_func_memcmp_working=yes
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
#XXX maybe unneeded?
#XAKE_FLAGS+=		PKG_CONFIG_PATH=${STAGING_DIR}/usr/lib/pkgconfig

post-install:
	# avahi daemon
	${INSTALL_DIR} ${IDIR_AVAHI_DAEMON}/etc/avahi
	${INSTALL_DATA} ./files/avahi-daemon.conf ${IDIR_AVAHI_DAEMON}/etc/avahi/
	${INSTALL_DIR} ${IDIR_AVAHI_DAEMON}/etc/avahi/services
	${INSTALL_DATA} ./files/service-http \
		${IDIR_AVAHI_DAEMON}/etc/avahi/services/http.service
	${INSTALL_DATA} ./files/service-ssh \
		${IDIR_AVAHI_DAEMON}/etc/avahi/services/ssh.service
	${INSTALL_DIR} ${IDIR_AVAHI_DAEMON}/etc/init.d
	${INSTALL_BIN} ./files/avahi-daemon.init \
		${IDIR_AVAHI_DAEMON}/etc/init.d/avahi-daemon
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
