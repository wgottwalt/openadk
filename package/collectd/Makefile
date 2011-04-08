# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include ${TOPDIR}/rules.mk

PKG_NAME:=		collectd
PKG_VERSION:=		4.10.0
PKG_RELEASE:=		1
PKG_MD5SUM:=		c473cf8e9f22f5a9f7ef4c5be1b0c436
PKG_DESCR:=		System statistics collection daemon
PKG_SECTION:=		misc
PKG_DEPENDS:=		libpthread
PKG_URL:=		http://collectd.org/
PKG_SITES:=		http://collectd.org/files/

PKG_FLAVOURS_COLLECD:=	WITH_CPU WITH_LOAD WITH_MEMORY WITH_PING
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

CONFIGURE_ARGS+=	--disable-apache \
			--disable-apcups \
			--disable-apple_sensors \
			--disable-ascent \
			--disable-battery \
			${DISABLE_CPU} \
			--disable-cpufreq \
			--disable-contextswitch \
			--disable-disk \
			--enable-csv \
			--disable-df \
			--disable-dns \
			--disable-email \
			--disable-entropy \
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
			--disable-memcached \
			${DISABLE_MEMORY} \
			--disable-multimeter \
			--disable-mysql \
			--disable-openvpn \
			--disable-python \
			--disable-postgresql \
			--disable-powerdns \
			--disable-network \
			--disable-nginx \
			--disable-nfs \
			--disable-ntpd \
			--disable-nut \
			--disable-perl \
			${DISABLE_PING} \
			--disable-processes \
			--disable-sensors \
			--disable-serial \
			--disable-logfile \
			--disable-swap \
			--disable-syslog \
			--disable-tape \
			--disable-target_notification \
			--disable-target_replace \
			--disable-target_set \
			--disable-teamspeak2 \
			--disable-ted \
			--disable-thermal \
			--disable-unixsock \
			--disable-users \
			--disable-vserver \
			--disable-wireless \
			--disable-write_http \
			--with-fp-layout=nothing \
			--without-java \
			--without-python \
			--without-libiptc \
			--with-nan-emulation

TARGET_CFLAGS:=         $(filter-out -flto,$(TARGET_CFLAGS))
XAKE_FLAGS+=		LIBS='-lm'

post-install:
	${INSTALL_DIR} ${IDIR_COLLECTD}/usr/lib/collectd \
		${IDIR_COLLECTD}/usr/sbin/ ${IDIR_COLLECTD}/etc
	${INSTALL_BIN} ${WRKINST}/usr/sbin/collectd ${IDIR_COLLECTD}/usr/sbin/
	${CP} ${WRKINST}/usr/lib/collectd/*.so \
		${IDIR_COLLECTD}/usr/lib/collectd/
	${INSTALL_DATA} ./files/collectd.conf \
		${IDIR_COLLECTD}/etc

include ${TOPDIR}/mk/pkg-bottom.mk
