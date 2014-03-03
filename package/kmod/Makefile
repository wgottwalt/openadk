# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(TOPDIR)/rules.mk

PKG_NAME:=		kmod
PKG_VERSION:=		15
PKG_RELEASE:=		1
PKG_MD5SUM:=		d03372179ed2cfa0c52b6672cf438901
PKG_DESCR:=		kernel module loading library
PKG_SECTION:=		libs
PKG_URL:=		http://profusion.mobi/index.php
PKG_SITES:=		https://www.kernel.org/pub/linux/utils/kernel/kmod/
PKG_OPTS:=		dev

DISTFILES:=             ${PKG_NAME}-${PKG_VERSION}.tar.xz

include $(TOPDIR)/mk/package.mk

$(eval $(call PKG_template,KMOD,kmod,$(PKG_VERSION)-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION},${PKG_OPTS}))

CONFIG_STYLE:=		minimal
CONFIGURE_ARGS+=	--host=${GNU_TARGET_NAME}

kmod-install:
	$(INSTALL_DIR) $(IDIR_KMOD)/usr/bin
	$(INSTALL_DIR) $(IDIR_KMOD)/usr/lib
	$(INSTALL_BIN) $(WRKINST)/usr/bin/kmod \
		$(IDIR_KMOD)/usr/bin
	$(CP) $(WRKINST)/usr/lib/libkmod*.so* \
		$(IDIR_KMOD)/usr/lib

include ${TOPDIR}/mk/pkg-bottom.mk
