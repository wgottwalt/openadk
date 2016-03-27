# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

PKG_NAME:=		newlib
ifeq ($(ADK_LIBC_VERSION),git)
PKG_VERSION:=		git
PKG_RELEASE:=		1
PKG_SITES:=		git://sourceware.org/git/newlib-cygwin.git
DISTFILES:=		${PKG_NAME}-${PKG_VERSION}.tar.xz
endif
ifeq ($(ADK_TARGET_LIB_NEWLIB_2_3_0),y)
PKG_VERSION:=		2.3.0.20160226
PKG_RELEASE:=		1
PKG_HASH:=		a9489dd28276e4fb29d65a1388a359b1f005d2ba6a4b92a6e5a802b95e1ad7d1
PKG_SITES:=		ftp://sourceware.org/pub/newlib/
DISTFILES:=		${PKG_NAME}-${PKG_VERSION}.tar.gz
endif
ifeq ($(ADK_TARGET_LIB_NEWLIB_2_2_0),y)
PKG_VERSION:=		2.2.0.20151023
PKG_RELEASE:=		1
PKG_HASH:=		fd1d3d358dd66922f37563518e787196e1fba8adaa6d8b1e955d145b38b3fa60
PKG_SITES:=		ftp://sourceware.org/pub/newlib/
DISTFILES:=		${PKG_NAME}-${PKG_VERSION}.tar.gz
endif
