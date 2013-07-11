# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include ${TOPDIR}/rules.mk

PKG_NAME:=		bcm2835-vc
PKG_VERSION:=		0.1
PKG_RELEASE:=		1
PKG_MD5SUM:=		1ec77ba4e75807f505604c42738a2bee
PKG_DESCR:=		vc tools for raspberry pi (bcm2835)
PKG_SECTION:=		base
PKG_SITES:=		http://openadk.org/distfiles/

include ${TOPDIR}/mk/package.mk

$(eval $(call PKG_template,BCM2835_VC,bcm2835-vc,${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))

CONFIG_STYLE:=          manual
BUILD_STYLE:=           manual
INSTALL_STYLE:=         manual

do-install:
	${CP} ${WRKBUILD}/* ${IDIR_BCM2835_VC}

include ${TOPDIR}/mk/pkg-bottom.mk
