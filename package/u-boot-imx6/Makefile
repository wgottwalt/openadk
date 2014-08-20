# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(ADK_TOPDIR)/rules.mk

PKG_NAME:=		u-boot-imx6
PKG_VERSION:=		20140819
PKG_RELEASE:=		1
PKG_MD5SUM:=		41ae410a775e336c81a9a22ce836a74f
PKG_DESCR:=		bootloader for imx6 (cubox-i/hummingboard)
PKG_SECTION:=		base/boot
PKG_URL:=		https://github.com/SolidRun/u-boot-imx6.git
PKG_SITES:=		http://openadk.org/distfiles/

PKG_SYSTEM_DEPENDS:=	cubox-i hummingboard

include $(ADK_TOPDIR)/mk/package.mk

$(eval $(call PKG_template,U_BOOT_IMX6,u-boot-imx6,$(PKG_VERSION)-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))

CONFIG_STYLE:=		manual
XAKE_FLAGS+=		GCC_HONOUR_COPTS=s
# u-boot uses ld directly
TARGET_LDFLAGS:=
INSTALL_STYLE:=		manual

do-configure:
	cd ${WRKBUILD}; $(MAKE) mx6_cubox-i_config

u-boot-imx6-install:
	$(INSTALL_DIR) ${FW_DIR}
	$(CP) ${WRKBUILD}/SPL ${FW_DIR}
	$(CP) ${WRKBUILD}/u-boot.img ${FW_DIR}

include ${ADK_TOPDIR}/mk/pkg-bottom.mk
