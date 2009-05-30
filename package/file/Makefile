# $Id$
#-
# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include ${TOPDIR}/rules.mk

PKG_NAME:=		file
PKG_VERSION:=		5.03
PKG_RELEASE:=		1
PKG_MD5SUM:=		d05f08a53e5c2f51f8ee6a4758c0cc53
PKG_DESCR:=		a file type guesser
PKG_SECTION:=		utils
PKG_URL:=		http://www.darwinsys.com/file
PKG_SITES:=		ftp://ftp.fu-berlin.de/unix/tools/file/ \
			ftp://ftp.astron.com/pub/file/

include ${TOPDIR}/mk/package.mk

$(eval $(call PKG_template,FILE,${PKG_NAME},${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))

CONFIGURE_STYLE:=	gnu
BUILD_STYLE:=		auto
INSTALL_STYLE:=		auto

post-install:
	${INSTALL_DIR} ${IDIR_FILE}/usr/bin ${IDIR_FILE}/usr/lib ${IDIR_FILE}/usr/share/misc
	${INSTALL_BIN} ${WRKINST}/usr/bin/file ${IDIR_FILE}/usr/bin
	${INSTALL_DATA} ${WRKINST}/usr/share/misc/magic.mgc \
		${IDIR_FILE}/usr/share/misc
	${CP} ${WRKINST}/usr/lib/libmagic.so.* ${IDIR_FILE}/usr/lib/

include ${TOPDIR}/mk/pkg-bottom.mk
