# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include ${TOPDIR}/rules.mk

PKG_NAME:=		radvd
PKG_VERSION:=		1.2
PKG_RELEASE:=		1
PKG_MD5SUM:=		614876420d76cd2bb5bcb49760c8b9e3
PKG_DESCR:=		Routing Advertisement Daemon for IPv6
PKG_SECTION:=		net
PKG_DEPENDS:=		kmod-ipv6
PKG_URL:=		http://www.litech.org/radvd
PKG_SITES:=		http://v6web.litech.org/radvd/dist/ \
			http://download.sourcemage.org/mirror/

include ${TOPDIR}/mk/package.mk

$(eval $(call PKG_template,RADVD,${PKG_NAME},${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))

CONFIGURE_STYLE:=	gnu
CONFIGURE_ARGS+=	--with-configfile=/etc/radvd.conf \
			--with-logfile=/var/log/radvd.log \
			--with-pidfile=/var/run/radvd.pid
BUILD_STYLE:=		auto
INSTALL_STYLE:=		auto

post-install:
	${INSTALL_DIR} ${IDIR_RADVD}/etc ${IDIR_RADVD}/usr/sbin
	${INSTALL_DATA} ./files/radvd.conf ${IDIR_RADVD}/etc/
	${INSTALL_BIN} ${WRKINST}/usr/sbin/radvd ${IDIR_RADVD}/usr/sbin/
	${INSTALL_BIN} ${WRKINST}/usr/sbin/radvdump ${IDIR_RADVD}/usr/sbin/

include ${TOPDIR}/mk/pkg-bottom.mk
