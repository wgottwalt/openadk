# $Id$
#-
# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include ${TOPDIR}/rules.mk

PKG_NAME:=		owfs
PKG_VERSION:=		2.4p5
PKG_RELEASE:=		1
PKG_MD5SUM:=		236f2f42b3bb4f430e6007c1a70778e6
MASTER_SITES:=		${MASTER_SITE_SOURCEFORGE:=owfs/}

include ${TOPDIR}/mk/package.mk

$(eval $(call PKG_template,OWFS,${PKG_NAME},${PKG_VERSION}-${PKG_RELEASE}))

CONFIGURE_STYLE:=	gnu
CONFIGURE_ENV+=		BUILD_CC=${TARGET_CC} \
			LD_EXTRALIBS="" \
			ac_cv_linux_vers=2 \
			td_cv_buggygetaddrinfo="no"
CONFIGURE_ARGS+=	--enable-owfs \
			--enable-usb \
			--disable-owhttpd \
			--disable-owftpd \
			--disable-owcapi \
			--disable-owserver
BUILD_STYLE:=		auto
ALL_TARGET:=

do-install:
	${INSTALL_DIR} ${IDIR_OWFS}/usr/{bin,lib}
	${INSTALL_BIN} ${WRKBUILD}/module/owlib/src/c/.libs/libow.so.0.0.0 \
	               ${IDIR_OWFS}/usr/lib/
	${INSTALL_BIN} ${WRKBUILD}/module/owfs/src/c/.libs/owfs ${IDIR_OWFS}/usr/bin/owfs

include ${TOPDIR}/mk/pkg-bottom.mk
