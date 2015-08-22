# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

PKG_NAME:=		uClibc-ng
ifeq ($(ADK_LIBC_VERSION),git)
PKG_VERSION:=		git
PKG_RELEASE:=		1
PKG_SITES:=		git://uclibc-ng.org/git/uclibc-ng
endif
ifeq ($(ADK_TARGET_LIB_UCLIBC_NG_1_0_6),y)
PKG_VERSION:=		1.0.6
PKG_RELEASE:=		1
PKG_SITES:=		http://downloads.uclibc-ng.org/releases/1.0.6/
PKG_HASH:=		afb2ec318fe5b115165e3fdc22964a2fd2b68e03a652ac36164ed096b4bb795c
endif
DISTFILES:=		$(PKG_NAME)-$(PKG_VERSION).tar.xz
