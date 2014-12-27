# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include ${ADK_TOPDIR}/rules.mk

PKG_NAME:=		vsftpd
PKG_VERSION:=		3.0.2
PKG_RELEASE:=		2
PKG_HASH:=		be46f0e2c5528fe021fafc8dab1ecfea0c1f183063a06977f8537fcd0b195e56
PKG_DESCR:=		fast and secure ftp server
PKG_SECTION:=		net/http
PKG_DEPENDS:=		libcap
PKG_BUILDDEP:=		libcap
PKG_URL:=		http://vsftpd.beasts.org/
PKG_SITES:=		https://security.appspot.com/downloads/

DISTFILES:=		${PKG_NAME}-${PKG_VERSION}.tar.gz

include ${ADK_TOPDIR}/mk/package.mk

$(eval $(call PKG_template,VSFTPD,vsftpd,${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))

CONFIG_STYLE:=          manual
ALL_TARGET:=		vsftpd

vsftpd-install:
	${INSTALL_DIR} ${IDIR_VSFTPD}/etc ${IDIR_VSFTPD}/usr/sbin
	${INSTALL_DATA} ./files/vsftpd.conf ${IDIR_VSFTPD}/etc/vsftpd.conf
	${INSTALL_BIN} ${WRKINST}/usr/sbin/vsftpd ${IDIR_VSFTPD}/usr/sbin

include ${ADK_TOPDIR}/mk/pkg-bottom.mk
