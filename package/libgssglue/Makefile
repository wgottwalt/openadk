# $Id$
#-
# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(TOPDIR)/rules.mk

PKG_NAME:=		libgssglue
PKG_VERSION:=		0.1
PKG_RELEASE:=		1
PKG_MD5SUM:=		ce1b4c758e6de01b712d154c5c97e540
MASTER_SITES:=		http://www.citi.umich.edu/projects/nfsv4/linux/libgssglue/

include $(TOPDIR)/mk/package.mk

$(eval $(call PKG_template,LIBGSSGLUE,libgssglue,$(PKG_VERSION)-$(PKG_RELEASE),$(ARCH)))

CONFIGURE_STYLE=	gnu
BUILD_STYLE=		auto
INSTALL_STYLE=		auto confprog

post-install:
	$(INSTALL_DIR) $(IDIR_LIBGSSGLUE)/usr/lib
	$(CP) $(WRKINST)/usr/lib/libgssglue.so* $(IDIR_LIBGSSGLUE)/usr/lib/

include ${TOPDIR}/mk/pkg-bottom.mk
