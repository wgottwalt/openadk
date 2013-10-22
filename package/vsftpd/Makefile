# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include ${TOPDIR}/rules.mk

PKG_NAME:=		vsftpd
PKG_VERSION:=		2.3.4
PKG_RELEASE:=		1
PKG_MD5SUM:=		2ea5d19978710527bb7444d93b67767a
PKG_DESCR:=		a fast and secure FTP server
PKG_SECTION:=		www
PKG_URL:=		http://vsftpd.beasts.org/
PKG_SITES:=		http://security.appspot.com/downloads/

include ${TOPDIR}/mk/package.mk

$(eval $(call PKG_template,VSFTPD,vsftpd,${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))

CONFIG_STYLE:=          manual
ALL_TARGET:=		vsftpd

vsftpd-install:
	${INSTALL_DIR} ${IDIR_VSFTPD}/etc ${IDIR_VSFTPD}/usr/sbin
	${INSTALL_DATA} ./files/vsftpd.conf ${IDIR_VSFTPD}/etc/vsftpd.conf
	${INSTALL_BIN} ${WRKINST}/usr/sbin/vsftpd ${IDIR_VSFTPD}/usr/sbin

include ${TOPDIR}/mk/pkg-bottom.mk
