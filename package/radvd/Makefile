# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include ${TOPDIR}/rules.mk

PKG_NAME:=		radvd
PKG_VERSION:=		1.5
PKG_RELEASE:=		1
PKG_MD5SUM:=		78598b60ed9d64920739189c3dc0934d
PKG_DESCR:=		Routing Advertisement Daemon for IPv6
PKG_SECTION:=		ipv6
PKG_DEPENDS:=		kmod-ipv6
PKG_URL:=		http://www.litech.org/radvd/
PKG_SITES:=		http://v6web.litech.org/radvd/dist/

PKG_HOST_DEPENDS:=	!freebsd

include ${TOPDIR}/mk/package.mk

$(eval $(call PKG_template,RADVD,${PKG_NAME},${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))

CONFIGURE_ARGS+=	--with-configfile=/etc/radvd.conf \
			--with-logfile=/var/log/radvd.log \
			--with-pidfile=/var/run/radvd.pid

post-install:
	${INSTALL_DIR} ${IDIR_RADVD}/etc ${IDIR_RADVD}/usr/sbin
	${INSTALL_DATA} ./files/radvd.conf ${IDIR_RADVD}/etc/
	${INSTALL_BIN} ${WRKINST}/usr/sbin/radvd ${IDIR_RADVD}/usr/sbin/
	${INSTALL_BIN} ${WRKINST}/usr/sbin/radvdump ${IDIR_RADVD}/usr/sbin/

include ${TOPDIR}/mk/pkg-bottom.mk
