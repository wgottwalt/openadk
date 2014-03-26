# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include ${TOPDIR}/rules.mk

PKG_NAME:=		bcm2835-vc
# actually a8fbe2cd6a3d4455344295809f2e663373ad25cb from 25.03.2014
# https://github.com/raspberrypi/userland
PKG_VERSION:=		0.4
PKG_RELEASE:=		1
PKG_MD5SUM:=		091ae422e05a59ffc2b8908256047b7d
PKG_DESCR:=		vc tools and libraries for raspberry pi
PKG_SECTION:=		base
PKG_DEPENDS:=		libpthread
PKG_BUILDDEP:=		cmake-host
PKG_SITES:=		http://openadk.org/distfiles/

PKG_SYSTEM_DEPENDS:=	raspberry-pi

include ${TOPDIR}/mk/package.mk

$(eval $(call PKG_template,BCM2835_VC,bcm2835-vc,${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))

CONFIG_STYLE:=          manual

do-configure:
	(cd $(WRKBUILD) && PATH='${TARGET_PATH}' cmake -DCMAKE_SYSTEM_NAME=Linux .)

bcm2835-vc-install:
	$(INSTALL_DIR) ${IDIR_BCM2835_VC}/opt/vc/{bin,lib}
	$(CP) ${WRKINST}/opt/vc/lib/*so* ${IDIR_BCM2835_VC}/opt/vc/lib
	$(CP) ${WRKINST}/opt/vc/bin/* ${IDIR_BCM2835_VC}/opt/vc/bin
	# required for xbmc
	(cd ${IDIR_BCM2835_VC}/opt/vc/lib && ln -sf libEGL.so libEGL.so.1)
	-rm -rf ${STAGING_TARGET_DIR}/opt/vc
	mkdir -p ${STAGING_TARGET_DIR}/opt/vc
	${CP} ${WRKINST}/opt/vc/lib ${STAGING_TARGET_DIR}/opt/vc
	${CP} ${WRKINST}/opt/vc/include ${STAGING_TARGET_DIR}/opt/vc

include ${TOPDIR}/mk/pkg-bottom.mk
