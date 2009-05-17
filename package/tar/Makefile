# $Id$
#-
# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include ${TOPDIR}/rules.mk

PKG_NAME:=		tar
PKG_VERSION:=		1.22
PKG_RELEASE:=		1
PKG_MD5SUM:=		efafad1b256e3de410f4fce5335d9c9d

MASTER_SITES:=		ftp://ftp.informatik.rwth-aachen.de/pub/gnu/tar/ \
                	http://mirrors.kernel.org/gnu/tar/

include ${TOPDIR}/mk/package.mk

$(eval $(call PKG_template,TAR,tar,${PKG_VERSION}-${PKG_RELEASE},${ARCH}))

CONFIGURE_STYLE:=	gnu
BUILD_STYLE:=		auto
INSTALL_STYLE:=		auto

post-install:
	${INSTALL_DIR} ${IDIR_TAR}/usr/bin
	${INSTALL_BIN} ${WRKINST}/usr/bin/tar ${IDIR_TAR}/usr/bin/tar

include ${TOPDIR}/mk/pkg-bottom.mk
