# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(TOPDIR)/rules.mk

PKG_NAME:=		libdrm
PKG_VERSION:=		2.4.22
PKG_RELEASE:=		1
PKG_MD5SUM:=		baf6e005001c8cf739b499bcf2ca9dfb
PKG_DESCR:=		DRM library
PKG_SECTION:=		libs
PKG_BUILDDEP:=		libpthread-stubs
PKG_URL:=		http://dri.freedesktop.org/wiki/
PKG_SITES:=		http://dri.freedesktop.org/libdrm/

PKG_SUBPKGS:=		LIBDRM LIBDRM_DEV
PKGSD_LIBDRM_DEV:=	DRM headers
PKGSC_LIBDRM_DEV:=	devel

include $(TOPDIR)/mk/package.mk

$(eval $(call PKG_template,LIBDRM,libdrm,$(PKG_VERSION)-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))
$(eval $(call PKG_template,LIBDRM_DEV,libdrm-dev,$(PKG_VERSION)-${PKG_RELEASE},${PKG_DEPENDS},${PKGSD_LIBDRM_DEV},${PKGSC_LIBDRM_DEV}))

libdrm-install:
	$(INSTALL_DIR) $(IDIR_LIBDRM)/usr/lib
	$(CP) $(WRKINST)/usr/lib/libdrm*.so* \
		$(IDIR_LIBDRM)/usr/lib

libdrm-dev-install:
	$(INSTALL_DIR) $(IDIR_LIBDRM_DEV)/usr/lib/pkgconfig
	$(INSTALL_DATA) ${WRKINST}/usr/lib/pkgconfig/*.pc \
		$(IDIR_LIBDRM_DEV)/usr/lib/pkgconfig
	$(INSTALL_DIR) $(IDIR_LIBDRM_DEV)/usr/include
	${CP} ${WRKINST}/usr/include/* \
		$(IDIR_LIBDRM_DEV)/usr/include

include ${TOPDIR}/mk/pkg-bottom.mk
