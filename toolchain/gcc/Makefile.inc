# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

PKG_NAME:=		gcc

ifeq ($(ADK_LINUX_AVR32),y)
PKG_VERSION:=		4.4.6
PKG_MD5SUM:=		ab525d429ee4425050a554bc9247d6c4
else
PKG_VERSION:=		4.6.3
PKG_MD5SUM:=		773092fe5194353b02bb0110052a972e
endif

PKG_RELEASE:=		1
PKG_SITES:=		${MASTER_SITE_GNU:=gcc/gcc-${PKG_VERSION}/}
DISTFILES:=		$(PKG_NAME)-$(PKG_VERSION).tar.bz2
