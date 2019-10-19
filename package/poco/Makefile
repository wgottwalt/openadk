# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(ADK_TOPDIR)/rules.mk

PKG_NAME:=		poco
PKG_VERSION:=		1.9.4
PKG_RELEASE:=		1
PKG_HASH:=		1bcaff7b1f7dfcbe573ddf0bf7e251e93072355ecc468c075339920c97e39c8f
PKG_DESCR:=		c++ network libraries
PKG_SECTION:=		libs/misc
PKG_BUILDDEP:=		zlib pcre
PKG_DEPENDS:=		zlib libpcre
PKG_URL:=		http://pocoproject.org
PKG_SITES:=		http://pocoproject.org/releases/poco-1.9.4/
PKG_OPTS:=		dev

PKG_LIBC_DEPENDS:=	glibc

DISTFILES:=             $(PKG_NAME)-$(PKG_VERSION).tar.gz

include $(ADK_TOPDIR)/mk/package.mk

$(eval $(call PKG_template,POCO,poco,$(PKG_VERSION)-$(PKG_RELEASE),$(PKG_DEPENDS),$(PKG_DESCR),$(PKG_SECTION),$(PKG_OPTS)))

CONFIG_STYLE:=		minimal
CONFIGURE_ARGS+=	--prefix=/usr \
			--no-tests \
			--no-samples

poco-install:
	$(INSTALL_DIR) $(IDIR_POCO)/usr/lib
	$(CP) $(WRKINST)/usr/lib/libPoco*.so* \
		$(IDIR_POCO)/usr/lib

include $(ADK_TOPDIR)/mk/pkg-bottom.mk
