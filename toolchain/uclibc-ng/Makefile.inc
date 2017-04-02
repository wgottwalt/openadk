# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

PKG_NAME:=		uClibc-ng
ifeq ($(ADK_LIBC_VERSION),git)
PKG_VERSION:=		git
PKG_RELEASE:=		1
PKG_SITES:=		git://uclibc-ng.org/git/uclibc-ng
endif
ifeq ($(ADK_TARGET_LIB_UCLIBC_NG_1_0_23),y)
PKG_VERSION:=		1.0.23
PKG_RELEASE:=		1
PKG_SITES:=		http://downloads.uclibc-ng.org/releases/1.0.23/
PKG_HASH:=		a76ee9a69bce031d14cae22ce34527a856f724f888a6641bf53e6f07c6345c70
endif
DISTFILES:=		$(PKG_NAME)-$(PKG_VERSION).tar.xz
