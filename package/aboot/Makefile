# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(ADK_TOPDIR)/rules.mk

PKG_NAME:=		aboot
PKG_VERSION:=		1.0
PKG_RELEASE:=		1
PKG_DESCR:=		srm boot loader for alpha machines
PKG_SECTION:=		base/boot

NO_DISTFILES:=		1

PKG_ARCH_DEPENDS:=	alpha

include $(ADK_TOPDIR)/mk/package.mk

$(eval $(call PKG_template,ABOOT,aboot,$(PKG_VERSION)-$(PKG_RELEASE),$(PKG_DEPENDS),$(PKG_DESCR),$(PKG_SECTION)))

CONFIG_STYLE:=		manual

aboot-install:

include $(ADK_TOPDIR)/mk/pkg-bottom.mk
