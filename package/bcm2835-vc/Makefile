# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include ${TOPDIR}/rules.mk

PKG_NAME:=		bcm2835-vc
PKG_VERSION:=		0.2
PKG_RELEASE:=		3
PKG_MD5SUM:=		d16840805c020af92cd2268a0291228b
PKG_DESCR:=		vc tools for raspberry pi (bcm2835)
PKG_SECTION:=		base
PKG_DEPENDS:=		libpthread
PKG_SITES:=		http://openadk.org/distfiles/

PKG_LIBC_DEPENDS:=	eglibc glibc
PKG_SYSTEM_DEPENDS:=	raspberry-pi

PKG_SUBPKGS:=		BCM2835_VC BCM2835_VC_DEV

include ${TOPDIR}/mk/package.mk

$(eval $(call PKG_template,BCM2835_VC,bcm2835-vc,${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))
$(eval $(call PKG_template,BCM2835_VC_DEV,bcm2835-vc-dev,${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))

CONFIG_STYLE:=          manual
BUILD_STYLE:=           manual
INSTALL_STYLE:=         manual

bcm2835-vc-install:
	${CP} ${WRKBUILD}/* ${IDIR_BCM2835_VC}
	# required for xbmc
	(cd ${IDIR_BCM2835_VC}/opt/vc/lib && ln -sf libEGL.so libEGL.so.1)
	-rm -rf ${IDIR_BCM2835_VC}/opt/vc/include
	mkdir -p ${STAGING_DIR}/opt/vc
	${CP} ${WRKBUILD}/opt/vc/lib ${STAGING_DIR}/opt/vc
	${CP} ${WRKBUILD}/opt/vc/include ${STAGING_DIR}/opt/vc

include ${TOPDIR}/mk/pkg-bottom.mk
