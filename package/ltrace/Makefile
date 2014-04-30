# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(TOPDIR)/rules.mk

PKG_NAME:=		ltrace
PKG_VERSION:=		0.7.3
PKG_RELEASE:=		1
PKG_MD5SUM:=		2cb7660738b1e28fd84ce0dc06f6ea69
PKG_DESCR:=		intercepts and records dynamic library calls 
PKG_SECTION:=		debug
PKG_DEPENDS:=		libelf
PKG_BUILDDEP:=		libelf
PKG_URL:=		http://ltrace.org/
PKG_SITES:=		https://alioth.debian.org/frs/download.php/file/3948/

include $(TOPDIR)/mk/package.mk

$(eval $(call PKG_template,LTRACE,ltrace,$(PKG_VERSION)-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))

ltrace-install:
	$(INSTALL_DIR) $(IDIR_LTRACE)/usr/sbin
	$(INSTALL_BIN) $(WRKINST)/usr/bin/ltrace \
		$(IDIR_LTRACE)/usr/sbin

include ${TOPDIR}/mk/pkg-bottom.mk
