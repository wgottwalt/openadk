# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(TOPDIR)/rules.mk

PKG_NAME:=		fltk
PKG_VERSION:=		1.3.2
PKG_RELEASE:=		4
PKG_MD5SUM:=		9f7e707d4fb7a5a76f0f9b73ff70623d
PKG_DESCR:=		fast light toolkit
PKG_SECTION:=		libs/misc
PKG_DEPENDS:=		mesalib libx11 libxi freeglut libfreetype
PKG_BUILDDEP:=		libX11 libXi MesaLib freeglut freetype
PKG_URL:=		http://www.fltk.org/
PKG_SITES:=		http://openadk.org/distfiles/
PKG_LIBNAME:=		libfltk
PKG_OPTS:=		dev

PKG_ARCH_DEPENDS:=	x86 x86_64 mips arm

DISTFILES:=		${PKG_NAME}-$(PKG_VERSION)-source.tar.gz

include $(TOPDIR)/mk/package.mk

$(eval $(call PKG_template,LIBFLTK,libfltk,$(PKG_VERSION)-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION},${PKG_OPTS}))

CONFIGURE_ARGS+=	--disable-xinerama

libfltk-install:
	$(INSTALL_DIR) $(IDIR_LIBFLTK)/usr/lib
	$(CP) ${WRKINST}/usr/lib/libfltk*.so* $(IDIR_LIBFLTK)/usr/lib

include ${TOPDIR}/mk/pkg-bottom.mk
