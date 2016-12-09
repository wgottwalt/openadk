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
ifeq ($(ADK_TARGET_ARCH_METAG),)
	$(TARGET_CC) $(TARGET_CFLAGS) -static -o $(WRKBUILD)/helloworld.static $(WRKBUILD)/helloworld.c
endif
ifeq ($(ADK_TOOLCHAIN_WITH_CXX),y)
	$(TARGET_CXX) $(TARGET_CXXFLAGS) -o $(WRKBUILD)/helloworld-cxx $(WRKBUILD)/helloworld.cc
ifeq ($(ADK_TARGET_ARCH_METAG),)
	$(TARGET_CXX) $(TARGET_CXXFLAGS) -static -static-libstdc++ -o $(WRKBUILD)/helloworld-cxx.static $(WRKBUILD)/helloworld.cc
endif
endif

helloworld-install:
	$(INSTALL_DIR) $(IDIR_HELLOWORLD)/usr/bin
	$(INSTALL_BIN) $(WRKBUILD)/helloworld \
		$(IDIR_HELLOWORLD)/usr/bin
ifeq ($(ADK_TARGET_ARCH_METAG),)
	$(INSTALL_BIN) $(WRKBUILD)/helloworld.static \
		$(IDIR_HELLOWORLD)/usr/bin
endif
ifeq ($(ADK_TOOLCHAIN_WITH_CXX),y)
	$(INSTALL_BIN) $(WRKBUILD)/helloworld-cxx \
		$(IDIR_HELLOWORLD)/usr/bin
ifeq ($(ADK_TARGET_ARCH_METAG),)
	$(INSTALL_BIN) $(WRKBUILD)/helloworld-cxx.static \
		$(IDIR_HELLOWORLD)/usr/bin
endif
endif

include $(ADK_TOPDIR)/mk/pkg-bottom.mk
