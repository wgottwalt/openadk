# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

PKG_NAME:=		glibc
ifeq ($(ADK_LIBC_VERSION),git)
PKG_VERSION:=		2.23.90
PKG_SITES:=		git://sourceware.org/git/glibc.git
PKG_RELEASE:=		1
endif
ifeq ($(ADK_TARGET_LIB_GLIBC_2_24),y)
PKG_VERSION:=		2.24
PKG_SITES:=		${MASTER_SITE_GNU:=glibc/}
PKG_RELEASE:=		1
PKG_HASH:=		99d4a3e8efd144d71488e478f62587578c0f4e1fa0b4eed47ee3d4975ebeb5d3
endif
ifeq ($(ADK_TARGET_LIB_GLIBC_2_23),y)
PKG_VERSION:=		2.23
PKG_SITES:=		${MASTER_SITE_GNU:=glibc/}
PKG_RELEASE:=		1
PKG_HASH:=		94efeb00e4603c8546209cefb3e1a50a5315c86fa9b078b6fad758e187ce13e9
endif
ifeq ($(ADK_TARGET_LIB_GLIBC_2_22),y)
PKG_VERSION:=		2.22
PKG_SITES:=		${MASTER_SITE_GNU:=glibc/}
PKG_RELEASE:=		1
PKG_HASH:=		eb731406903befef1d8f878a46be75ef862b9056ab0cde1626d08a7a05328948
endif
ifeq ($(ADK_TARGET_LIB_GLIBC_OR1K),y)
PKG_VERSION:=		2.19.90
PKG_SITES:=		https://github.com/bluecmd/or1k-glibc.git
PKG_RELEASE:=		1
endif
DISTFILES:=		$(PKG_NAME)-$(PKG_VERSION).tar.xz
