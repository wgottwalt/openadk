# $Id$
#-
# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include ${TOPDIR}/rules.mk

PKG_NAME:=		stress
PKG_VERSION:=		1.0.0
PKG_RELEASE:=		1
PKG_MD5SUM:=		d693ff044ac7d34f8aaea202cd96f679
MASTER_SITES:=		http://weather.ou.edu/~apw/projects/stress/

include ${TOPDIR}/mk/package.mk

$(eval $(call PKG_template,STRESS,stress,${PKG_VERSION}-${PKG_RELEASE},${ARCH}))

CONFIGURE_STYLE:=	gnu
BUILD_STYLE:=		auto
INSTALL_STYLE:=		auto

post-install:
	${INSTALL_DIR} ${IDIR_STRESS}/usr/bin/
	${INSTALL_BIN} ${WRKINST}/usr/bin/stress ${IDIR_STRESS}/usr/bin/

include ${TOPDIR}/mk/pkg-bottom.mk
