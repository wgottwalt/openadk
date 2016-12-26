# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

PKG_NAME:=		uClibc-ng
ifeq ($(ADK_LIBC_VERSION),git)
PKG_VERSION:=		git
PKG_RELEASE:=		1
PKG_SITES:=		git://uclibc-ng.org/git/uclibc-ng
endif
ifeq ($(ADK_TARGET_LIB_UCLIBC_NG_1_0_21),y)
PKG_VERSION:=		1.0.21
PKG_RELEASE:=		1
PKG_SITES:=		http://downloads.uclibc-ng.org/releases/1.0.21/
PKG_HASH:=		6e99ebebe8a46ddcd26615828d51b62dbf580568aa58bf5f495da37eba0c872d
endif
DISTFILES:=		$(PKG_NAME)-$(PKG_VERSION).tar.xz
