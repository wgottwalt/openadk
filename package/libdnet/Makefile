# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(TOPDIR)/rules.mk

PKG_NAME:=		libdnet
PKG_VERSION:=		1.11
PKG_RELEASE:=		1
PKG_MD5SUM:=		04c394ed8e1e7fc455456e79e908916d
PKG_DESCR:=		a low-level networking library
PKG_SECTION:=		libs
PKG_URL:=		http://libdnet.sourceforge.net/
PKG_SITES:=		${MASTER_SITE_SOURCEFORGE:=$(PKG_NAME)/}

PKG_SUBPKGS:=		LIBDNET LIBDNET_DEV
PKGSD_LIBDNET_DEV:=	headers for a low-level networking library
PKGSC_LIBDNET_DEV:=	devel

include $(TOPDIR)/mk/package.mk

$(eval $(call PKG_template,LIBDNET,libdnet,$(PKG_VERSION)-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))
$(eval $(call PKG_template,LIBDNET_DEV,libdnet-dev,$(PKG_VERSION)-${PKG_RELEASE},${PKG_DEPENDS},${PKGSD_LIBDNET_DEV},${PKGSC_LIBDNET_DEV}))

CONFIGURE_ENV+=		ac_cv_dnet_bsd_bpf=no
CONFIGURE_ARGS+=	--without-check

libdnet-install:
	$(INSTALL_DIR) $(IDIR_LIBDNET)/usr/lib
	$(CP) $(WRKINST)/usr/lib/libdnet.so* $(IDIR_LIBDNET)/usr/lib

libdnet-dev-install:
	$(INSTALL_DIR) $(IDIR_LIBDNET_DEV)/usr/bin
	$(CP) $(WRKINST)/usr/bin/dnet-config $(IDIR_LIBDNET_DEV)/usr/bin
	$(INSTALL_DIR) $(IDIR_LIBDNET_DEV)/usr/include
	$(CP) $(WRKINST)/usr/include/* \
		$(IDIR_LIBDNET_DEV)/usr/include
	

include ${TOPDIR}/mk/pkg-bottom.mk
