# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

PKG_NAME:=		uClibc-ng
ifeq ($(ADK_LIBC_VERSION),git)
PKG_VERSION:=		git
PKG_RELEASE:=		1
PKG_SITES:=		git://uclibc-ng.org/git/uclibc-ng
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
ifeq ($(ADK_TARGET_LIB_UCLIBC_NG_1_0_7),y)
PKG_VERSION:=		1.0.7
PKG_RELEASE:=		1
PKG_SITES:=		http://downloads.uclibc-ng.org/releases/1.0.7/
PKG_HASH:=		39aa66fc04c936f90069ba4a46868da0bb8e1a2471f9f341777aca7e1c01fd7d
endif
DISTFILES:=		$(PKG_NAME)-$(PKG_VERSION).tar.xz
