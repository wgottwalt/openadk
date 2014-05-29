# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(TOPDIR)/rules.mk

PKG_NAME:=		u-boot-imx6
PKG_VERSION:=		20140416
PKG_RELEASE:=		1
PKG_MD5SUM:=		f2a5f697670c340eef8074f6a5f26476
PKG_DESCR:=		bootloader for imx6 (cubox-i)
PKG_SECTION:=		base/boot
PKG_URL:=		https://github.com/SolidRun/u-boot-imx6.git
PKG_SITES:=		http://openadk.org/distfiles/

DISTFILES:=		${PKG_NAME}-${PKG_VERSION}.tar.xz

PKG_SYSTEM_DEPENDS:=	cubox-i

include $(TOPDIR)/mk/package.mk

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

include ${TOPDIR}/mk/pkg-bottom.mk
