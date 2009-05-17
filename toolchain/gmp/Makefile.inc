# $Id$
#-
# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

PKG_NAME:=		gmp
PKG_VERSION:=		4.2.2
PKG_RELEASE:=		1
PKG_MD5SUM:=		7ce52531644e6d12f16911b7e3151f3f
MASTER_SITES:=		${MASTER_SITE_GNU:=gmp/}
DISTFILES:=		$(PKG_NAME)-$(PKG_VERSION).tar.bz2
GMP_BUILD_DIR:=		$(TOOLCHAIN_BUILD_DIR)/$(PKG_NAME)-$(PKG_VERSION)
