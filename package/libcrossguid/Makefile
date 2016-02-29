# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(ADK_TOPDIR)/rules.mk

PKG_NAME:=		libcrossguid
PKG_VERSION:=		8f399e8bd4252be9952f3dfa8199924cc8487ca4
PKG_RELEASE:=		1
PKG_GIT:=		hash
PKG_DESCR:=		c++ guid library
PKG_SECTION:=		libs/misc
PKG_URL:=		https://github.com/graeme-hill/crossguid
PKG_SITES:=		https://github.com/graeme-hill/crossguid.git
PKG_OPTS:=		dev

include $(ADK_TOPDIR)/mk/package.mk

$(eval $(call PKG_template,LIBCROSSGUID,libcrossguid,$(PKG_VERSION)-$(PKG_RELEASE),$(PKG_DEPENDS),$(PKG_DESCR),$(PKG_SECTION),$(PKG_OPTS)))

CONFIG_STYLE:=		manual
BUILD_STYLE:=		manual
INSTALL_STYLE:=		manual

TARGET_CPPFLAGS+=	-DGUID_LIBUUID
TARGET_CXXFLAGS+=	-std=c++11

do-build:
	$(TARGET_CXX) $(TARGET_CPPFLAGS) $(TARGET_CXXFLAGS) $(TARGET_LDFLAGS) \
		-c -o $(WRKBUILD)/guid.o $(WRKBUILD)/guid.cpp
	$(TARGET_AR) rvs $(WRKBUILD)/libcrossguid.a $(WRKBUILD)/guid.o

do-install:
	$(INSTALL_DIR) $(WRKINST)/usr/lib
	$(INSTALL_DIR) $(WRKINST)/usr/include
	$(CP) $(WRKBUILD)/libcrossguid.a $(WRKINST)/usr/lib
	$(CP) $(WRKBUILD)/guid.h $(WRKINST)/usr/include

libcrossguid-install:
	$(INSTALL_DIR) $(IDIR_LIBCROSSGUID)/usr/lib
	$(CP) $(WRKINST)/usr/lib/libcrossguid.a \
		$(IDIR_LIBCROSSGUID)/usr/lib

include $(ADK_TOPDIR)/mk/pkg-bottom.mk
