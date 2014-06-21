# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(ADK_TOPDIR)/rules.mk

PKG_NAME:=		freeglut
PKG_VERSION:=		2.8.1
PKG_RELEASE:=		1
PKG_MD5SUM:=		918ffbddcffbac83c218bc52355b6d5a
PKG_DESCR:=		opengl utility toolkit libraries
PKG_SECTION:=		libs/video
PKG_DEPENDS:=		libglu libstdcxx
PKG_BUILDDEP:=		glu
PKG_URL:=		http://freeglut.sourceforge.net/
PKG_SITES:=		${MASTER_SITE_SOURCEFORGE:=freeglut/}
PKG_OPTS:=		dev

DISTFILES:=		${PKG_NAME}-${PKG_VERSION}.tar.gz

PKG_HOST_DEPENDS:=	!cygwin
PKG_ARCH_DEPENDS:=	x86 x86_64 mips mipsel mips64 mips64el

include $(ADK_TOPDIR)/mk/package.mk

$(eval $(call PKG_template,FREEGLUT,freeglut,$(PKG_VERSION)-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION},${PKG_OPTS}))

freeglut-install:
	$(INSTALL_DIR) $(IDIR_FREEGLUT)/usr/lib
	$(CP) ${WRKINST}/usr/lib/libglut.so* $(IDIR_FREEGLUT)/usr/lib

include ${ADK_TOPDIR}/mk/pkg-bottom.mk
