# $Id$
#-
# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include ${TOPDIR}/rules.mk

PKG_NAME:=		collectd
PKG_VERSION:=		4.6.2
PKG_RELEASE:=		1
PKG_MD5SUM:=		9eee46a6330780d6e6b41155b159f4f9
MASTER_SITES:=		http://verplant.org/collectd/files/

include ${TOPDIR}/mk/package.mk

$(eval $(call PKG_template,COLLECTD,collectd,${PKG_VERSION}-${PKG_RELEASE},${ARCH}))

ifneq (${ADK_PACKAGE_COLLECTD_CPU},y)
DISABLE_CPU:=--disable-cpu
endif
ifneq (${ADK_PACKAGE_COLLECTD_LOAD},y)
DISABLE_LOAD:=--disable-load
endif
ifneq (${ADK_PACKAGE_COLLECTD_MEMORY},y)
DISABLE_MEMORY:=--disable-memory
endif
ifneq (${ADK_PACKAGE_COLLECTD_PING},y)
DISABLE_PING:=--disable-ping
endif

CONFIGURE_STYLE=	gnu
CONFIGURE_ARGS+=	--disable-apache \
			--disable-apcups \
			--disable-apple_sensors \
			--disable-ascent \
			--disable-battery \
			${DISABLE_CPU} \
			--disable-cpufreq \
			--disable-disk \
			--enable-csv \
			--disable-df \
			--disable-dns \
			--disable-email \
			--disable-entropy \
			--disable-exec \
			--disable-hddtemp \
			--disable-interface \
			--disable-iptables \
			--disable-irq \
			${DISABLE_LOAD} \
			--disable-mbmon \
			--disable-memcached \
			${DISABLE_MEMORY} \
			--disable-multimeter \
			--disable-mysql \
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
			--disable-teamspeak2 \
			--disable-thermal \
			--disable-unixsock \
			--disable-users \
			--disable-vserver \
			--enable-wireless \
			--with-fp-layout=nothing \
			--with-nan-emulation

XAKE_FLAGS+=		LIBS='-lm'
BUILD_STYLE=		auto
INSTALL_STYLE=		auto

post-install:
	${INSTALL_DIR} ${IDIR_COLLECTD}/etc/init.d
	${INSTALL_DIR} ${IDIR_COLLECTD}/usr/sbin
	${INSTALL_DIR} ${IDIR_COLLECTD}/usr/lib/collectd
	${INSTALL_BIN} ./files/collectd.init \
		${IDIR_COLLECTD}/etc/init.d/collectd
	${CP} ${WRKINST}/usr/sbin/collectd ${IDIR_COLLECTD}/usr/sbin/
	${CP} ${WRKINST}/usr/lib/collectd/*.so ${IDIR_COLLECTD}/usr/lib/collectd/

include ${TOPDIR}/mk/pkg-bottom.mk
