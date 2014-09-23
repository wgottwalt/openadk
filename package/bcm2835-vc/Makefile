# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include ${ADK_TOPDIR}/rules.mk

PKG_NAME:=		bcm2835-vc
# actually git checkout from 21.09.2014
# ffcc4bd7c4875b71376c4240116e251652c9bec0
PKG_VERSION:=		0.8
PKG_RELEASE:=		1
PKG_MD5SUM:=		963b2dc026c5ee98cae093af56006b4c
PKG_DESCR:=		videocore tools and libraries for raspberry pi
PKG_SECTION:=		libs/video
PKG_DEPENDS:=		libpthread
PKG_BUILDDEP:=		cmake-host
PKG_URL:=		https://github.com/raspberrypi/userland
PKG_SITES:=		http://openadk.org/distfiles/

PKG_SYSTEM_DEPENDS:=	raspberry-pi

include ${ADK_TOPDIR}/mk/package.mk

$(eval $(call PKG_template,BCM2835_VC,bcm2835-vc,${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))

CONFIG_STYLE:=          cmake

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

include ${ADK_TOPDIR}/mk/pkg-bottom.mk
