# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

PKG_NAME:=		uClibc-ng
ifeq ($(ADK_LIBC_VERSION),git)
PKG_VERSION:=		git
PKG_RELEASE:=		1
PKG_SITES:=		git://uclibc-ng.org/git/uclibc-ng
endif
ifeq ($(ADK_TARGET_LIB_UCLIBC_NG_1_0_27),y)
PKG_VERSION:=		1.0.27
PKG_RELEASE:=		1
PKG_SITES:=		http://downloads.uclibc-ng.org/releases/1.0.27/
PKG_HASH:=		9452b0e92f76db19d8ff30b2d6d10a80e1ed01e4c504a36fef34cfc9de490b24
endif
DISTFILES:=		$(PKG_NAME)-$(PKG_VERSION).tar.xz
