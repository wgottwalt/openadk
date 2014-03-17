# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

PKG_NAME:=		gcc
ifeq ($(ADK_LINUX_SPARC),y)
PKG_VERSION:=		4.7.3
PKG_MD5SUM:=		86f428a30379bdee0224e353ee2f999e
else
PKG_VERSION:=		4.8.2
PKG_MD5SUM:=		a3d7d63b9cb6b6ea049469a0c4a43c9d
endif
PKG_RELEASE:=		1
PKG_SITES:=		${MASTER_SITE_GNU:=gcc/gcc-${PKG_VERSION}/}
DISTFILES:=		$(PKG_NAME)-$(PKG_VERSION).tar.bz2
