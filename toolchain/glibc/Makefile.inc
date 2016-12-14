# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

PKG_NAME:=		glibc
ifeq ($(ADK_LIBC_VERSION),git)
PKG_VERSION:=		2.24.90
PKG_SITES:=		git://sourceware.org/git/glibc.git
PKG_RELEASE:=		1
endif
ifeq ($(ADK_TARGET_LIB_GLIBC_2_24),y)
PKG_VERSION:=		2.24
PKG_SITES:=		${MASTER_SITE_GNU:=glibc/}
PKG_RELEASE:=		1
PKG_HASH:=		99d4a3e8efd144d71488e478f62587578c0f4e1fa0b4eed47ee3d4975ebeb5d3
endif
DISTFILES:=		$(PKG_NAME)-$(PKG_VERSION).tar.xz
