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

PKG_SUBPKGS:=		LIBGSSGLUE LIBGSSGLUE_DEV
PKGSD_LIBGSSGLUE_DEV:=	GSS glue headers for NFSv4
PKGSC_LIBGSSGLUE_DEV:=	devel

include $(TOPDIR)/mk/package.mk

$(eval $(call PKG_template,LIBGSSGLUE,libgssglue,${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))
$(eval $(call PKG_template,LIBGSSGLUE_DEV,libgssglue-dev,${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKGSD_LIBGSSGLUE_DEV},${PKGSC_LIBGSSGLUE_DEV}))

libgssglue-install:
	$(INSTALL_DIR) $(IDIR_LIBGSSGLUE)/usr/lib
	$(CP) $(WRKINST)/usr/lib/libgssglue.so* $(IDIR_LIBGSSGLUE)/usr/lib

libgssglue-dev-install:
	$(INSTALL_DIR) $(IDIR_LIBGSSGLUE_DEV)/usr/include
	${CP} $(WRKINST)/usr/include/* $(IDIR_LIBGSSGLUE_DEV)/usr/include
	$(INSTALL_DIR) $(IDIR_LIBGSSGLUE_DEV)/usr/lib/pkgconfig
	${INSTALL_DATA} $(WRKINST)/usr/lib/pkgconfig/libgssglue.pc \
		$(IDIR_LIBGSSGLUE_DEV)/usr/lib/pkgconfig

include ${TOPDIR}/mk/pkg-bottom.mk
