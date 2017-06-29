# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(ADK_TOPDIR)/rules.mk

PKG_NAME:=		jsoncpp
PKG_VERSION:=		9cb88d2ca66af19c53a98843d159cc1d32ebaec6
PKG_GIT:=		hash
PKG_RELEASE:=		1
PKG_DESCR:=		c++ library for json
PKG_SECTION:=		libs/misc
PKG_BUILDDEP:=		cmake-host
PKG_NEEDS:=		c++
PKG_URL:=		https://github.com/open-source-parsers/jsoncpp
PKG_SITES:=		https://github.com/open-source-parsers/jsoncpp.git
PKG_OPTS:=		dev

include $(ADK_TOPDIR)/mk/package.mk

$(eval $(call PKG_template,JSONCPP,jsoncpp,$(PKG_VERSION)-$(PKG_RELEASE),$(PKG_DEPENDS),$(PKG_DESCR),$(PKG_SECTION),$(PKG_OPTS)))

CONFIG_STYLE:=		cmake
CMAKE_FLAGS:=		-DJSONCPP_WITH_TESTS=OFF -DJSONCPP_WITH_POST_BUILD_UNITTEST=OFF

jsoncpp-install:
	$(INSTALL_DIR) $(IDIR_JSONCPP)/usr/lib

include $(ADK_TOPDIR)/mk/pkg-bottom.mk
