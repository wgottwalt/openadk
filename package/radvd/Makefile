# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include ${ADK_TOPDIR}/rules.mk

PKG_NAME:=		radvd
PKG_VERSION:=		2.5
PKG_RELEASE:=		1
PKG_MD5SUM:=		8778e5eb669210351fa8db22532098a7
PKG_DESCR:=		routing advertisement daemon for ipv6
PKG_SECTION:=		net/ipv6
PKG_DEPENDS:=		libdaemon
PKG_BUILDDEP:=		libdaemon check
PKG_URL:=		http://www.litech.org/radvd/
PKG_SITES:=		http://v6web.litech.org/radvd/dist/

include ${ADK_TOPDIR}/mk/package.mk

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

include ${ADK_TOPDIR}/mk/pkg-bottom.mk
