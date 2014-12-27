# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(ADK_TOPDIR)/rules.mk

PKG_NAME:=		libgssglue
PKG_VERSION:=		0.3
PKG_RELEASE:=		2
PKG_HASH:=		d98a022af432b61fe2a1eb811b5916743ccb781e383da680f1a00fd1005a5174
PKG_DESCR:=		gss glue library for nfsv4
PKG_SECTION:=		libs/net
PKG_SITES:=		http://www.citi.umich.edu/projects/nfsv4/linux/libgssglue/
PKG_OPTS:=		dev

DISTFILES:=		${PKG_NAME}-${PKG_VERSION}.tar.gz

include $(ADK_TOPDIR)/mk/package.mk

$(eval $(call PKG_template,LIBGSSGLUE,libgssglue,${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION},${PKG_OPTS}))

libgssglue-install:
	$(INSTALL_DIR) $(IDIR_LIBGSSGLUE)/usr/lib
	$(CP) $(WRKINST)/usr/lib/libgssglue.so* $(IDIR_LIBGSSGLUE)/usr/lib

include ${ADK_TOPDIR}/mk/pkg-bottom.mk
