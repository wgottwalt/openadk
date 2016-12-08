# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(ADK_TOPDIR)/rules.mk

PKG_NAME:=		helloworld
PKG_VERSION:=		1.0
PKG_RELEASE:=		1
PKG_DESCR:=		hello world
PKG_SECTION:=		base/tests

NO_DISTFILES:=		1

include $(ADK_TOPDIR)/mk/package.mk

$(eval $(call PKG_template,HELLOWORLD,helloworld,$(PKG_VERSION)-$(PKG_RELEASE),$(PKG_DEPENDS),$(PKG_DESCR),$(PKG_SECTION)))

CONFIG_STYLE:=		manual
BUILD_STYLE:=		manual
INSTALL_STYLE:=		manual

do-build:
	$(TARGET_CC) $(TARGET_CFLAGS) -o $(WRKBUILD)/helloworld $(WRKBUILD)/helloworld.c
	$(TARGET_CC) $(TARGET_CFLAGS) -static -o $(WRKBUILD)/helloworld.static $(WRKBUILD)/helloworld.c

helloworld-install:
	$(INSTALL_DIR) $(IDIR_HELLOWORLD)/usr/bin
	$(INSTALL_BIN) $(WRKBUILD)/helloworld{,.static} \
		$(IDIR_HELLOWORLD)/usr/bin

include $(ADK_TOPDIR)/mk/pkg-bottom.mk
