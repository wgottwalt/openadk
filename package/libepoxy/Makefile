# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(ADK_TOPDIR)/rules.mk

PKG_NAME:=		libepoxy
PKG_VERSION:=		1.2
PKG_RELEASE:=		1
PKG_HASH:=		42c328440f60a5795835c5ec4bdfc1329e75bba16b6e22b3a87ed17e9679e8f6
PKG_DESCR:=		opengl function pointer management
PKG_SECTION:=		libs/misc
PKG_BUILDDEP:=		util-macros-host mesa
PKG_SITES:=		http://crux.nu/files/
PKG_OPTS:=		dev

DISTFILES:=             $(PKG_NAME)-$(PKG_VERSION).tar.gz

include $(ADK_TOPDIR)/mk/package.mk

$(eval $(call PKG_template,LIBEPOXY,libepoxy,$(PKG_VERSION)-$(PKG_RELEASE),$(PKG_DEPENDS),$(PKG_DESCR),$(PKG_SECTION),$(PKG_OPTS)))

AUTOTOOL_STYLE:=	autogen

libepoxy-install:
	$(INSTALL_DIR) $(IDIR_LIBEPOXY)/usr/lib
	$(CP) $(WRKINST)/usr/lib/libepoxy*.so* \
		$(IDIR_LIBEPOXY)/usr/lib

include $(ADK_TOPDIR)/mk/pkg-bottom.mk
