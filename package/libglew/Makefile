# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(TOPDIR)/rules.mk

PKG_NAME:=		libglew
PKG_VERSION:=		1.10.0
PKG_RELEASE:=		1
PKG_MD5SUM:=		2f09e5e6cb1b9f3611bcac79bc9c2d5d
PKG_DESCR:=		OpenGL Extension Wrangler Library (GLEW)
PKG_SECTION:=		libs
PKG_DEPENDS:=		libx11 libxmu libxi libxext
PKG_BUILDDEP:=		libX11 libXmu libXi libXext
PKG_URL:=		http://glew.sourceforge.net/index.html
PKG_SITES:=		${MASTER_SITE_SOURCEFORGE:=glew/}

DISTFILES:=		glew-$(PKG_VERSION).tgz
WRKDIST=		${WRKDIR}/glew-$(PKG_VERSION)

include $(TOPDIR)/mk/package.mk

$(eval $(call PKG_template,LIBGLEW,libglew,$(PKG_VERSION)-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))

CONFIG_STYLE:=		manual
XAKE_FLAGS+=		STRIP='' GLEW_DEST='${WRKINST}/usr'

libglew-install:
	$(INSTALL_DIR) $(IDIR_LIBGLEW)/usr/lib
	$(CP) $(WRKINST)/usr/lib/libGLEW.so* \
		$(IDIR_LIBGLEW)/usr/lib

include ${TOPDIR}/mk/pkg-bottom.mk
