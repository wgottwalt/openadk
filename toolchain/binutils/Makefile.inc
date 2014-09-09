# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

PKG_NAME:=		binutils
ifeq ($(ADK_TOOLCHAIN_BINUTILS_2_24),y)
PKG_VERSION:=		2.24
PKG_MD5SUM:=		a5dd5dd2d212a282cc1d4a84633e0d88
PKG_RELEASE:=		1
PKG_SITES:=		${MASTER_SITE_GNU:=binutils/}
DISTFILES:=		${PKG_NAME}-${PKG_VERSION}.tar.gz
endif
ifeq ($(ADK_TOOLCHAIN_BINUTILS_2_23_ARC),y)
PKG_VERSION:=		2.23
PKG_MD5SUM:=		a5dd5dd2d212a282cc1d4a84633e0d88
PKG_RELEASE:=		1
PKG_SITES:=		http://www.openadk.org/distfiles/
DISTFILES:=		${PKG_NAME}-${PKG_VERSION}-arc.tar.xz
endif
ifeq ($(ADK_TOOLCHAIN_BINUTILS_2_22),y)
PKG_VERSION:=		2.22
PKG_MD5SUM:=		a5dd5dd2d212a282cc1d4a84633e0d88
PKG_RELEASE:=		1
PKG_SITES:=		${MASTER_SITE_GNU:=binutils/}
DISTFILES:=		${PKG_NAME}-${PKG_VERSION}.tar.gz
endif
ifeq ($(ADK_TOOLCHAIN_BINUTILS_2_20_1),y)
PKG_VERSION:=		2.20.1
PKG_MD5SUM:=		a5dd5dd2d212a282cc1d4a84633e0d88
PKG_RELEASE:=		1
PKG_SITES:=		${MASTER_SITE_GNU:=binutils/}
DISTFILES:=		${PKG_NAME}-${PKG_VERSION}.tar.gz
endif
