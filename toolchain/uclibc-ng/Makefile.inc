# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

PKG_NAME:=		uClibc-ng
ifeq ($(ADK_LIBC_VERSION),git)
PKG_VERSION:=		git
PKG_RELEASE:=		1
PKG_SITES:=		git://uclibc-ng.org/git/uclibc-ng
endif
ifeq ($(ADK_TARGET_LIB_UCLIBC_NG_1_0_34),y)
PKG_VERSION:=		1.0.34
PKG_RELEASE:=		1
PKG_SITES:=		http://downloads.uclibc-ng.org/releases/1.0.34/
PKG_HASH:=		e6776229eee8d3f5a1cd29fb4286630e3cb9e97dded4e8f4a3a9bb4fa8c0d5e3
endif
DISTFILES:=		$(PKG_NAME)-$(PKG_VERSION).tar.xz
