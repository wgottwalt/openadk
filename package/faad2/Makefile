# $Id$
#-
# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include ${TOPDIR}/rules.mk

PKG_NAME:=		faad2
PKG_VERSION:=		2.6.1
PKG_RELEASE:=		1
PKG_MD5SUM:=		74e92df40c270f216a8305fc87603c8a
MASTER_SITES:=		${MASTER_SITE_SOURCEFORGE:=faac/}
WRKDIST=		${WRKDIR}/faad2

include ${TOPDIR}/mk/package.mk

$(eval $(call PKG_template,LIBFAAD2,libfaad2,${PKG_VERSION}-${PKG_RELEASE},${ARCH}))

CONFIGURE_STYLE=	autotool gnu
CONFIGURE_ARGS+=	--without-mpeg4ip \
			--without-xmms
BUILD_STYLE=		auto
INSTALL_STYLE=		auto

pre-install:
	${INSTALL_DIR} ${WRKINST}/usr/lib
	${INSTALL_DIR} ${WRKINST}/usr/include
	${CP} ${WRKBUILD}/common/mp4ff/libmp4ff.a ${WRKINST}/usr/lib
	${CP} ${WRKBUILD}/common/mp4ff/mp4ff.h ${WRKINST}/usr/include

post-install:
	${INSTALL_DIR} ${IDIR_LIBFAAD2}/usr/lib
	${CP} ${WRKINST}/usr/lib/libfaad.so.* ${IDIR_LIBFAAD2}/usr/lib/

include ${TOPDIR}/mk/pkg-bottom.mk
