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
PKG_MD5SUM:=		f18f3bdbe088438cd64a5313c19a7312
DISTFILES:=		${PKG_NAME}-${PKG_VERSION}.tar.gz
