# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

PKG_NAME:=		uClibc-ng
ifeq ($(ADK_LIBC_VERSION),git)
PKG_VERSION:=		git
PKG_RELEASE:=		1
PKG_SITES:=		git://uclibc-ng.org/git/uclibc-ng
endif
ifeq ($(ADK_TARGET_LIB_UCLIBC_NG_1_0_22),y)
PKG_VERSION:=		1.0.22
PKG_RELEASE:=		1
PKG_SITES:=		http://downloads.uclibc-ng.org/releases/1.0.22/
PKG_HASH:=		f2004c85db8e07e9f1c2e8b7c513fa7c237bc9f9685d8e1bfc89535b8a85449b
endif
DISTFILES:=		$(PKG_NAME)-$(PKG_VERSION).tar.xz
