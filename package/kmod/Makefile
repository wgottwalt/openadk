# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(TOPDIR)/rules.mk

PKG_NAME:=		kmod
PKG_VERSION:=		17
PKG_RELEASE:=		1
PKG_MD5SUM:=		bc36d28b12dcb2b664a35411560c5610
PKG_DESCR:=		kernel module loading library
PKG_SECTION:=		libs/misc
PKG_URL:=		http://profusion.mobi/index.php
PKG_SITES:=		https://www.kernel.org/pub/linux/utils/kernel/kmod/
PKG_OPTS:=		dev

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
