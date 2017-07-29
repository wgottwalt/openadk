# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

PKG_NAME:=		uClibc-ng
ifeq ($(ADK_LIBC_VERSION),git)
PKG_VERSION:=		git
PKG_RELEASE:=		1
PKG_SITES:=		git://uclibc-ng.org/git/uclibc-ng
endif
ifeq ($(ADK_TARGET_LIB_UCLIBC_NG_1_0_26),y)
PKG_VERSION:=		1.0.26
PKG_RELEASE:=		1
PKG_SITES:=		http://downloads.uclibc-ng.org/releases/1.0.26/
PKG_HASH:=		d88470775192b01d278633953ccc9fecacd090e52f401d506a71add3e47d4694
endif
DISTFILES:=		$(PKG_NAME)-$(PKG_VERSION).tar.xz
