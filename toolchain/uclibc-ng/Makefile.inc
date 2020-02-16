# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

PKG_NAME:=		uClibc-ng
ifeq ($(ADK_LIBC_VERSION),git)
PKG_VERSION:=		git
PKG_RELEASE:=		1
PKG_SITES:=		git://uclibc-ng.org/git/uclibc-ng
endif
ifeq ($(ADK_TARGET_LIB_UCLIBC_NG_1_0_33),y)
PKG_VERSION:=		1.0.33
PKG_RELEASE:=		1
PKG_SITES:=		http://downloads.uclibc-ng.org/releases/1.0.33/
PKG_HASH:=		4dfa9d438863f741a5a2f384d467fa9da397fd82acfcb9bb26f5d5634d70153a
endif
DISTFILES:=		$(PKG_NAME)-$(PKG_VERSION).tar.xz
