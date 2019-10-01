# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

PKG_NAME:=		musl
ifeq ($(ADK_LIBC_VERSION),git)
PKG_VERSION:=		git
PKG_RELEASE:=		1
PKG_SITES:=		git://git.musl-libc.org/musl
DISTFILES:=		${PKG_NAME}-${PKG_VERSION}.tar.xz
endif
ifeq ($(ADK_TARGET_LIB_MUSL_1_1_23),y)
PKG_VERSION:=		1.1.23
PKG_RELEASE:=		1
PKG_HASH:=		8a0feb41cef26c97dde382c014e68b9bb335c094bbc1356f6edaaf6b79bd14aa
PKG_SITES:=		http://www.musl-libc.org/releases/
DISTFILES:=		${PKG_NAME}-${PKG_VERSION}.tar.gz
endif
