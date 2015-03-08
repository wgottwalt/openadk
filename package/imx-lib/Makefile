# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(ADK_TOPDIR)/rules.mk

PKG_NAME:=		imx-lib
PKG_VERSION:=		3.10.53-1.1.0
PKG_RELEASE:=		1
PKG_HASH:=		4db2c1f286f2478b8236e62de4df9d2a2c26ff727c752dc4f21e2910f4a5e5d7
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
FAKE_FLAGS+=		DEST_DIR=$(WRKINST)
CONFIG_STYLE:=		manual

imx-lib-install:
	# remove libcec from staging directory
	-rm $(STAGING_TARGET_DIR)/usr/lib/libcec.so.1
	$(INSTALL_DIR) $(IDIR_IMX_LIB)/usr/lib
	$(CP) $(WRKINST)/usr/lib/lib{ipu,pxp}.so* \
		$(IDIR_IMX_LIB)/usr/lib

include ${ADK_TOPDIR}/mk/pkg-bottom.mk
