# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

PKG_NAME:=		uClibc-ng
ifeq ($(ADK_LIBC_VERSION),git)
PKG_VERSION:=		git
PKG_RELEASE:=		1
PKG_SITES:=		git://uclibc-ng.org/git/uclibc-ng
endif
ifeq ($(ADK_TARGET_LIB_UCLIBC_NG_1_0_1),y)
PKG_VERSION:=		1.0.1
PKG_RELEASE:=		1
PKG_SITES:=		http://downloads.uclibc-ng.org/releases/1.0.1/
PKG_HASH:=		e561040293ba4f21dcf3285ca1f683b5a8493eb0ffd3b3e495122cfde5a64a0e
endif
ifeq ($(ADK_TARGET_LIB_UCLIBC_NG_1_0_0),y)
PKG_VERSION:=		1.0.0
PKG_RELEASE:=		1
PKG_SITES:=		http://downloads.uclibc-ng.org/releases/1.0.0/
PKG_HASH:=		56258bfa62e3a70c5d29480ccd8f8d94fc2740233a493d8c66b6e7a37830b9d1
endif
DISTFILES:=		$(PKG_NAME)-$(PKG_VERSION).tar.xz
