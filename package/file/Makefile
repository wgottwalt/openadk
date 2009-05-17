# $Id$
#-
# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include ${TOPDIR}/rules.mk

PKG_NAME:=		file
PKG_VERSION:=		4.26
PKG_RELEASE:=		1
PKG_MD5SUM:=		74cd5466416136da30a4e69f74dbc7a0
MASTER_SITES:=		ftp://ftp.fu-berlin.de/unix/tools/file/ \
			ftp://ftp.astron.com/pub/file/

include ${TOPDIR}/mk/package.mk

$(eval $(call PKG_template,FILE,${PKG_NAME},${PKG_VERSION}-${PKG_RELEASE},${ARCH}))

CONFIGURE_STYLE:=	gnu
BUILD_STYLE:=		auto
INSTALL_STYLE:=		auto

post-install:
	${INSTALL_DIR} ${IDIR_FILE}/usr/bin
	${INSTALL_DIR} ${IDIR_FILE}/usr/lib
	${INSTALL_DIR} ${IDIR_FILE}/usr/share/file
	${INSTALL_BIN} ${WRKINST}/usr/bin/file ${IDIR_FILE}/usr/bin
	${INSTALL_DATA} ${WRKINST}/usr/share/file/magic.mgc \
		${IDIR_FILE}/usr/share/file
	${CP} ${WRKINST}/usr/lib/libmagic.so.* ${IDIR_FILE}/usr/lib/

include ${TOPDIR}/mk/pkg-bottom.mk
