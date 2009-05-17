# $Id$
#-
# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(TOPDIR)/rules.mk

PKG_NAME:=		librpcsecgss
PKG_VERSION:=		0.18
PKG_RELEASE:=		1
PKG_MD5SUM:=		f2c4a69c5a32f62b762a569b8d962156
MASTER_SITES:=		http://www.citi.umich.edu/projects/nfsv4/linux/librpcsecgss/

include $(TOPDIR)/mk/package.mk

$(eval $(call PKG_template,LIBRPCSECGSS,librpcsecgss,$(PKG_VERSION)-$(PKG_RELEASE),$(ARCH)))

CONFIGURE_STYLE=	autotool gnu
BUILD_STYLE=		auto
INSTALL_STYLE=		auto confprog

post-extract:
	$(CP) ./files/librpcsecgss.pc* $(WRKSRC)/
post-install:
	$(INSTALL_DIR) $(IDIR_LIBRPCSECGSS)/usr/lib
	$(CP) $(WRKINST)/usr/lib/librpcsecgss.so* $(IDIR_LIBRPCSECGSS)/usr/lib/

include ${TOPDIR}/mk/pkg-bottom.mk
