# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

PKG_NAME:=		elf2flt
PKG_VERSION:=		6d80ab6c93409e796f85da404bde84b841231531
PKG_GIT:=		hash
PKG_RELEASE:=		1
PKG_SITES:=		https://github.com/uclinux-dev/elf2flt.git
ifeq ($(ADK_TARGET_ARCH_H8300),y)
PKG_VERSION:=		h8300
PKG_GIT:=		branch
PKG_RELEASE:=		1
PKG_SITES:=		git://git.osdn.net/gitroot/uclinux-h8/elf2flt.git
endif
