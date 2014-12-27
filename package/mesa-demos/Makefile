# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(ADK_TOPDIR)/rules.mk

PKG_NAME:=		mesa-demos
PKG_VERSION:=		8.1.0
PKG_RELEASE:=		2
PKG_HASH:=		dca2c73ce8ab28b7d5d9b221a4a47fb5584f6b764171af075bc4385e8e2a7a64
PKG_DESCR:=		opengl demo apps
PKG_SECTION:=		mm/video
PKG_DEPENDS:=		mesalib
PKG_BUILDDEP:=		mesalib libglew glu
PKG_SITES:=		ftp://ftp.freedesktop.org/pub/mesa/demos/${PKG_VERSION}/

DISTFILES:=		${PKG_NAME}-${PKG_VERSION}.tar.gz

PKG_ARCH_DEPENDS:=      x86 x86_64 mips mipsel mips64 mips64el arm

PKG_SUBPKGS:=		GLXINFO
PKGSD_GLXINFO:=		command-line tool for diagnosing problems with your 3D acceleration card
PKGSS_GLXINFO:=		libxt libxau libxdmcp libxcb libx11 libxext libglew

include $(ADK_TOPDIR)/mk/package.mk

$(eval $(call PKG_template,GLXINFO,glxinfo,$(PKG_VERSION)-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))

glxinfo-install:
	$(INSTALL_DIR) $(IDIR_GLXINFO)/usr/bin
	$(INSTALL_BIN) $(WRKINST)/usr/bin/glxinfo \
		$(IDIR_GLXINFO)/usr/bin

include ${ADK_TOPDIR}/mk/pkg-bottom.mk
