# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(ADK_TOPDIR)/rules.mk

PKG_NAME:=		libfslvpuwrap
PKG_VERSION:=		1.0.46
PKG_RELEASE:=		1
PKG_MD5SUM:=		1f50110cb6de8ebf767fb9c5f8baf20d
PKG_DESCR:=		VPU wrapper library
PKG_SECTION:=		libs/video
PKG_BUILDDEP:=		imx-lib imx-vpu
PKG_DEPENDS:=		imx-lib imx-vpu
PKG_URL:=		http://www.freescale.com/
PKG_SITES:=		http://www.freescale.com/lgfiles/NMG/MAD/YOCTO/

DISTFILES:=             ${PKG_NAME}-${PKG_VERSION}.bin

include $(ADK_TOPDIR)/mk/package.mk

$(eval $(call PKG_template,LIBFSLVPUWRAP,libfslvpuwrap,$(PKG_VERSION)-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))

libfslvpuwrap-install:
	$(INSTALL_DIR) $(IDIR_LIBFSLVPUWRAP)/usr/lib
	$(CP) $(WRKINST)/usr/lib/libfslvpuwrap.so* \
		$(IDIR_LIBFSLVPUWRAP)/usr/lib

include ${ADK_TOPDIR}/mk/pkg-bottom.mk
