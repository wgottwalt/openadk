# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(TOPDIR)/rules.mk

PKG_NAME:=		libgssglue
PKG_VERSION:=		0.1
PKG_RELEASE:=		1
PKG_MD5SUM:=		ce1b4c758e6de01b712d154c5c97e540
PKG_DESCR:=		GSS glue library for NFSv4
PKG_SECTION:=		libs
PKG_SITES:=		http://www.citi.umich.edu/projects/nfsv4/linux/libgssglue/

include $(TOPDIR)/mk/package.mk

$(eval $(call PKG_template,LIBGSSGLUE,libgssglue,${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))

CONFIGURE_STYLE=	gnu
BUILD_STYLE=		auto
INSTALL_STYLE=		auto confprog

post-install:
	$(INSTALL_DIR) $(IDIR_LIBGSSGLUE)/usr/lib
	$(CP) $(WRKINST)/usr/lib/libgssglue.so* $(IDIR_LIBGSSGLUE)/usr/lib/

include ${TOPDIR}/mk/pkg-bottom.mk
