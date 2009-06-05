# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include ${TOPDIR}/rules.mk

PKG_NAME:=		vsftpd
PKG_VERSION:=		2.1.2
PKG_RELEASE:=		1
PKG_MD5SUM:=		6a8c8579d50adf0d0fc07226c03bfb52
PKG_DESCR:=		a fast and secure FTP server
PKG_SECTION:=		net
PKG_URL:=		http://vsftpd.beasts.org
PKG_SITES:=		ftp://vsftpd.beasts.org/users/cevans/

include ${TOPDIR}/mk/package.mk

$(eval $(call PKG_template,VSFTPD,${PKG_NAME},${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))

BUILD_STYLE:=		auto
XAKE_FLAGS+=		${TARGET_CONFIGURE_OPTS}
ALL_TARGET:=		vsftpd
INSTALL_STYLE:=		auto

post-install:
	${INSTALL_DIR} ${IDIR_VSFTPD}/etc ${IDIR_VSFTPD}/usr/sbin
	${INSTALL_DATA} ./files/vsftpd.conf ${IDIR_VSFTPD}/etc/vsftpd.conf
	${INSTALL_BIN} ${WRKINST}/usr/sbin/vsftpd ${IDIR_VSFTPD}/usr/sbin/

include ${TOPDIR}/mk/pkg-bottom.mk
