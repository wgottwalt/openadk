# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(ADK_TOPDIR)/rules.mk

PKG_NAME:=		@PKG@
PKG_VERSION:=		@VER@
PKG_RELEASE:=		1
PKG_MD5SUM:=		add md5sum of package here
PKG_DESCR:=		add short description
PKG_SECTION:=		add section
PKG_DEPENDS:=		add dependendant package names
PKG_BUILDDEP:=		add packages which need to be compiled
PKG_URL:=		add project url
PKG_SITES:=		add download url without package name

# if downloaded package is not ending with .tar.xz use following
#DISTFILES:=             ${PKG_NAME}-${PKG_VERSION}.tar.bz2

include $(ADK_TOPDIR)/mk/package.mk

$(eval $(call PKG_template,@UPKG@,@PKG@,$(PKG_VERSION)-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))

@PKG@-install:
	$(INSTALL_DIR) $(IDIR_@UPKG@)/usr/bin
	$(INSTALL_BIN) $(WRKINST)/usr/bin/@PKG@ \
		$(IDIR_@UPKG@)/usr/bin

include ${ADK_TOPDIR}/mk/pkg-bottom.mk
