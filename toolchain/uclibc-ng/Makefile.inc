# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

PKG_NAME:=		uClibc-ng
ifeq ($(ADK_LIBC_VERSION),git)
PKG_VERSION:=		git
PKG_RELEASE:=		1
PKG_SITES:=		git://uclibc-ng.org/git/uclibc-ng
else
PKG_VERSION:=		$(ADK_LIBC_VERSION)
PKG_RELEASE:=		1
PKG_SITES:=		http://downloads.uclibc-ng.org/releases/$(ADK_LIBC_VERSION)/
PKG_HASH:=		56258bfa62e3a70c5d29480ccd8f8d94fc2740233a493d8c66b6e7a37830b9d1
endif
DISTFILES:=		$(PKG_NAME)-$(PKG_VERSION).tar.xz
