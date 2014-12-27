# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

PKG_NAME:=		uClibc
ifeq ($(ADK_LIBC_VERSION),git)
PKG_VERSION:=		0.9.34-git
PKG_RELEASE:=		1
PKG_SITES:=		git://git.uclibc.org/uClibc.git
DISTFILES:=		$(PKG_NAME)-$(PKG_VERSION).tar.xz
else
PKG_VERSION:=		$(ADK_LIBC_VERSION)
PKG_RELEASE:=		1
PKG_HASH:=		62333167b79afb0b25a843513288c67b59547acf653e8fbe62ee64e71ebd1587
PKG_SITES:=		http://uclibc.org/downloads/
DISTFILES:=		$(PKG_NAME)-$(PKG_VERSION).tar.xz
endif
