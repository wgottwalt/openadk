# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(TOPDIR)/rules.mk

PKG_NAME:=		u-boot-cubox-i
PKG_VERSION:=		2014.02.16
PKG_RELEASE:=		1
PKG_MD5SUM:=		6f8809f69df21fc2ff1cc692aca82939
PKG_DESCR:=		bootloader for cubox-i (imx6)
PKG_SECTION:=		boot
PKG_URL:=		https://github.com/rabeeh/u-boot-imx6.git
PKG_SITES:=		http://openadk.org/distfiles/

PKG_SYSTEM_DEPENDS:=	cubox-i

include $(TOPDIR)/mk/package.mk

$(eval $(call PKG_template,U_BOOT_CUBOX_I,u-boot-cubox-i,$(PKG_VERSION)-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))

CONFIG_STYLE:=		manual
XAKE_FLAGS+=		GCC_HONOUR_COPTS=s
# u-boot uses ld directly
TARGET_LDFLAGS:=
INSTALL_STYLE:=		manual

do-configure:
	cd ${WRKBUILD}; $(MAKE) mx6_cubox-i_config

u-boot-cubox-i-install:
	$(INSTALL_DIR) ${WRKINST}/boot
	$(CP) ${WRKBUILD}/SPL ${WRKINST}/boot
	$(CP) ${WRKBUILD}/u-boot.img ${WRKINST}/boot	

include ${TOPDIR}/mk/pkg-bottom.mk
