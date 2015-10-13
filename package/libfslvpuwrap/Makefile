# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(ADK_TOPDIR)/rules.mk

PKG_NAME:=		libfslvpuwrap
PKG_VERSION:=		1.0.58
PKG_RELEASE:=		1
PKG_HASH:=		a278eb18ec24230166ac39e2eadf7b934798f0432654c2e24c4cb69c3ac1cf0f
PKG_DESCR:=		vpu wrapper library
PKG_SECTION:=		libs/video
PKG_BUILDDEP:=		imx-lib imx-vpu
PKG_DEPENDS:=		imx-lib imx-vpu
PKG_URL:=		http://www.freescale.com/
PKG_SITES:=		http://www.freescale.com/lgfiles/NMG/MAD/YOCTO/

PKG_SYSTEM_DEPENDS:=	solidrun-imx6

DISTFILES:=             ${PKG_NAME}-${PKG_VERSION}.bin

include $(ADK_TOPDIR)/mk/package.mk

$(eval $(call PKG_template,LIBFSLVPUWRAP,libfslvpuwrap,$(PKG_VERSION)-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))

libfslvpuwrap-install:
	$(INSTALL_DIR) $(IDIR_LIBFSLVPUWRAP)/usr/lib
	$(CP) $(WRKINST)/usr/lib/libfslvpuwrap.so* \
		$(IDIR_LIBFSLVPUWRAP)/usr/lib

include ${ADK_TOPDIR}/mk/pkg-bottom.mk
