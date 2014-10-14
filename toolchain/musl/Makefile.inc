# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

PKG_NAME:=		musl
ifeq ($(ADK_LIBC_VERSION),git)
PKG_VERSION:=		git
PKG_REPO:=		git://git.musl-libc.org/musl
else
PKG_VERSION:=		$(ADK_LIBC_VERSION)
PKG_SITES:=		http://www.musl-libc.org/releases/
endif
PKG_RELEASE:=		1
PKG_MD5SUM:=		94f8aa9dab80229fed68991bb9984cc5
DISTFILES:=		${PKG_NAME}-${PKG_VERSION}.tar.gz
