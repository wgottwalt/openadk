# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(ADK_TOPDIR)/rules.mk

PKG_NAME:=		imx-vpu
PKG_VERSION:=		3.10.17-1.0.0
PKG_RELEASE:=		1
PKG_MD5SUM:=		71ea1b803864101ebf88a1bab45514d2
PKG_DESCR:=		IMX VPU library (Freescale)
PKG_SECTION:=		libs/video
PKG_URL:=		http://www.freescale.com/
PKG_SITES:=		http://www.freescale.com/lgfiles/NMG/MAD/YOCTO/

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
