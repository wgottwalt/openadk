# $Id$
#-
# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include ${TOPDIR}/rules.mk

PKG_NAME:=		vgp
PKG_VERSION:=		0.2.1
PKG_RELEASE:=		1
PKG_MD5SUM:=		b8c25b5dfcb944f78bbc584be9c230c7

MASTER_SITES:=		http://vgpd.freaknet.org/files/

include ${TOPDIR}/mk/package.mk

$(eval $(call PKG_template,VGP,vgp,${PKG_VERSION}-${PKG_RELEASE},${ARCH}))

CONFIGURE_STYLE:=	gnu
INSTALL_STYLE:=		auto

post-install:
	${INSTALL_DIR} ${IDIR_VGP}/usr/bin/
	${INSTALL_BIN} ${WRKINST}/usr/bin/vgpd ${IDIR_VGP}/usr/bin/

include ${TOPDIR}/mk/pkg-bottom.mk
