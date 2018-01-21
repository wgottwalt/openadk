# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

PKG_NAME:=		uClibc-ng
ifeq ($(ADK_LIBC_VERSION),git)
PKG_VERSION:=		git
PKG_RELEASE:=		1
PKG_SITES:=		git://uclibc-ng.org/git/uclibc-ng
endif
ifeq ($(ADK_TARGET_LIB_UCLIBC_NG_1_0_28),y)
PKG_VERSION:=		1.0.28
PKG_RELEASE:=		1
PKG_SITES:=		http://downloads.uclibc-ng.org/releases/1.0.28/
PKG_HASH:=		a1504ddc34a29cc9bfd1f5a7419c4b63bb510d9e2faed81618d1b596ceb0a5a9
endif
DISTFILES:=		$(PKG_NAME)-$(PKG_VERSION).tar.xz
