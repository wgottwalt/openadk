# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(ADK_TOPDIR)/rules.mk

PKG_NAME:=		make
PKG_VERSION:=		4.2.1
PKG_RELEASE:=		2
PKG_HASH:=		e40b8f018c1da64edd1cc9a6fce5fa63b2e707e404e20cad91fbae337c98a5b7
PKG_DESCR:=		c/c++ code buildtool
PKG_SECTION:=		dev/tools
PKG_DEPENDS:=		libelf
PKG_BUILDDEP:=		libelf
PKG_URL:=		http://www.gnu.org/software/make
PKG_SITES:=		${MASTER_SITE_GNU:=make/}

DISTFILES:=		${PKG_NAME}-${PKG_VERSION}.tar.gz

include $(ADK_TOPDIR)/mk/package.mk

$(eval $(call PKG_template,MAKE,make,$(PKG_VERSION)-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))

CONFIGURE_ARGS+=	--disable-load

make-install:
	$(INSTALL_DIR) $(IDIR_MAKE)/usr/bin
	$(INSTALL_BIN) $(WRKINST)/usr/bin/make $(IDIR_MAKE)/usr/bin

include ${ADK_TOPDIR}/mk/pkg-bottom.mk
