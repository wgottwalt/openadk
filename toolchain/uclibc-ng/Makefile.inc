# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

PKG_NAME:=		uClibc-ng
ifeq ($(ADK_LIBC_VERSION),git)
PKG_VERSION:=		git
PKG_RELEASE:=		1
PKG_SITES:=		git://uclibc-ng.org/git/uclibc-ng
endif
ifeq ($(ADK_TARGET_LIB_UCLIBC_NG_1_0_29),y)
PKG_VERSION:=		1.0.29
PKG_RELEASE:=		1
PKG_SITES:=		http://downloads.uclibc-ng.org/releases/1.0.29/
PKG_HASH:=		e014e34abb13e97ca81694927f8ba95484cca2d3abac64b71f1a7981a96cb99c
endif
DISTFILES:=		$(PKG_NAME)-$(PKG_VERSION).tar.xz
