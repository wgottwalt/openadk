# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

PKG_NAME:=		uClibc
ifeq ($(ADK_LIBC_VERSION),git)
PKG_VERSION:=		0.9.34-git
PKG_RELEASE:=		1
PKG_REPO:=		git://git.uclibc.org/uClibc.git
else
PKG_VERSION:=		$(ADK_LIBC_VERSION)
PKG_RELEASE:=		1
PKG_SITES:=		http://uclibc.org/downloads/
endif
PKG_MD5SUM:=		73e6fe215648d02246f4d195b25fb17e
DISTFILES:=		$(PKG_NAME)-$(PKG_VERSION).tar.xz
