# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

PKG_NAME:=		musl
ifeq ($(ADK_LIBC_VERSION),git)
PKG_VERSION:=		git
PKG_RELEASE:=		1
PKG_SITES:=		git://git.musl-libc.org/musl
DISTFILES:=		${PKG_NAME}-${PKG_VERSION}.tar.xz
endif
ifeq ($(ADK_TARGET_LIB_MUSL_1_1_13),y)
PKG_VERSION:=		1.1.13
PKG_RELEASE:=		1
PKG_HASH:=		bbacdc64f557d0c4857f7d2daf592c32c29aec1babbb94fcf01a2e05bed15013
PKG_SITES:=		http://www.musl-libc.org/releases/
DISTFILES:=		${PKG_NAME}-${PKG_VERSION}.tar.gz
endif
ifeq ($(ADK_TARGET_LIB_MUSL_1_1_12),y)
PKG_VERSION:=		1.1.12
PKG_RELEASE:=		1
PKG_HASH:=		720b83c7e276b4b679c0bffe9509340d5f81fd601508e607e708177df0d31c0e
PKG_SITES:=		http://www.musl-libc.org/releases/
DISTFILES:=		${PKG_NAME}-${PKG_VERSION}.tar.gz
endif
ifeq ($(ADK_TARGET_LIB_MUSL_1_1_11),y)
PKG_VERSION:=		1.1.11
PKG_RELEASE:=		1
PKG_HASH:=		bb9e6da51b7b12641f5d1abb39705c6c6c1b2fbd20002362948aa736a0aa353f
PKG_SITES:=		http://www.musl-libc.org/releases/
DISTFILES:=		${PKG_NAME}-${PKG_VERSION}.tar.gz
endif
