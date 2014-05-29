# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(TOPDIR)/rules.mk

PKG_NAME:=		libglew
PKG_VERSION:=		1.10.0
PKG_RELEASE:=		2
PKG_MD5SUM:=		2f09e5e6cb1b9f3611bcac79bc9c2d5d
PKG_DESCR:=		opengl extension wrangler library
PKG_SECTION:=		libs/video
PKG_DEPENDS:=		libx11 libxmu libxi libxext
PKG_BUILDDEP:=		libX11 libXmu libXi libXext
PKG_URL:=		http://glew.sourceforge.net/index.html
PKG_SITES:=		${MASTER_SITE_SOURCEFORGE:=glew/}
PKG_OPTS:=		dev

PKG_ARCH_DEPENDS:=	!m68k

DISTFILES:=		glew-$(PKG_VERSION).tgz
WRKDIST=		${WRKDIR}/glew-$(PKG_VERSION)

include $(TOPDIR)/mk/package.mk

$(eval $(call PKG_template,LIBGLEW,libglew,$(PKG_VERSION)-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION},${PKG_OPTS}))

CONFIG_STYLE:=		manual
XAKE_FLAGS+=		STRIP='' GLEW_DEST='${WRKINST}/usr' SYSTEMS=linux

libglew-install:
	$(INSTALL_DIR) $(IDIR_LIBGLEW)/usr/lib
	$(CP) $(WRKINST)/usr/lib/libGLEW.so* \
		$(IDIR_LIBGLEW)/usr/lib

include ${TOPDIR}/mk/pkg-bottom.mk
