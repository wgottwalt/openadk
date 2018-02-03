# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

PKG_NAME:=		glibc
ifeq ($(ADK_LIBC_VERSION),git)
PKG_VERSION:=		2.27.90
PKG_GLIBCVER:=		2.27.9000
PKG_SITES:=		git://sourceware.org/git/glibc.git
PKG_RELEASE:=		1
endif
ifeq ($(ADK_TARGET_LIB_GLIBC_2_27),y)
PKG_VERSION:=		2.27
PKG_GLIBCVER:=		2.27
PKG_RELEASE:=		1
PKG_SITES:=		${MASTER_SITE_GNU:=glibc/}
PKG_HASH:=		5172de54318ec0b7f2735e5a91d908afe1c9ca291fec16b5374d9faadfc1fc72
endif
ifeq ($(ADK_TARGET_LIB_GLIBC_CSKY),y)
PKG_VERSION:=           master
PKG_GLIBCVER:=		2.25
PKG_GIT:=               branch
PKG_SITES:=             https://github.com/c-sky/glibc.git
PKG_RELEASE:=           1
endif
DISTFILES:=		$(PKG_NAME)-$(PKG_VERSION).tar.xz
