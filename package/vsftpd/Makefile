# $Id$
#-
# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include ${TOPDIR}/rules.mk

PKG_NAME:=		vsftpd
PKG_VERSION:=		2.1.0
PKG_RELEASE:=		1
PKG_MD5SUM:=		7890b54e7ffa6106ffbdfda53f47fa41

MASTER_SITES:=		ftp://vsftpd.beasts.org/users/cevans/

include ${TOPDIR}/mk/package.mk

$(eval $(call PKG_template,VSFTPD,vsftpd,${PKG_VERSION}-${PKG_RELEASE}))

BUILD_STYLE:=		auto
XAKE_FLAGS+=		${TARGET_CONFIGURE_OPTS}
ALL_TARGET:=		vsftpd
INSTALL_STYLE:=		auto

post-install:
	${INSTALL_DIR} ${IDIR_VSFTPD}/etc/
	${INSTALL_DATA} ./files/vsftpd.conf ${IDIR_VSFTPD}/etc/vsftpd.conf
	${INSTALL_DIR} ${IDIR_VSFTPD}/etc/init.d
	${INSTALL_BIN} ./files/vsftpd.init \
		${IDIR_VSFTPD}/etc/init.d/vsftpd
	${INSTALL_DIR} ${IDIR_VSFTPD}/usr/sbin/
	${INSTALL_BIN} ${WRKINST}/usr/sbin/vsftpd ${IDIR_VSFTPD}/usr/sbin/

include ${TOPDIR}/mk/pkg-bottom.mk
