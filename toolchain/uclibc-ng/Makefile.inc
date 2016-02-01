# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

PKG_NAME:=		uClibc-ng
ifeq ($(ADK_LIBC_VERSION),git)
PKG_VERSION:=		git
PKG_RELEASE:=		1
PKG_SITES:=		git://uclibc-ng.org/git/uclibc-ng
endif
ifeq ($(ADK_TARGET_LIB_UCLIBC_NG_1_0_12),y)
PKG_VERSION:=		1.0.12
PKG_RELEASE:=		1
PKG_SITES:=		http://downloads.uclibc-ng.org/releases/1.0.12/
PKG_HASH:=		c238b300356b2638432e023076293f29935094108a2714ad1762b76015fae729
endif
ifeq ($(ADK_TARGET_LIB_UCLIBC_NG_1_0_11),y)
PKG_VERSION:=		1.0.11
PKG_RELEASE:=		1
PKG_SITES:=		http://downloads.uclibc-ng.org/releases/1.0.11/
PKG_HASH:=		2fdc6b9015f8049be0eb12a5e3e446de471fb80061115afd8d72ea582cb22b74
endif
ifeq ($(ADK_TARGET_LIB_UCLIBC_NG_1_0_10),y)
PKG_VERSION:=		1.0.10
PKG_RELEASE:=		1
PKG_SITES:=		http://downloads.uclibc-ng.org/releases/1.0.10/
PKG_HASH:=		3e3fcd77dc5a0b41b3555f3524e38a74d9abe08899a8647f5fe339e825de7de5
endif
DISTFILES:=		$(PKG_NAME)-$(PKG_VERSION).tar.xz
