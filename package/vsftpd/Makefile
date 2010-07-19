# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include ${TOPDIR}/rules.mk

PKG_NAME:=		vsftpd
PKG_VERSION:=		2.2.0
PKG_RELEASE:=		1
PKG_MD5SUM:=		e4eb190af270ae65d57a84274a38ec31
PKG_DESCR:=		a fast and secure FTP server
PKG_SECTION:=		www
PKG_URL:=		http://vsftpd.beasts.org
PKG_SITES:=		ftp://vsftpd.beasts.org/users/cevans/

include ${TOPDIR}/mk/package.mk

$(eval $(call PKG_template,VSFTPD,${PKG_NAME},${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))

CONFIG_STYLE:=          manual

ALL_TARGET:=		vsftpd

post-install:
	${INSTALL_DIR} ${IDIR_VSFTPD}/etc ${IDIR_VSFTPD}/usr/sbin
	${INSTALL_DATA} ./files/vsftpd.conf ${IDIR_VSFTPD}/etc/vsftpd.conf
	${INSTALL_BIN} ${WRKINST}/usr/sbin/vsftpd ${IDIR_VSFTPD}/usr/sbin/

include ${TOPDIR}/mk/pkg-bottom.mk
