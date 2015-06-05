# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

PKG_NAME:=		musl
ifeq ($(ADK_LIBC_VERSION),git)
PKG_VERSION:=		git
PKG_RELEASE:=		1
PKG_SITES:=		git://git.musl-libc.org/musl
DISTFILES:=		${PKG_NAME}-${PKG_VERSION}.tar.xz
else
PKG_VERSION:=		$(ADK_LIBC_VERSION)
PKG_RELEASE:=		1
PKG_HASH:=		45bbe9b1c7f7a0f743477af1e103b6889bfe4dd9815e16f6c89f6c90831c8b7c
PKG_SITES:=		http://www.musl-libc.org/releases/
DISTFILES:=		${PKG_NAME}-${PKG_VERSION}.tar.gz
endif
