# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

PKG_NAME:=		uClibc-ng
ifeq ($(ADK_LIBC_VERSION),git)
PKG_VERSION:=		git
PKG_RELEASE:=		1
PKG_SITES:=		git://uclibc-ng.org/git/uclibc-ng
endif
ifeq ($(ADK_TARGET_LIB_UCLIBC_NG_1_0_25),y)
PKG_VERSION:=		1.0.25
PKG_RELEASE:=		1
PKG_SITES:=		http://downloads.uclibc-ng.org/releases/1.0.25/
PKG_HASH:=		a1208bd54fd8cbcc716140d985e228cf2f7e6265aa694c7f516fa6cb598808b2
endif
DISTFILES:=		$(PKG_NAME)-$(PKG_VERSION).tar.xz
