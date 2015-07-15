# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

PKG_NAME:=		uClibc-ng
ifeq ($(ADK_LIBC_VERSION),git)
PKG_VERSION:=		git
PKG_RELEASE:=		1
PKG_SITES:=		git://uclibc-ng.org/git/uclibc-ng
endif
ifeq ($(ADK_TARGET_LIB_UCLIBC_NG_1_0_4),y)
PKG_VERSION:=		1.0.4
PKG_RELEASE:=		1
PKG_SITES:=		http://downloads.uclibc-ng.org/releases/1.0.4/
PKG_HASH:=		c037dbaea685380c75b112b5503778a90fa95ac524728770131aa17e29474915
endif
DISTFILES:=		$(PKG_NAME)-$(PKG_VERSION).tar.xz
