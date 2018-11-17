# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

PKG_NAME:=		uClibc-ng
ifeq ($(ADK_LIBC_VERSION),git)
PKG_VERSION:=		git
PKG_RELEASE:=		1
PKG_SITES:=		git://uclibc-ng.org/git/uclibc-ng
endif
ifeq ($(ADK_TARGET_LIB_UCLIBC_NG_1_0_31),y)
PKG_VERSION:=		1.0.31
PKG_RELEASE:=		1
PKG_SITES:=		http://downloads.uclibc-ng.org/releases/1.0.31/
PKG_HASH:=		2215d7377118434d1697fd575f10d7a6be3f29e460d6b0e1ee9f6f5306288060
endif
DISTFILES:=		$(PKG_NAME)-$(PKG_VERSION).tar.xz
