# $Id$
#-
# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include ${TOPDIR}/rules.mk

PKG_NAME:=		ipsec-tools
PKG_VERSION:=		0.6.4
PKG_RELEASE:=		1
PKG_MD5SUM:=		d0242a943c82c0cbf28005966ff35e21
DISTFILES:=		${PKG_NAME}-${PKG_VERSION}.tar.bz2
MASTER_SITES:=		${MASTER_SITE_SOURCEFORGE:=ipsec-tools/}

include ${TOPDIR}/mk/package.mk

$(eval $(call PKG_template,IPSEC_TOOLS,ipsec-tools,${PKG_VERSION}-${PKG_RELEASE},${ARCH}))

CONFIGURE_STYLE=	gnu
CONFIGURE_ARGS+=	--with-kernel-headers="${LINUX_DIR}/include" \
			--without-readline \
			--with-openssl="${STAGING_DIR}/usr" \
			--without-libradius \
			--without-libpam
BUILD_STYLE=		auto
INSTALL_STYLE=		auto

post-install:
	${INSTALL_DIR} ${IDIR_IPSEC_TOOLS}/usr/sbin
	${INSTALL_DIR} ${IDIR_IPSEC_TOOLS}/usr/lib/
	${INSTALL_DIR} ${IDIR_IPSEC_TOOLS}/etc
	${INSTALL_DATA} ${WRKBUILD}/src/racoon/samples/racoon.conf ${IDIR_IPSEC_TOOLS}/etc/
	${CP} ${WRKINST}/usr/lib/libipsec.so.* ${IDIR_IPSEC_TOOLS}/usr/lib/
	${CP} ${WRKINST}/usr/lib/libracoon.so.* ${IDIR_IPSEC_TOOLS}/usr/lib/
	${INSTALL_BIN} ${WRKINST}/usr/sbin/plainrsa-gen ${IDIR_IPSEC_TOOLS}/usr/sbin/
	${INSTALL_BIN} ${WRKINST}/usr/sbin/racoon ${IDIR_IPSEC_TOOLS}/usr/sbin/
	${INSTALL_BIN} ${WRKINST}/usr/sbin/racoonctl ${IDIR_IPSEC_TOOLS}/usr/sbin/
	${INSTALL_BIN} ${WRKINST}/usr/sbin/setkey ${IDIR_IPSEC_TOOLS}/usr/sbin/

include ${TOPDIR}/mk/pkg-bottom.mk
