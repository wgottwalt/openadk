# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(ADK_TOPDIR)/rules.mk

PKG_NAME:=		@PKG@
PKG_VERSION:=		@VER@
PKG_RELEASE:=		1
PKG_HASH:=		add sha256 checksum of package here
PKG_DESCR:=		add short description
PKG_SECTION:=		libs/misc
PKG_URL:=		add project url
PKG_SITES:=		add download url without package name
PKG_OPTS:=		dev

# if downloaded package is not ending with .tar.xz use following
#DISTFILES:=             $(PKG_NAME)-$(PKG_VERSION).tar.bz2

include $(ADK_TOPDIR)/mk/package.mk

$(eval $(call PKG_template,@UPKG@,@PKG@,$(PKG_VERSION)-$(PKG_RELEASE),$(PKG_DEPENDS),$(PKG_DESCR),$(PKG_SECTION),$(PKG_OPTS)))

@PKG@-install:
	$(INSTALL_DIR) $(IDIR_@UPKG@)/usr/lib
	$(CP) $(WRKINST)/usr/lib/lib@PKG@*.so* \
		$(IDIR_@UPKG@)/usr/lib

include $(ADK_TOPDIR)/mk/pkg-bottom.mk
