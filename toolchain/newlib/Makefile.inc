# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

PKG_NAME:=		newlib
ifeq ($(ADK_LIBC_VERSION),git)
PKG_VERSION:=		git
PKG_RELEASE:=		1
PKG_SITES:=		git://sourceware.org/git/newlib-cygwin.git
DISTFILES:=		${PKG_NAME}-${PKG_VERSION}.tar.xz
endif
ifeq ($(ADK_TARGET_LIB_NEWLIB_3_0_0),y)
PKG_VERSION:=		3.0.0
PKG_RELEASE:=		1
PKG_HASH:=		c8566335ee74e5fcaeb8595b4ebd0400c4b043d6acb3263ecb1314f8f5501332
PKG_SITES:=		ftp://sourceware.org/pub/newlib/
DISTFILES:=		${PKG_NAME}-${PKG_VERSION}.tar.gz
endif
ifeq ($(ADK_TARGET_LIB_NEWLIB_XTENSA),y)
PKG_VERSION:=		xtensa
PKG_GIT:=		branch
PKG_RELEASE:=		1
PKG_SITES:=		https://github.com/jcmvbkbc/newlib-xtensa.git
DISTFILES:=		${PKG_NAME}-${PKG_VERSION}.tar.xz
endif
