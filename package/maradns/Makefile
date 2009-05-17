# $Id$
#-
# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include ${TOPDIR}/rules.mk

PKG_NAME:=		maradns
PKG_VERSION:=		1.0.41
PKG_RELEASE:=		1
PKG_MD5SUM:=		9abc13da25c1103d788ee9def1c8e764
MASTER_SITES:=		http://www.maradns.org/download/1.0/
DISTFILES:=		${PKG_NAME}-${PKG_VERSION}.tar.bz2

include ${TOPDIR}/mk/package.mk

$(eval $(call PKG_template,MARADNS,maradns,${PKG_VERSION}-${PKG_RELEASE},${ARCH}))

#CONFIGURE_STYLE:=	gnu
BUILD_STYLE:=		auto
MAKE_FLAGS+=		CFLAGS="${TCFLAGS}" \
			FLAGS="${TCFLAGS}" \
			CC="${TARGET_CC}" \
			HOSTCC="${HOSTCC}"
INSTALL_STYLE:=		auto
FAKE_FLAGS+=		PREFIX="${WRKINST}/usr" \
			RPM_BUILD_ROOT="${WRKINST}"

pre-install:
	mkdir -p ${WRKINST}/usr/{bin,sbin}
	mkdir -p ${WRKINST}/usr/man/man{1,5,8}

post-install:
	${INSTALL_DIR} ${IDIR_MARADNS}/etc/{init.d,maradns}
	${INSTALL_DIR} ${IDIR_MARADNS}/usr/{s,}bin
	${INSTALL_DATA} ./files/mararc ${IDIR_MARADNS}/etc/mararc
	${INSTALL_DATA} ./files/sample.{zone,ptr} ${IDIR_MARADNS}/etc/maradns/
	${INSTALL_BIN} ./files/maradns.init ${IDIR_MARADNS}/etc/init.d/${PKG_NAME}
	${CP} ${WRKINST}/usr/bin/{askmara,getzone} ${IDIR_MARADNS}/usr/bin/
	${CP} ${WRKINST}/usr/sbin/{maradns,zoneserver} ${IDIR_MARADNS}/usr/sbin/

include ${TOPDIR}/mk/pkg-bottom.mk
