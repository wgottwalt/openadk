# $Id$
#-
# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include ${TOPDIR}/rules.mk

PKG_NAME:=		motion
PKG_VERSION:=		3.2.6
PKG_RELEASE:=		1
PKG_MD5SUM:=		71e6bd13fcca70372e9b7c7806d62b30
MASTER_SITES:=		${MASTER_SITE_SOURCEFORGE:=motion/}

include ${TOPDIR}/mk/package.mk

$(eval $(call PKG_template,MOTION,motion,${PKG_VERSION}-${PKG_RELEASE},${ARCH}))

CONFIGURE_STYLE:=	gnu
CONFIGURE_ARGS+=	--without-ffmpeg \
			--without-jpeg-mmx \
			--without-mysql \
			--without-pgsql
BUILD_STYLE:=		auto
INSTALL_STYLE:=		auto

post-install:
	${INSTALL_DIR} ${IDIR_MOTION}/usr/bin
	${INSTALL_BIN} ${WRKINST}/usr/bin/motion ${IDIR_MOTION}/usr/bin/

include ${TOPDIR}/mk/pkg-bottom.mk
