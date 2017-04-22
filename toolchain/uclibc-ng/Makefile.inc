# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

PKG_NAME:=		uClibc-ng
ifeq ($(ADK_LIBC_VERSION),git)
PKG_VERSION:=		git
PKG_RELEASE:=		1
PKG_SITES:=		git://uclibc-ng.org/git/uclibc-ng
endif
ifeq ($(ADK_TARGET_LIB_UCLIBC_NG_1_0_24),y)
PKG_VERSION:=		1.0.24
PKG_RELEASE:=		1
PKG_SITES:=		http://downloads.uclibc-ng.org/releases/1.0.24/
PKG_HASH:=		b5bf5bea5d836b0a0724d94f2211b279df3f5bda18a95e02c728cbf4bd33e939
endif
DISTFILES:=		$(PKG_NAME)-$(PKG_VERSION).tar.xz
