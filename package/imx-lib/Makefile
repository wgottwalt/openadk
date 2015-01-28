# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(ADK_TOPDIR)/rules.mk

PKG_NAME:=		imx-lib
PKG_VERSION:=		3.10.31-1.1.0-beta
PKG_RELEASE:=		1
PKG_HASH:=		011eb34c6fd1b1ea9894bbe07a539c1aeee1500bc8fdd29d8ce1dc1d02f79e24
PKG_DESCR:=		IMX library (Freescale)
PKG_SECTION:=		libs/video
PKG_URL:=		http://www.freescale.com/
PKG_SITES:=		http://www.freescale.com/lgfiles/NMG/MAD/YOCTO/

PKG_SYSTEM_DEPENDS:=	solidrun-imx6

DISTFILES:=             ${PKG_NAME}-${PKG_VERSION}.tar.gz

include $(ADK_TOPDIR)/mk/package.mk

$(eval $(call PKG_template,IMX_LIB,imx-lib,$(PKG_VERSION)-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))

TARGET_CPPFLAGS+=	-I${LINUX_DIR}/drivers/mxc/security/rng/include \
			-I$(LINUX_DIR)/drivers/mxc/security/sahara2/include \
			-idirafter $(LINUX_DIR)/include/uapi
MAKE_ENV+=		PLATFORM=IMX6Q
CONFIG_STYLE:=		manual

imx-lib-install:
	# remove libcec from staging directory
	-rm $(STAGING_TARGET_DIR)/usr/lib/libcec.so.1
	$(INSTALL_DIR) $(IDIR_IMX_LIB)/usr/lib
	$(CP) $(WRKINST)/usr/lib/lib{ipu,pxp}.so* \
		$(IDIR_IMX_LIB)/usr/lib

include ${ADK_TOPDIR}/mk/pkg-bottom.mk
