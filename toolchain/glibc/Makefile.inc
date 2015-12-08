# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

PKG_NAME:=		glibc
ifeq ($(ADK_LIBC_VERSION),git)
PKG_VERSION:=		2.22.90
PKG_SITES:=		git://sourceware.org/git/glibc.git
PKG_RELEASE:=		1
endif
ifeq ($(ADK_TARGET_LIB_GLIBC_2_22),y)
PKG_VERSION:=		2.22
PKG_SITES:=		${MASTER_SITE_GNU:=glibc/}
PKG_RELEASE:=		1
PKG_HASH:=		eb731406903befef1d8f878a46be75ef862b9056ab0cde1626d08a7a05328948
endif
ifeq ($(ADK_TARGET_LIB_GLIBC_2_21),y)
PKG_VERSION:=		2.21
PKG_SITES:=		${MASTER_SITE_GNU:=glibc/}
PKG_RELEASE:=		1
PKG_HASH:=		aeeb362437965a5d3f40b151094ca79def04a115bd363fdd4a9a0c69482923b8
endif
ifeq ($(ADK_TARGET_LIB_GLIBC_2_20),y)
PKG_VERSION:=		2.20
PKG_SITES:=		${MASTER_SITE_GNU:=glibc/}
PKG_RELEASE:=		1
PKG_HASH:=		f84b6d42aecc288d593c397b0a3d02260a33ee686bce0c634eb9b32798f36ba5
endif
ifeq ($(ADK_TARGET_LIB_GLIBC_2_19),y)
PKG_VERSION:=		2.19
PKG_SITES:=		${MASTER_SITE_GNU:=glibc/}
PKG_RELEASE:=		1
PKG_HASH:=		2d3997f588401ea095a0b27227b1d50cdfdd416236f6567b564549d3b46ea2a2
endif
DISTFILES:=		$(PKG_NAME)-$(PKG_VERSION).tar.xz
