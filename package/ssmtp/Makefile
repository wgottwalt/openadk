# $Id$
#-
# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include ${TOPDIR}/rules.mk

PKG_NAME:=		ssmtp
PKG_VERSION:=		2.61
PKG_RELEASE:=		1
PKG_MD5SUM:=		957e6fff08625fe34f4fc33d0925bbc9
PKG_DESCR:=		A minimal and secure mail sender
PKG_SECTION:=		net
PKG_SITES:=		http://ftp.debian.org/debian/pool/main/s/ssmtp/

DISTFILES:=		${PKG_NAME}_${PKG_VERSION}.orig.tar.gz

include ${TOPDIR}/mk/package.mk

$(eval $(call PKG_template,SSMTP,${PKG_NAME},${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))

CONFIGURE_STYLE:=	gnu
BUILD_STYLE:=		auto

do-install:
	${INSTALL_DIR} ${IDIR_SSMTP}/etc/ssmtp
	${INSTALL_DIR} ${IDIR_SSMTP}/usr/sbin
	${INSTALL_DATA} ${WRKBUILD}/ssmtp.conf ${IDIR_SSMTP}/etc/ssmtp/
	${INSTALL_DATA} ${WRKBUILD}/revaliases ${IDIR_SSMTP}/etc/ssmtp/
	${INSTALL_BIN} ${WRKBUILD}/ssmtp ${IDIR_SSMTP}/usr/sbin/
	ln -sf ssmtp ${IDIR_SSMTP}/usr/sbin/sendmail

include ${TOPDIR}/mk/pkg-bottom.mk
