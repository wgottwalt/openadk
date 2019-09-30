# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

PKG_NAME:=		glibc
ifeq ($(ADK_LIBC_VERSION),git)
PKG_VERSION:=		2.30.90
PKG_GLIBCVER:=		2.30.9000
PKG_SITES:=		git://sourceware.org/git/glibc.git
PKG_RELEASE:=		1
endif
ifeq ($(ADK_TARGET_LIB_GLIBC_2_30),y)
PKG_VERSION:=		2.30
PKG_GLIBCVER:=		2.30
PKG_RELEASE:=		1
PKG_SITES:=		${MASTER_SITE_GNU:=glibc/}
PKG_HASH:=		e2c4114e569afbe7edbc29131a43be833850ab9a459d81beb2588016d2bbb8af
endif
DISTFILES:=		$(PKG_NAME)-$(PKG_VERSION).tar.xz
