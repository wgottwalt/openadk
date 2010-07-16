# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(TOPDIR)/rules.mk

PKG_NAME:=		freeglut
PKG_VERSION:=		2.6.0
PKG_RELEASE:=		1
PKG_MD5SUM:=		39f0f2de89f399529d2b981188082218
PKG_DESCR:=		OpenGL Utility Toolkit
PKG_SECTION:=		libs
PKG_BUILDDEP+=		MesaLib
PKG_URL:=		http://freeglut.sourceforge.net/
PKG_SITES:=		${MASTER_SITE_SOURCEFORGE:=freeglut/}

PKG_HOST_DEPENDS:=	!cygwin

include $(TOPDIR)/mk/package.mk

$(eval $(call PKG_template,FREEGLUT,$(PKG_NAME),$(PKG_VERSION)-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))

post-install:
	$(INSTALL_DIR) $(IDIR_FREEGLUT)/usr/lib
	$(CP) ${WRKINST}/usr/lib/libglut.so* $(IDIR_FREEGLUT)/usr/lib

include ${TOPDIR}/mk/pkg-bottom.mk
