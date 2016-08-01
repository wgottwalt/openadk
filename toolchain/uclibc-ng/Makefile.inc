# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

PKG_NAME:=		uClibc-ng
ifeq ($(ADK_LIBC_VERSION),git)
PKG_VERSION:=		git
PKG_RELEASE:=		1
PKG_SITES:=		git://uclibc-ng.org/git/uclibc-ng
endif
ifeq ($(ADK_TARGET_LIB_UCLIBC_NG_1_0_17),y)
PKG_VERSION:=		1.0.17
PKG_RELEASE:=		1
PKG_SITES:=		http://downloads.uclibc-ng.org/releases/1.0.17/
PKG_HASH:=		a2e7207634c19997e8b9f3e712182d80d42aaa85ce3462eff1a9bce812aaf354
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
DISTFILES:=		$(PKG_NAME)-$(PKG_VERSION).tar.xz
