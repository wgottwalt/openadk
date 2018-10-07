# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

PKG_NAME:=		musl
ifeq ($(ADK_LIBC_VERSION),git)
PKG_VERSION:=		git
PKG_RELEASE:=		1
PKG_SITES:=		git://git.musl-libc.org/musl
DISTFILES:=		${PKG_NAME}-${PKG_VERSION}.tar.xz
endif
ifeq ($(ADK_TARGET_LIB_MUSL_1_1_20),y)
PKG_VERSION:=		1.1.20
PKG_RELEASE:=		1
PKG_HASH:=		44be8771d0e6c6b5f82dd15662eb2957c9a3173a19a8b49966ac0542bbd40d61
PKG_SITES:=		http://www.musl-libc.org/releases/
DISTFILES:=		${PKG_NAME}-${PKG_VERSION}.tar.gz
endif
