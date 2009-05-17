# $Id$
#-
# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include ${TOPDIR}/rules.mk

PKG_NAME:=		alsa-lib
PKG_VERSION:=		1.0.19
PKG_RELEASE:=		1
PKG_MD5SUM:=		73db3666c211e5fb023bb77450cf430d
MASTER_SITES:=		ftp://ftp.task.gda.pl/pub/linux/misc/alsa/lib/ \
			ftp://ftp.alsa-project.org/pub/lib/
DISTFILES:=             ${PKG_NAME}-${PKG_VERSION}.tar.bz2

include ${TOPDIR}/mk/package.mk

$(eval $(call PKG_template,ALSA_LIB,alsa-lib,${PKG_VERSION}-${PKG_RELEASE},${ARCH}))

CONFIGURE_STYLE=	gnu
CONFIGURE_ARGS+=	--disable-python
BUILD_STYLE=		auto
INSTALL_STYLE=		auto confprog

post-install:
	${INSTALL_DIR} ${IDIR_ALSA_LIB}/usr/lib
	${INSTALL_DIR} ${IDIR_ALSA_LIB}/usr/share/alsa
	${CP} ${WRKINST}/usr/lib/libasound.so.* ${IDIR_ALSA_LIB}/usr/lib/
	${CP} ${WRKINST}/usr/share/alsa/* ${IDIR_ALSA_LIB}/usr/share/alsa/

include ${TOPDIR}/mk/pkg-bottom.mk
