# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(TOPDIR)/rules.mk

PKG_NAME:=		yasm
PKG_VERSION:=		1.1.0
PKG_RELEASE:=		1
PKG_MD5SUM:=		8392e5f2235c2c2a981e1a633f2698cb
PKG_DESCR:=		Modular Assembler Project
PKG_SECTION:=		misc
PKG_URL:=		http://www.tortall.net/projects/yasm/
PKG_SITES:=		http://www.tortall.net/projects/yasm/releases/

include $(TOPDIR)/mk/package.mk

$(eval $(call PKG_template,YASM,yasm,$(PKG_VERSION)-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))

yasm-install:
	$(INSTALL_DIR) $(IDIR_YASM)/usr/bin
	$(INSTALL_BIN) $(WRKINST)/usr/bin/yasm $(IDIR_YASM)/usr/bin

include ${TOPDIR}/mk/pkg-bottom.mk
