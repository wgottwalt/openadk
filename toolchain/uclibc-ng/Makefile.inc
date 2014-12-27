# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

PKG_NAME:=		uClibc-ng
ifeq ($(ADK_LIBC_VERSION),git)
PKG_VERSION:=		1.0.0
PKG_REPO:=		http://git.uclibc-ng.org/uclibc-ng.git
else
PKG_VERSION:=		$(ADK_LIBC_VERSION)
PKG_SITES:=		http://downloads.uclibc-ng.org/
endif
PKG_RELEASE:=		1
PKG_HASH:=		28fad4160d64e268ee5a3654e3dfc13a
DISTFILES:=		$(PKG_NAME)-$(PKG_VERSION).tar.xz
