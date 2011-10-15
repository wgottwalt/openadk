# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

PKG_NAME:=	linux
PKG_VERSION:=	$(KERNEL_VERSION)
PKG_RELEASE:=	$(KERNEL_RELEASE)
PKG_MD5SUM:=	$(KERNEL_MD5SUM)
PKG_VERSION_MAJOR:=$(word 1,$(subst ., ,$(subst -, ,$(PKG_VERSION))))
PKG_VERSION_MINOR:=$(word 2,$(subst ., ,$(subst -, ,$(PKG_VERSION))))
PKG_SITES:=  	${MASTER_SITE_KERNEL:=kernel/v$(PKG_VERSION_MAJOR).$(PKG_VERSION_MINOR)/}
DISTFILES=	$(PKG_NAME)-$(PKG_VERSION).tar.bz2
