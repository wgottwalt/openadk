# $Id$
#-
# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include ${TOPDIR}/rules.mk

PKG_NAME:=		fprobe
PKG_VERSION:=		1.1
PKG_RELEASE:=		1
PKG_MD5SUM:=		65850d0470078269b33eee58cba77ac2
DISTFILES:=		${PKG_NAME}-${PKG_VERSION}.tar.bz2
MASTER_SITES:=		${MASTER_SITE_SOURCEFORGE:=fprobe/}

include ${TOPDIR}/mk/package.mk

$(eval $(call PKG_template,FPROBE,${PKG_NAME},${PKG_VERSION}-${PKG_RELEASE}))

CONFIGURE_STYLE=	gnu
CONFIGURE_ARGS+=	--with-piddir=/var \
			--with-pcap=${STAGING_DIR}/usr/include \
			--with-libpcap=${STAGING_DIR}/usr/lib \
			--with-membulk=index8 \
			--with-hash=xor8 \
BUILD_STYLE=		auto
INSTALL_STYLE=		auto

post-install:
	${INSTALL_DIR} ${IDIR_FPROBE}/usr/sbin
	${INSTALL_BIN} ${WRKINST}/usr/sbin/fprobe ${IDIR_FPROBE}/usr/sbin/

include ${TOPDIR}/mk/pkg-bottom.mk
