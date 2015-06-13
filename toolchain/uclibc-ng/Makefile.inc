# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

PKG_NAME:=		uClibc-ng
ifeq ($(ADK_LIBC_VERSION),git)
PKG_VERSION:=		git
PKG_RELEASE:=		1
PKG_SITES:=		git://uclibc-ng.org/git/uclibc-ng
endif
ifeq ($(ADK_TARGET_LIB_UCLIBC_NG_1_0_3),y)
PKG_VERSION:=		1.0.3
PKG_RELEASE:=		1
PKG_SITES:=		http://downloads.uclibc-ng.org/releases/1.0.3/
PKG_HASH:=		b4c73fe3e7af4eeabf7510ee66ca85f775c3ed44d20b1bcd30c6ac481dd753cd
endif
DISTFILES:=		$(PKG_NAME)-$(PKG_VERSION).tar.xz
