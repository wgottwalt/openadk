# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include ${TOPDIR}/rules.mk

PKG_NAME:=		radvd
PKG_VERSION:=		1.10.0
PKG_RELEASE:=		1
PKG_MD5SUM:=		13ef482ed4de334bede07839806a1689
PKG_DESCR:=		routing advertisement daemon for IPv6
PKG_SECTION:=		ipv6
PKG_DEPENDS:=		libdaemon
PKG_BUILDDEP:=		autotool libdaemon
PKG_URL:=		http://www.litech.org/radvd/
PKG_SITES:=		http://v6web.litech.org/radvd/dist/

PKG_HOST_DEPENDS:=	!freebsd

include ${TOPDIR}/mk/package.mk

$(eval $(call PKG_template,RADVD,radvd,${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))

AUTOTOOL_STYLE:=	autoreconf
CONFIGURE_ARGS+=	--with-configfile=/etc/radvd.conf \
			--with-logfile=/var/log/radvd.log \
			--with-pidfile=/var/run/radvd.pid

radvd-install:
	${INSTALL_DIR} ${IDIR_RADVD}/etc ${IDIR_RADVD}/usr/sbin
	${INSTALL_DATA} ./files/radvd.conf ${IDIR_RADVD}/etc/
	${INSTALL_BIN} ${WRKINST}/usr/sbin/radvd ${IDIR_RADVD}/usr/sbin/
	${INSTALL_BIN} ${WRKINST}/usr/sbin/radvdump ${IDIR_RADVD}/usr/sbin/

include ${TOPDIR}/mk/pkg-bottom.mk
