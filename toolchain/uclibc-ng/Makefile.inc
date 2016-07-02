# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

PKG_NAME:=		uClibc-ng
ifeq ($(ADK_LIBC_VERSION),git)
PKG_VERSION:=		git
PKG_RELEASE:=		1
PKG_SITES:=		git://uclibc-ng.org/git/uclibc-ng
endif
ifeq ($(ADK_TARGET_LIB_UCLIBC_NG_1_0_16),y)
PKG_VERSION:=		1.0.16
PKG_RELEASE:=		1
PKG_SITES:=		http://downloads.uclibc-ng.org/releases/1.0.16/
PKG_HASH:=		8de41ab1e774c4770a240009a85ad9c1566d82c52017267b99883d60e5bb10b3
endif
ifeq ($(ADK_TARGET_LIB_UCLIBC_NG_1_0_15),y)
PKG_VERSION:=		1.0.15
PKG_RELEASE:=		1
PKG_SITES:=		http://downloads.uclibc-ng.org/releases/1.0.15/
PKG_HASH:=		0f62f35217d9a0b5eb3810dd6de16ab3dd4323f3224c6b95423250ac1e19ee49
endif
ifeq ($(ADK_TARGET_LIB_UCLIBC_NG_1_0_14),y)
PKG_VERSION:=		1.0.14
PKG_RELEASE:=		1
PKG_SITES:=		http://downloads.uclibc-ng.org/releases/1.0.14/
PKG_HASH:=		3c63d9f8c8b98b65fa5c4040d1c8ab1b36e99a16e1093810cedad51ac15c9a9e
endif
DISTFILES:=		$(PKG_NAME)-$(PKG_VERSION).tar.xz
