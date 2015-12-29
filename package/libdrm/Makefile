# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(ADK_TOPDIR)/rules.mk

PKG_NAME:=		libdrm
PKG_VERSION:=		2.4.65
PKG_RELEASE:=		1
PKG_HASH:=		b4382d6018464ba5bece2d7a4b87eb0eba24d891ff2ba29549be9511bd231c2f
PKG_DESCR:=		drm library
PKG_SECTION:=		libs/video
PKG_BUILDDEP:=		libpthread-stubs cairo libpciaccess
PKG_URL:=		http://dri.freedesktop.org/wiki/
PKG_SITES:=		http://dri.freedesktop.org/libdrm/
PKG_OPTS:=		dev

DISTFILES:=		${PKG_NAME}-${PKG_VERSION}.tar.gz

PKG_ARCH_DEPENDS:=	!m68k

include $(ADK_TOPDIR)/mk/package.mk

$(eval $(call PKG_template,LIBDRM,libdrm,$(PKG_VERSION)-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION},${PKG_OPTS}))

CONFIGURE_ARGS+=	--disable-manpages \
			--disable-valgrind

libdrm-install:
	$(INSTALL_DIR) $(IDIR_LIBDRM)/usr/lib
	$(CP) $(WRKINST)/usr/lib/libdrm*.so* \
		$(IDIR_LIBDRM)/usr/lib

include ${ADK_TOPDIR}/mk/pkg-bottom.mk
