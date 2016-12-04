# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

PKG_NAME:=		uClibc-ng
ifeq ($(ADK_LIBC_VERSION),git)
PKG_VERSION:=		git
PKG_RELEASE:=		1
PKG_SITES:=		git://uclibc-ng.org/git/uclibc-ng
endif
ifeq ($(ADK_TARGET_LIB_UCLIBC_NG_1_0_20),y)
PKG_VERSION:=		1.0.20
PKG_RELEASE:=		1
PKG_SITES:=		http://downloads.uclibc-ng.org/releases/1.0.20/
PKG_HASH:=		1c817672a65cf9132c98f84e1b8445650de1c18eca258f49c0050b420a25e946
endif
ifeq ($(ADK_TARGET_LIB_UCLIBC_NG_1_0_19),y)
PKG_VERSION:=		1.0.19
PKG_RELEASE:=		1
PKG_SITES:=		http://downloads.uclibc-ng.org/releases/1.0.19/
PKG_HASH:=		b3f94d67e9afcefb158a37011584e0d41ef3bd55ad72255a26abb25ad49b77a1
endif
ifeq ($(ADK_TARGET_LIB_UCLIBC_NG_1_0_18),y)
PKG_VERSION:=		1.0.18
PKG_RELEASE:=		1
PKG_SITES:=		http://downloads.uclibc-ng.org/releases/1.0.18/
PKG_HASH:=		5430bb3acde31d70db906be33e3e2a022beba42b50f2c56695d37344560e253f
endif
DISTFILES:=		$(PKG_NAME)-$(PKG_VERSION).tar.xz
