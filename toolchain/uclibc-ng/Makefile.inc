# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

PKG_NAME:=		uClibc-ng
ifeq ($(ADK_LIBC_VERSION),git)
PKG_VERSION:=		git
PKG_REPO:=		http://git.uclibc-ng.org/uClibc-ng.git
else
PKG_VERSION:=		$(ADK_LIBC_VERSION)
PKG_SITES:=		http://downloads.uclibc-ng.org/
endif
PKG_RELEASE:=		1
PKG_MD5SUM:=		8b0e3a1ea3ada84a126a7bf6715e69d4
DISTFILES:=		$(PKG_NAME)-$(PKG_VERSION).tar.xz
