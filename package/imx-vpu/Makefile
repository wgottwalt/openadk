# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(ADK_TOPDIR)/rules.mk

PKG_NAME:=		imx-vpu
PKG_VERSION:=		5.4.28
PKG_RELEASE:=		1
PKG_HASH:=		0a05af1a5978175de852b2cf61763ec789f2845df78edb8d02a28611439b57f7
PKG_DESCR:=		imx vpu library
PKG_DEPENDS:=		firmware-imx
PKG_SECTION:=		libs/video
PKG_URL:=		http://www.freescale.com/
PKG_SITES:=		http://www.freescale.com/lgfiles/NMG/MAD/YOCTO/

PKG_SYSTEM_DEPENDS:=	solidrun-imx6

DISTFILES:=             ${PKG_NAME}-${PKG_VERSION}.bin

include $(ADK_TOPDIR)/mk/package.mk

$(eval $(call PKG_template,IMX_VPU,imx-vpu,$(PKG_VERSION)-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))

TARGET_CPPFLAGS+=	-I${LINUX_DIR}/drivers/mxc/security/rng/include \
			-I$(LINUX_DIR)/drivers/mxc/security/sahara2/include \
			-idirafter $(LINUX_DIR)/include/uapi
MAKE_ENV+=		PLATFORM=IMX6Q
CONFIG_STYLE:=		manual

imx-vpu-install:
	$(INSTALL_DIR) $(IDIR_IMX_VPU)/usr/lib
	$(CP) $(WRKINST)/usr/lib/libvpu.so* \
		$(IDIR_IMX_VPU)/usr/lib

include ${ADK_TOPDIR}/mk/pkg-bottom.mk
