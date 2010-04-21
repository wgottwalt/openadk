# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(TOPDIR)/rules.mk

PKG_NAME:=		libdrm
PKG_VERSION:=		2.4.20
PKG_RELEASE:=		1
PKG_MD5SUM:=		dcbf9aa0497c84c7e4af15adb0021955
PKG_DESCR:=		DRM library
PKG_SECTION:=		libs
PKG_BUILDDEP+=		libpthread-stubs
PKG_URL:=		http://dri.freedesktop.org/wiki/
PKG_SITES:=		http://dri.freedesktop.org/libdrm/

include $(TOPDIR)/mk/package.mk

$(eval $(call PKG_template,LIBDRM,$(PKG_NAME),$(PKG_VERSION)-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))

post-install:
	$(INSTALL_DIR) $(IDIR_LIBDRM)/usr/lib
	$(CP) $(WRKINST)/usr/lib/libdrm*.so* \
		$(IDIR_LIBDRM)/usr/lib

include ${TOPDIR}/mk/pkg-bottom.mk
