# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

PKG_NAME:=		newlib
ifeq ($(ADK_LIBC_VERSION),git)
PKG_VERSION:=		git
PKG_RELEASE:=		1
PKG_SITES:=		git://sourceware.org/git/newlib-cygwin.git
DISTFILES:=		${PKG_NAME}-${PKG_VERSION}.tar.xz
endif
ifeq ($(ADK_TARGET_LIB_NEWLIB_2_2_0),y)
PKG_VERSION:=		2.2.0
PKG_RELEASE:=		1
PKG_HASH:=		c1d53fd1765d955ac513aa6e2f576455ee7507072d400314495c8a8a26ebc8ec
PKG_SITES:=		ftp://sourceware.org/pub/newlib/
DISTFILES:=		${PKG_NAME}-${PKG_VERSION}-1.tar.gz
WRKDIST=		$(WRKDIR)/${PKG_NAME}-${PKG_VERSION}-1
endif
