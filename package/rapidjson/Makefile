# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(ADK_TOPDIR)/rules.mk

PKG_NAME:=		rapidjson
PKG_VERSION:=		1.1.0
PKG_RELEASE:=		1
PKG_HASH:=		bf7ced29704a1e696fbccf2a2b4ea068e7774fa37f6d7dd4039d0787f8bed98e
PKG_DESCR:=		fast json parser/generator for c++
PKG_SECTION:=		libs/data
PKG_URL:=		http://rapidjson.org
PKG_SITES:=		https://github.com/Tencent/rapidjson/archive/
PKG_OPTS:=		dev

DISTFILES:=             v$(PKG_VERSION).tar.gz

include $(ADK_TOPDIR)/mk/package.mk

$(eval $(call PKG_template,RAPIDJSON,rapidjson,$(PKG_VERSION)-$(PKG_RELEASE),$(PKG_DEPENDS),$(PKG_DESCR),$(PKG_SECTION),$(PKG_OPTS)))

CONFIG_STYLE:=		cmake
CMAKE_FLAGS+=		-DRAPIDJSON_BUILD_DOC=OFF \
			-DRAPIDJSON_BUILD_EXAMPLES=OFF \
			-DRAPIDJSON_BUILD_TESTS=OFF \
			-DRAPIDJSON_BUILD_THIRDPARTY_GTEST=OFF \
			-DRAPIDJSON_BUILD_ASAN=OFF \
			-DRAPIDJSON_BUILD_UBSAN=OFF \
			-DRAPIDJSON_HAS_STDSTRING=ON

rapidjson-install:

include $(ADK_TOPDIR)/mk/pkg-bottom.mk
