# $Id$
#-
# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include ${TOPDIR}/rules.mk

PKG_NAME:=		tcpdump
PKG_VERSION:=		4.0.0
PKG_RELEASE:=		1
PKG_MD5SUM:=		b22ca72890df2301d922c9f2d17867f9
MASTER_SITES:=		http://www.tcpdump.org/release/ \
			http://www.sfr-fresh.com/unix/misc/ \
			http://www.at.tcpdump.org/ \
			http://www.br.tcpdump.org/

include ${TOPDIR}/mk/package.mk

$(eval $(call PKG_template,TCPDUMP,tcpdump,${PKG_VERSION}-${PKG_RELEASE}))

CONFIGURE_STYLE:=	gnu
CONFIGURE_ENV+=		BUILD_CC="${TARGET_CC}" HOSTCC=${HOSTCC} \
			ac_cv_linux_vers=2 \
			td_cv_buggygetaddrinfo="no"
CONFIGURE_ARGS+=	--without-crypto
BUILD_STYLE:=		auto
INSTALL_STYLE:=		auto
XAKE_FLAGS+=		CCOPT="${TARGET_CFLAGS}" INCLS="-I. -I${STAGING_DIR}/usr/include"

post-install:
	${INSTALL_DIR} ${IDIR_TCPDUMP}/usr/sbin
	${INSTALL_BIN} ${WRKINST}/usr/sbin/tcpdump ${IDIR_TCPDUMP}/usr/sbin/

include ${TOPDIR}/mk/pkg-bottom.mk
