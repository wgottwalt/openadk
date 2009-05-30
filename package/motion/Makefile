# $Id$
#-
# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include ${TOPDIR}/rules.mk

PKG_NAME:=		motion
PKG_VERSION:=		3.2.11
PKG_RELEASE:=		1
PKG_MD5SUM:=		3a26c00f3250eacf6fa93c7a7e0249d9
PKG_DESCR:=		Webcam motion sensing and logging
PKG_SECTION:=		multimedia
PKG_DEPENDS:=		libjpeg libpthread
PKG_URL:=		http://www.lavrsen.dk/twiki/bin/view/Motion/WebHome
PKG_SITES:=		${MASTER_SITE_SOURCEFORGE:=motion/}

include ${TOPDIR}/mk/package.mk

$(eval $(call PKG_template,MOTION,${PKG_NAME},${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))

CONFIGURE_STYLE:=	gnu
CONFIGURE_ARGS+=	--without-ffmpeg \
			--without-jpeg-mmx \
			--without-optimizecpu \
			--without-mysql \
			--without-pgsql
BUILD_STYLE:=		auto
INSTALL_STYLE:=		auto

post-install:
	${INSTALL_DIR} ${IDIR_MOTION}/usr/bin
	${INSTALL_BIN} ${WRKINST}/usr/bin/motion ${IDIR_MOTION}/usr/bin/

include ${TOPDIR}/mk/pkg-bottom.mk
