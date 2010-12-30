# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(TOPDIR)/rules.mk

PKG_NAME:=		syslinux
PKG_VERSION:=		4.03
PKG_RELEASE:=		1
PKG_MD5SUM:=		086ac1c569d226a5e2ae3d605de09a1d
PKG_DESCR:=		lightweight bootloaders
PKG_SECTION:=		misc
PKG_BUILDDEP:=		nasm
PKG_URL:=		http://syslinux.zytor.com/wiki/index.php/The_Syslinux_Project
PKG_SITES:=		http://www.kernel.org/pub/linux/utils/boot/syslinux/

include $(TOPDIR)/mk/package.mk

$(eval $(call PKG_template,SYSLINUX,$(PKG_NAME),$(PKG_VERSION)-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))

CONFIG_STYLE:=		manual
FAKE_FLAGS+=		INSTALLROOT=${WRKINST}

post-install:
	$(INSTALL_DIR) $(IDIR_SYSLINUX)/usr/bin
	$(INSTALL_BIN) $(WRKINST)/usr/bin/syslinux \
		$(IDIR_SYSLINUX)/usr/bin

include ${TOPDIR}/mk/pkg-bottom.mk
