# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(ADK_TOPDIR)/rules.mk

PKG_NAME:=		skalibs
PKG_VERSION:=		2.3.10.0
PKG_RELEASE:=		1
PKG_HASH:=		e4d5147941055b2a367794666f773a4b216c3ae83c015a5fcf2cd0498470ea44
PKG_DESCR:=		general purpose libraries
PKG_SECTION:=		libs/misc
PKG_URL:=		http://www.skarnet.org/software/skalibs/
PKG_SITES:=		http://www.skarnet.org/software/skalibs/
PKG_OPTS:=		dev

DISTFILES:=             $(PKG_NAME)-$(PKG_VERSION).tar.gz

include $(ADK_TOPDIR)/mk/package.mk

$(eval $(call PKG_template,SKALIBS,skalibs,$(PKG_VERSION)-$(PKG_RELEASE),$(PKG_DEPENDS),$(PKG_DESCR),$(PKG_SECTION),$(PKG_OPTS)))

CONFIGURE_ARGS+=	--enable-force-devr \
			--disable-allstatic \
			--with-default-path=/sbin:/usr/sbin:/bin:/usr/bin

skalibs-install:
	$(INSTALL_DIR) $(IDIR_SKALIBS)/usr/lib
	$(CP) $(WRKINST)/usr/lib/libskarnet.so* \
		$(IDIR_SKALIBS)/usr/lib

include $(ADK_TOPDIR)/mk/pkg-bottom.mk
