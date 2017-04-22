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
PKG_HASH:=		03f1e15787fabd53e9e984a1f59ef40ce79c63367de8ee2580cec7feffa6d706
endif
DISTFILES:=		$(PKG_NAME)-$(PKG_VERSION).tar.xz
