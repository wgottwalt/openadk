# $Id$
#-
# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include ${TOPDIR}/rules.mk

PKG_NAME:=		jamvm
PKG_VERSION:=		1.5.1
PKG_RELEASE:=		1
PKG_MD5SUM:=		5a82751b50391eb092c906ce64f3b6bf
MASTER_SITES:=		${MASTER_SITE_SOURCEFORGE:=jamvm/}

include ${TOPDIR}/mk/package.mk

${eval ${call PKG_template,JAMVM,${PKG_NAME},${PKG_VERSION}-${PKG_RELEASE},${ARCH}}}

CONFIGURE_STYLE=	gnu
CONFIGURE_ARGS+=	--enable-ffi

do-build:
	${INSTALL_DIR} ${WRKINST}/usr/bin
	${INSTALL_DIR} ${WRKINST}/usr/share/jamvm
	${MAKE} -C ${WRKBUILD}/src \
	      ${TARGET_CONFIGURE_OPTS}
	${CP} ${WRKBUILD}/src/jamvm ${WRKINST}/usr/bin
	${MAKE} -C ${WRKBUILD}/lib
	${CP} ${WRKBUILD}/lib/classes.zip ${WRKINST}/usr/share/jamvm

do-install:
	${INSTALL_DIR} ${IDIR_JAMVM}/usr/bin
	${INSTALL_DIR} ${IDIR_JAMVM}/usr/share/jamvm
	${INSTALL_BIN} ${WRKINST}/usr/bin/jamvm ${IDIR_JAMVM}/usr/bin
	${CP} ${WRKINST}/usr/share/jamvm/classes.zip ${IDIR_JAMVM}/usr/share/jamvm

include ${TOPDIR}/mk/pkg-bottom.mk
