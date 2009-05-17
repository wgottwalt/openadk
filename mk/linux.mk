# $Id$
#-
# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

PKG_NAME:=	linux
PKG_VERSION:=	$(KERNEL_VERSION)
PKG_RELEASE:=	$(KERNEL_RELEASE)
PKG_MD5SUM=	$(KERNEL_MD5SUM)
DISTFILES=	$(PKG_NAME)-$(PKG_VERSION).tar.bz2
MASTER_SITES=  	${MASTER_SITE_KERNEL:=kernel/v2.6/}
