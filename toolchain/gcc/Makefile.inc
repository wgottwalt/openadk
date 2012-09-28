# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

PKG_NAME:=		gcc

ifeq ($(ADK_LINUX_AVR32),y)
PKG_VERSION:=		4.4.6
PKG_MD5SUM:=		ab525d429ee4425050a554bc9247d6c4
else
PKG_VERSION:=		4.7.2
PKG_MD5SUM:=		cc308a0891e778cfda7a151ab8a6e762
endif

PKG_RELEASE:=		1
PKG_SITES:=		${MASTER_SITE_GNU:=gcc/gcc-${PKG_VERSION}/}
DISTFILES:=		$(PKG_NAME)-$(PKG_VERSION).tar.bz2
