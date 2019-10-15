# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

PKG_NAME:=		uClibc-ng
ifeq ($(ADK_LIBC_VERSION),git)
PKG_VERSION:=		git
PKG_RELEASE:=		1
PKG_SITES:=		git://uclibc-ng.org/git/uclibc-ng
endif
ifeq ($(ADK_TARGET_LIB_UCLIBC_NG_1_0_32),y)
PKG_VERSION:=		1.0.32
PKG_RELEASE:=		1
PKG_SITES:=		http://downloads.uclibc-ng.org/releases/1.0.32/
PKG_HASH:=		891b5e4573855e4c11e51d3a518f89a82e490d9aa73280c05ce3e4d7e739a370
endif
DISTFILES:=		$(PKG_NAME)-$(PKG_VERSION).tar.xz
