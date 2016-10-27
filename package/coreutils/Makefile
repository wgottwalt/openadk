# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(ADK_TOPDIR)/rules.mk

PKG_NAME:=		coreutils
PKG_VERSION:=		8.24
PKG_RELEASE:=		2
PKG_HASH:=		a2d75286a4b9ef3a13039c2da3868a61be4ee9f17d8ae380a35a97e506972170
PKG_DESCR:=		basic file, shell and text manipulation utilities
PKG_SECTION:=		base/apps
PKG_NEEDS:=		threads
PKG_URL:=		http://www.gnu.org/software/coreutils/
PKG_SITES:=		http://ftp.gnu.org/gnu/coreutils/
PKG_BB:=		1

include $(ADK_TOPDIR)/mk/host.mk
include $(ADK_TOPDIR)/mk/package.mk

$(eval $(call HOST_template,COREUTILS,coreutils,$(PKG_VERSION)-${PKG_RELEASE}))
$(eval $(call PKG_template,COREUTILS,coreutils,$(PKG_VERSION)-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))

AUTOTOOL_STYLE:=	autoreconf
CONFIGURE_ARGS+=	--disable-rpath

coreutils-install:
	$(INSTALL_DIR) $(IDIR_COREUTILS)/usr/bin
	$(CP) $(WRKINST)/usr/bin/* \
		$(IDIR_COREUTILS)/usr/bin
	$(INSTALL_DIR) $(IDIR_COREUTILS)/usr/libexec
	$(CP) $(WRKINST)/usr/libexec/* \
		$(IDIR_COREUTILS)/usr/sbin

include ${ADK_TOPDIR}/mk/host-bottom.mk
include ${ADK_TOPDIR}/mk/pkg-bottom.mk
