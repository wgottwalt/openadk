# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(ADK_TOPDIR)/rules.mk

PKG_NAME:=		fltk
PKG_VERSION:=		1.3.3
PKG_RELEASE:=		1
PKG_HASH:=		f8398d98d7221d40e77bc7b19e761adaf2f1ef8bb0c30eceb7beb4f2273d0d97
PKG_DESCR:=		fast light toolkit
PKG_SECTION:=		libs/misc
PKG_DEPENDS:=		mesa libx11 libxi freeglut libfreetype
PKG_BUILDDEP:=		libX11 libXi mesa freeglut freetype
PKG_URL:=		http://www.fltk.org/
PKG_SITES:=		http://fltk.org/pub/fltk/$(PKG_VERSION)/
PKG_LIBNAME:=		libfltk
PKG_OPTS:=		dev

PKG_ARCH_DEPENDS:=	x86 x86_64 mips arm

DISTFILES:=		${PKG_NAME}-$(PKG_VERSION)-source.tar.gz

include $(ADK_TOPDIR)/mk/package.mk

$(eval $(call PKG_template,LIBFLTK,libfltk,$(PKG_VERSION)-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION},${PKG_OPTS}))

CONFIGURE_ARGS+=	--disable-xinerama

libfltk-install:
	$(INSTALL_DIR) $(IDIR_LIBFLTK)/usr/lib
	$(CP) ${WRKINST}/usr/lib/libfltk*.so* $(IDIR_LIBFLTK)/usr/lib

include ${ADK_TOPDIR}/mk/pkg-bottom.mk
