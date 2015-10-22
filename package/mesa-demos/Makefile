# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(ADK_TOPDIR)/rules.mk

PKG_NAME:=		mesa-demos
PKG_VERSION:=		8.2.0
PKG_RELEASE:=		1
PKG_HASH:=		5f0e76215ffc6acdaa80c7aadf02e448cb95d0ae8f69dbb894382b9c349a19e2
PKG_DESCR:=		opengl demo apps
PKG_SECTION:=		mm/video
PKG_DEPENDS:=		mesa
PKG_BUILDDEP:=		mesa libglew glu
PKG_SITES:=		ftp://ftp.freedesktop.org/pub/mesa/demos/${PKG_VERSION}/

DISTFILES:=		${PKG_NAME}-${PKG_VERSION}.tar.gz

PKG_ARCH_DEPENDS:=      x86 x86_64 mips mipsel mips64 mips64el arm

PKG_SUBPKGS:=		GLXINFO
PKGSD_GLXINFO:=		command-line tool for diagnosing problems with your 3D acceleration card
PKGSS_GLXINFO:=		libxt libxau libxdmcp libxcb libx11 libxext libglew

include $(ADK_TOPDIR)/mk/package.mk

$(eval $(call PKG_template,GLXINFO,glxinfo,$(PKG_VERSION)-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))

CONFIGURE_ARGS+=	--disable-egl

glxinfo-install:
	$(INSTALL_DIR) $(IDIR_GLXINFO)/usr/bin
	$(INSTALL_BIN) $(WRKINST)/usr/bin/glxinfo \
		$(IDIR_GLXINFO)/usr/bin

include ${ADK_TOPDIR}/mk/pkg-bottom.mk
