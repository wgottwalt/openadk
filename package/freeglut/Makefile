# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(ADK_TOPDIR)/rules.mk

PKG_NAME:=		freeglut
PKG_VERSION:=		3.0.0
PKG_RELEASE:=		1
PKG_HASH:=		2a43be8515b01ea82bcfa17d29ae0d40bd128342f0930cd1f375f1ff999f76a2
PKG_DESCR:=		opengl utility toolkit libraries
PKG_SECTION:=		libs/video
PKG_DEPENDS:=		libglu
PKG_BUILDDEP:=		glu cmake-host
PKG_NEEDS:=		c++
PKG_URL:=		http://freeglut.sourceforge.net/
PKG_SITES:=		${MASTER_SITE_SOURCEFORGE:=freeglut/}
PKG_OPTS:=		dev

DISTFILES:=		${PKG_NAME}-${PKG_VERSION}.tar.gz

PKG_ARCH_DEPENDS:=	arm mips mipsel mips64 mips64el x86 x86_64

include $(ADK_TOPDIR)/mk/package.mk

$(eval $(call PKG_template,FREEGLUT,freeglut,$(PKG_VERSION)-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION},${PKG_OPTS}))

CONFIG_STYLE:=		cmake

freeglut-install:
	$(INSTALL_DIR) $(IDIR_FREEGLUT)/usr/lib
	$(CP) ${WRKINST}/usr/lib/libglut.so* $(IDIR_FREEGLUT)/usr/lib

include ${ADK_TOPDIR}/mk/pkg-bottom.mk
