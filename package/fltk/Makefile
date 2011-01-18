# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(TOPDIR)/rules.mk

PKG_NAME:=		fltk
PKG_VERSION:=		2.0
PKG_RELEASE:=		3
PKG_MD5SUM:=		557544badbacca4ee1ebb2448f6e1f8a
PKG_DESCR:=		fast light toolkit
PKG_SECTION:=		libs
PKG_BUILDDEP:=		libX11 libXi MesaLib freeglut
PKG_URL:=		http://www.fltk.org/
PKG_SITES:=		http://ftp.funet.fi/pub/mirrors/ftp.easysw.com/pub/fltk/snapshots/

PKG_NEED_CXX:=		1
PKG_CXX:=		LIBFLTK

PKG_SUBPKGS:=		LIBFLTK
PKG_ARCH_DEPENDS:=	x86 x86_64 mips mipsel mips64 mips64el

DISTFILES:=             ${PKG_NAME}-${PKG_VERSION}.x-r7513.tar.bz2
WRKDIST=		${WRKDIR}/${PKG_NAME}-2.0.x-r7513

include $(TOPDIR)/mk/package.mk

$(eval $(call PKG_template,LIBFLTK,libfltk,$(PKG_VERSION)-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))

LIBRARIES:=-nodefaultlibs -luClibc++ -lgcc -lm
ifeq ($(ADK_TOOLCHAIN_GCC_USE_SSP),y)
LIBRARIES+=-lssp
endif

ifeq ($(ADK_COMPILE_LIBFLTK_WITH_UCLIBCXX),y)
CONFIGURE_ENV+=		CXXFLAGS="-fno-threadsafe-statics -fno-builtin -nostdinc++ \
			-I${STAGING_TARGET_DIR}/usr/include/uClibc++" \
			LIBS="$(LIBRARIES)"
endif

post-install:
	$(INSTALL_DIR) $(IDIR_LIBFLTK)/usr/lib
	$(CP) ${WRKINST}/usr/lib/libfltk*.so* $(IDIR_LIBFLTK)/usr/lib

include ${TOPDIR}/mk/pkg-bottom.mk
