# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include ${TOPDIR}/rules.mk

PKG_NAME:=		knock
PKG_VERSION:=		0.5
PKG_RELEASE:=		1
PKG_MD5SUM:=		ca09d61458974cff90a700aba6120891
PKG_DESCR:=		A port-knocking client
PKG_SECTION:=		firewall
PKG_BUILDDEP:=		libpcap
PKG_URL:=		http://www.zeroflux.org/projects/knock
PKG_SITES:=		http://www.zeroflux.org/proj/knock/files/

PKG_SUBPKGS:=		KNOCK KNOCKD
PKGSD_KNOCKD:=		A port-knocking server
PKGSS_KNOCKD:=		libpcap

include ${TOPDIR}/mk/package.mk

$(eval $(call PKG_template,KNOCK,knock,${PKG_VERSION}-${PKG_RELEASE},,${PKG_DESCR},${PKG_SECTION}))
$(eval $(call PKG_template,KNOCKD,knockd,${PKG_VERSION}-${PKG_RELEASE},${PKGSS_KNOCKD},${PKGSD_KNOCKD},${PKG_SECTION}))

TCXXFLAGS+=		${TCPPFLAGS} ${TCFLAGS}
CONFIGURE_ENV+=		ac_cv_lib_pcap_pcap_open_live=yes

post-install:
	${INSTALL_DIR} ${IDIR_KNOCK}/usr/bin
	${CP} ${WRKINST}/usr/bin/knock ${IDIR_KNOCK}/usr/bin/
	${INSTALL_DIR} ${IDIR_KNOCKD}/etc
	install -m0600 ${WRKINST}/etc/knockd.conf ${IDIR_KNOCKD}/etc/
	${INSTALL_DIR} ${IDIR_KNOCKD}/usr/sbin
	${CP} ${WRKINST}/usr/sbin/knockd ${IDIR_KNOCKD}/usr/sbin/

include ${TOPDIR}/mk/pkg-bottom.mk
