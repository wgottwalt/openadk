# $Id$
#-
# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include ${TOPDIR}/rules.mk

PKG_NAME:=		ipset
PKG_VERSION:=		2.3.3a
PKG_RELEASE:=		1
PKG_MD5SUM:=		c7d2f165242edaef5581db0f7d5af520
MASTER_SITES:=		http://ipset.netfilter.org/
DISTFILES:=		${PKG_NAME}-${PKG_VERSION}.tar.bz2

include ${TOPDIR}/mk/package.mk

$(eval $(call PKG_template,IPSET,${PKG_NAME},${PKG_VERSION}-${PKG_RELEASE}))

XAKE_FLAGS+=		KERNEL_DIR=${LINUX_DIR} PREFIX=/usr LD=$(TARGET_CROSS)ld
BUILD_STYLE=		auto
INSTALL_STYLE=		auto
INSTALL_TARGET=		binaries_install

post-install:
	${INSTALL_DIR} ${IDIR_IPSET}/usr/sbin
	${INSTALL_DIR} ${IDIR_IPSET}/usr/lib/ipset
	${INSTALL_BIN} ${WRKINST}/usr/sbin/ipset ${IDIR_IPSET}/usr/sbin
	${CP} ${WRKINST}/usr/lib/ipset/*.so ${IDIR_IPSET}/usr/lib/ipset/

include ${TOPDIR}/mk/pkg-bottom.mk
