# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

PKG_NAME:=		glibc
ifeq ($(ADK_LIBC_VERSION),git)
PKG_VERSION:=		2.31.90
PKG_GLIBCVER:=		2.31.9000
PKG_SITES:=		git://sourceware.org/git/glibc.git
PKG_RELEASE:=		1
endif
ifeq ($(ADK_TARGET_LIB_GLIBC_2_31),y)
PKG_VERSION:=		2.31
PKG_GLIBCVER:=		2.31
PKG_RELEASE:=		1
PKG_SITES:=		${MASTER_SITE_GNU:=glibc/}
PKG_HASH:=		9246fe44f68feeec8c666bb87973d590ce0137cca145df014c72ec95be9ffd17
endif
DISTFILES:=		$(PKG_NAME)-$(PKG_VERSION).tar.xz
