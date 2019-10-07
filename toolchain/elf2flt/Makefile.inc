# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

PKG_NAME:=		elf2flt
PKG_VERSION:=		7e33f28df198c46764021ed14408bd262751e148
PKG_GIT:=		hash
PKG_RELEASE:=		1
PKG_SITES:=		https://github.com/uclinux-dev/elf2flt.git
ifeq ($(ADK_TARGET_ARCH_H8300),y)
PKG_VERSION:=		h8300
PKG_GIT:=		branch
PKG_RELEASE:=		1
PKG_SITES:=		git://git.osdn.net/gitroot/uclinux-h8/elf2flt.git
endif
ifeq ($(ADK_TARGET_ARCH_LM32),y)
PKG_VERSION:=		3051fec89bbd30de6f952dc3100712feff3ca076
PKG_GIT:=		hash
PKG_RELEASE:=		1
PKG_SITES:=		https://github.com/m-labs/elf2flt-lm32.git
endif
