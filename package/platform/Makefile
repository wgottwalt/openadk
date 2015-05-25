# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(ADK_TOPDIR)/rules.mk

PKG_NAME:=		platform
PKG_VERSION:=		aafa6e9f3b86f2258f5f75809849743b1779072b
PKG_RELEASE:=		1
PKG_DESCR:=		platform library used by libcec
PKG_SECTION:=		libs/misc
PKG_URL:=		https://github.com/Pulse-Eight/platform
PKG_SITES:=		https://github.com/Pulse-Eight/platform.git
PKG_LIBNAME:=		libplatform
PKG_OPTS:=		dev

include $(ADK_TOPDIR)/mk/package.mk

$(eval $(call PKG_template,LIBPLATFORM,libplatform,$(PKG_VERSION)-$(PKG_RELEASE),$(PKG_DEPENDS),$(PKG_DESCR),$(PKG_SECTION),$(PKG_OPTS)))

CONFIG_STYLE:=		cmake

libplatform-install:
	:

include $(ADK_TOPDIR)/mk/pkg-bottom.mk
