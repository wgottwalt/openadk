# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

PKG_NAME:=		binutils

ifeq ($(ADK_LINUX_AVR32),y)
PKG_VERSION:=		2.21
PKG_MD5SUM:=		c84c5acc9d266f1a7044b51c85a823f5
else
PKG_VERSION:=		2.23.2
PKG_MD5SUM:=		4f8fa651e35ef262edc01d60fb45702e
endif

PKG_RELEASE:=		1
PKG_SITES:=		${MASTER_SITE_GNU:=binutils/}
DISTFILES:=		$(PKG_NAME)-$(PKG_VERSION).tar.bz2
