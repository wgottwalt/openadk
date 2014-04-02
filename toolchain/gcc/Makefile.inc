# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

PKG_NAME:=		gcc
ifeq ($(ADK_LINUX_SPARC),y)
PKG_VERSION:=		4.7.3
PKG_MD5SUM:=		86f428a30379bdee0224e353ee2f999e
else
PKG_VERSION:=		4.8.2
PKG_MD5SUM:=		deca88241c1135e2ff9fa5486ab5957b
endif
PKG_RELEASE:=		1
PKG_SITES:=		${MASTER_SITE_GNU:=gcc/gcc-${PKG_VERSION}/}
