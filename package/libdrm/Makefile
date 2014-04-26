# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(TOPDIR)/rules.mk

PKG_NAME:=		libdrm
PKG_VERSION:=		2.4.53
PKG_RELEASE:=		1
PKG_MD5SUM:=		12e30247fb3caafc835e5f3f768c426a
PKG_DESCR:=		DRM library
PKG_SECTION:=		libs
PKG_BUILDDEP:=		libpthread-stubs cairo libpciaccess
PKG_URL:=		http://dri.freedesktop.org/wiki/
PKG_SITES:=		http://dri.freedesktop.org/libdrm/
PKG_OPTS:=		dev

DISTFILES:=		${PKG_NAME}-${PKG_VERSION}.tar.gz

PKG_ARCH_DEPENDS:=	!m68k

include $(TOPDIR)/mk/package.mk

$(eval $(call PKG_template,LIBDRM,libdrm,$(PKG_VERSION)-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION},${PKG_OPTS}))

CONFIGURE_ARGS+=	--disable-manpages

libdrm-install:
	$(INSTALL_DIR) $(IDIR_LIBDRM)/usr/lib
	$(CP) $(WRKINST)/usr/lib/libdrm*.so* \
		$(IDIR_LIBDRM)/usr/lib

include ${TOPDIR}/mk/pkg-bottom.mk
