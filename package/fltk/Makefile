# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(ADK_TOPDIR)/rules.mk

PKG_NAME:=		fltk
PKG_VERSION:=		1.3.2
PKG_RELEASE:=		4
PKG_HASH:=		176044df94f31bd53a5806cf5054ca78b180bf9ae27ce47649608833695ee4a4
PKG_DESCR:=		fast light toolkit
PKG_SECTION:=		libs/misc
PKG_DEPENDS:=		mesalib libx11 libxi freeglut libfreetype
PKG_BUILDDEP:=		libX11 libXi mesalib freeglut freetype
PKG_URL:=		http://www.fltk.org/
PKG_SITES:=		http://openadk.org/distfiles/
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
