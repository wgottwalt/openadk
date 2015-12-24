# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

PKG_NAME:=		uClibc-ng
ifeq ($(ADK_LIBC_VERSION),git)
PKG_VERSION:=		git
PKG_RELEASE:=		1
PKG_SITES:=		git://uclibc-ng.org/git/uclibc-ng
endif
ifeq ($(ADK_TARGET_LIB_UCLIBC_NG_1_0_10),y)
PKG_VERSION:=		1.0.10
PKG_RELEASE:=		1
PKG_SITES:=		http://downloads.uclibc-ng.org/releases/1.0.10/
PKG_HASH:=		3e3fcd77dc5a0b41b3555f3524e38a74d9abe08899a8647f5fe339e825de7de5
endif
ifeq ($(ADK_TARGET_LIB_UCLIBC_NG_1_0_9),y)
PKG_VERSION:=		1.0.9
PKG_RELEASE:=		1
PKG_SITES:=		http://downloads.uclibc-ng.org/releases/1.0.9/
PKG_HASH:=		08be8dd22ac0c3806add88b813129fb3014437eddc9d78fc73eba7f33c4b4a9d
endif
ifeq ($(ADK_TARGET_LIB_UCLIBC_NG_1_0_8),y)
PKG_VERSION:=		1.0.8
PKG_RELEASE:=		1
PKG_SITES:=		http://downloads.uclibc-ng.org/releases/1.0.8/
PKG_HASH:=		11575cda78681713f5a36cf35deaae93acdc7dce463d38a12902991fb7f5312a
endif
DISTFILES:=		$(PKG_NAME)-$(PKG_VERSION).tar.xz
