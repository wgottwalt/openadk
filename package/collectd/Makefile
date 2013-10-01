# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include ${TOPDIR}/rules.mk

PKG_NAME:=		collectd
PKG_VERSION:=		5.4.0
PKG_RELEASE:=		1
PKG_MD5SUM:=		d4176b3066f3b85d85343d3648ea43f6
PKG_DESCR:=		System statistics collection daemon
PKG_SECTION:=		misc
PKG_BUILDDEP:=		libtool
PKG_DEPENDS:=		libpthread libltdl
PKG_URL:=		http://collectd.org/
PKG_SITES:=		http://collectd.org/files/

PKG_FLAVOURS_COLLECTD:=	WITH_CPU WITH_LOAD WITH_MEMORY WITH_PING
PKG_FLAVOURS_COLLECTD+=	WITH_RRD
PKGFD_WITH_RRD:=	enable RRD output
PKGFB_WITH_RRD:=	rrdtool
PKGFS_WITH_RRD:=	librrd
PKGFD_WITH_CPU:=	collect CPU statistics
PKGFD_WITH_LOAD:=	collect system load statistics
PKGFD_WITH_MEMORY:=	collect memory usage statistics
PKGFD_WITH_PING:=	enable ping statistic plugin

include ${TOPDIR}/mk/package.mk

$(eval $(call PKG_template,COLLECTD,${PKG_NAME},${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))

ifneq (${ADK_PACKAGE_COLLECTD_WITH_CPU},y)
DISABLE_CPU:=--disable-cpu
endif
ifneq (${ADK_PACKAGE_COLLECTD_WITH_LOAD},y)
DISABLE_LOAD:=--disable-load
endif
ifneq (${ADK_PACKAGE_COLLECTD_WITH_MEMORY},y)
DISABLE_MEMORY:=--disable-memory
endif
ifneq (${ADK_PACKAGE_COLLECTD_WITH_PING},y)
DISABLE_PING:=--disable-ping
endif

CONFIGURE_ARGS+=	--disable-aggregation \
			--disable-apache \
			--disable-apcups \
			--disable-apple_sensors \
			--disable-ascent \
			--disable-battery \
			--disable-cgroups \
			--disable-conntrack \
			${DISABLE_CPU} \
			--disable-cpufreq \
			--disable-contextswitch \
			--disable-disk \
			--enable-csv \
			--disable-df \
			--disable-dns \
			--disable-email \
			--disable-entropy \
			--disable-ethstat \
			--disable-exec \
			--disable-filecount \
			--disable-fscache \
			--disable-hddtemp \
			--disable-interface \
			--disable-iptables \
			--disable-ipvs \
			--disable-irq \
			${DISABLE_LOAD} \
			--disable-madwifi \
			--disable-mbmon \
			--disable-md \
			--disable-memcached \
			${DISABLE_MEMORY} \
			--disable-multimeter \
			--disable-mysql \
			--disable-network \
			--disable-nginx \
			--disable-nfs \
			--disable-ntpd \
			--disable-numa \
			--disable-nut \
			--disable-olsrd \
			--disable-openvpn \
			--disable-python \
			--disable-postgresql \
			--disable-powerdns \
			--disable-perl \
			${DISABLE_PING} \
			--disable-processes \
			--disable-protocols \
			--disable-sensors \
			--disable-serial \
			--disable-logfile \
			--disable-statsd \
			--disable-swap \
			--enable-syslog \
			--disable-tape \
			--disable-target_notification \
			--disable-target_replace \
			--disable-target_set \
			--disable-tcpconns \
			--disable-teamspeak2 \
			--disable-ted \
			--disable-thermal \
			--disable-unixsock \
			--disable-users \
			--disable-uptime \
			--disable-uuid \
			--disable-vserver \
			--disable-wireless \
			--disable-write_graphite \
			--disable-write_http \
			--with-fp-layout=nothing \
			--without-java \
			--without-python \
			--without-libiptc \
			--with-nan-emulation

TARGET_CFLAGS:=         $(filter-out -flto,$(TARGET_CFLAGS))
XAKE_FLAGS+=		LIBS='-lm -lltdl'

post-install:
	${INSTALL_DIR} ${IDIR_COLLECTD}/usr/lib/collectd \
		${IDIR_COLLECTD}/usr/sbin ${IDIR_COLLECTD}/etc
	${INSTALL_DIR} ${IDIR_COLLECTD}/usr/share/collectd
	${CP} ${WRKINST}/usr/share/collectd/types.db \
		${IDIR_COLLECTD}/usr/share/collectd
	${INSTALL_BIN} ${WRKINST}/usr/sbin/collectd ${IDIR_COLLECTD}/usr/sbin
	${CP} ${WRKINST}/usr/lib/collectd/*.so \
		${IDIR_COLLECTD}/usr/lib/collectd
	${INSTALL_DATA} ./files/collectd.conf \
		${IDIR_COLLECTD}/etc

include ${TOPDIR}/mk/pkg-bottom.mk
