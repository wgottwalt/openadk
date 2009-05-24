# $Id$
#-
# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include ${TOPDIR}/rules.mk

PKG_NAME:=		iw
PKG_VERSION:=		0.9.14
PKG_RELEASE:=		1
PKG_MD5SUM:=		b5059cfe86bc7664511b79c159635a8f
MASTER_SITES:=		http://wireless.kernel.org/download/iw/
DISTFILES:=		${PKG_NAME}-${PKG_VERSION}.tar.bz2


include ${TOPDIR}/mk/package.mk

$(eval $(call PKG_template,IW,iw,${PKG_VERSION}-${PKG_RELEASE}))

XAKE_FLAGS:=		V=1
BUILD_STYLE:=		auto
INSTALL_STYLE:=		auto

post-install:
	${INSTALL_DIR} ${IDIR_IW}/usr/sbin
	${INSTALL_BIN} ${WRKINST}/usr/bin/iw ${IDIR_IW}/usr/sbin

include ${TOPDIR}/mk/pkg-bottom.mk
