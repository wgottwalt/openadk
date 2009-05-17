# $Id$
#-
# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include ${TOPDIR}/rules.mk

PKG_NAME:=		fprobe-ulog
PKG_VERSION:=		1.1
PKG_RELEASE:=		1
PKG_MD5SUM:=		cdb2e4edc47e8a3d5479eeabfb979ebc
DISTFILES:=		${PKG_NAME}-${PKG_VERSION}.tar.bz2
MASTER_SITES:=		${MASTER_SITE_SOURCEFORGE:=fprobe/}

include ${TOPDIR}/mk/package.mk

$(eval $(call PKG_template,FPROBE_ULOG,fprobe-ulog,${PKG_VERSION}-${PKG_RELEASE},${ARCH}))

CONFIGURE_STYLE=	gnu
CONFIGURE_ARGS+=	--with-piddir=/var \
			--with-membulk=index8 \
			--with-hash=xor8
BUILD_STYLE=		auto
INSTALL_STYLE=		auto

post-install:
	${INSTALL_DIR} ${IDIR_FPROBE_ULOG}/usr/sbin
	${INSTALL_BIN} ${WRKINST}/usr/sbin/fprobe-ulog \
		${IDIR_FPROBE_ULOG}/usr/sbin/

include ${TOPDIR}/mk/pkg-bottom.mk
