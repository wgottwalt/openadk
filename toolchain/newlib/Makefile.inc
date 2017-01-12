# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

PKG_NAME:=		newlib
ifeq ($(ADK_LIBC_VERSION),git)
PKG_VERSION:=		git
PKG_RELEASE:=		1
PKG_SITES:=		git://sourceware.org/git/newlib-cygwin.git
DISTFILES:=		${PKG_NAME}-${PKG_VERSION}.tar.xz
endif
ifeq ($(ADK_TARGET_LIB_NEWLIB_2_5_0),y)
PKG_VERSION:=		2.5.0
PKG_RELEASE:=		1
PKG_HASH:=		5b76a9b97c9464209772ed25ce55181a7bb144a66e5669aaec945aa64da3189b
PKG_SITES:=		ftp://sourceware.org/pub/newlib/
DISTFILES:=		${PKG_NAME}-${PKG_VERSION}.tar.gz
endif
