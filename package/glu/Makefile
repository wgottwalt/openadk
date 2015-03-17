# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(ADK_TOPDIR)/rules.mk

PKG_NAME:=		glu
PKG_VERSION:=		9.0.0
PKG_RELEASE:=		1
PKG_HASH:=		1f7ad0d379a722fcbd303aa5650c6d7d5544fde83196b42a73d1193568a4df12
PKG_DESCR:=		opengl utility library
PKG_SECTION:=		libs/video
PKG_BUILDDEP:=		mesa
PKG_URL:=		http://cgit.freedesktop.org/mesa/glu/
PKG_SITES:=		ftp://ftp.freedesktop.org/pub/mesa/glu/
PKG_LIBNAME:=		libglu
PKG_OPTS:=		dev

DISTFILES:=             ${PKG_NAME}-${PKG_VERSION}.tar.bz2

include $(ADK_TOPDIR)/mk/package.mk

$(eval $(call PKG_template,LIBGLU,libglu,$(PKG_VERSION)-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION},${PKG_OPTS}))

libglu-install:
	$(INSTALL_DIR) $(IDIR_LIBGLU)/usr/lib
	$(CP) $(WRKINST)/usr/lib/libGLU.so* \
		$(IDIR_LIBGLU)/usr/lib

include ${ADK_TOPDIR}/mk/pkg-bottom.mk
