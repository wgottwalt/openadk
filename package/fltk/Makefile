# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(TOPDIR)/rules.mk

PKG_NAME:=		fltk
PKG_VERSION:=		2.0
PKG_RELEASE:=		1
PKG_MD5SUM:=		557544badbacca4ee1ebb2448f6e1f8a
PKG_DESCR:=		fast light toolkit
PKG_SECTION:=		libs
PKG_BUILDDEP+=		libX11 libXi MesaLib freeglut
PKG_URL:=		http://www.fltk.org/
PKG_SITES:=		http://ftp.funet.fi/pub/mirrors/ftp.easysw.com/pub/fltk/snapshots/

DISTFILES:=             ${PKG_NAME}-${PKG_VERSION}.x-r7513.tar.bz2
WRKDIST=		${WRKDIR}/${PKG_NAME}-2.0.x-r7513

PKG_TARGET_DEPENDS:=  	ibmx40 lemote
PKG_HOST_DEPENDS:=	!cygwin

include $(TOPDIR)/mk/package.mk

$(eval $(call PKG_template,LIBFLTK,libfltk,$(PKG_VERSION)-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))

post-install:
	$(INSTALL_DIR) $(IDIR_LIBFLTK)/usr/lib
	$(CP) ${WRKINST}/usr/lib/libfltk*.so* $(IDIR_LIBFLTK)/usr/lib

include ${TOPDIR}/mk/pkg-bottom.mk
