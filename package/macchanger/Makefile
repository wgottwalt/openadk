# $Id$
#-
# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include ${TOPDIR}/rules.mk

PKG_NAME:=		macchanger
PKG_VERSION:=		1.5.0
PKG_RELEASE:=		1
PKG_MD5SUM:=		79b7cdaeca3d8ebafa764c4b0dd03ab7
MASTER_SITES:=		${MASTER_SITE_GNU:=macchanger/}

include ${TOPDIR}/mk/package.mk

$(eval $(call PKG_template,MACCHANGER,${PKG_NAME},${PKG_VERSION}-${PKG_RELEASE}))

CONFIGURE_STYLE:=	gnu
INSTALL_STYLE:=		auto

post-install:
	${INSTALL_DIR} ${IDIR_MACCHANGER}
	${CP} ${WRKINST}/* ${IDIR_MACCHANGER}/

include ${TOPDIR}/mk/pkg-bottom.mk
