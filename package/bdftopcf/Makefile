# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(ADK_TOPDIR)/rules.mk

PKG_NAME:=		bdftopcf
PKG_VERSION:=		1.0.3
PKG_RELEASE:=		1
PKG_HASH:=		b9f172527fb78f1d02859f0e24675bfc0152ea589abab733a80a1256f6e91e69
PKG_DESCR:=		font converter utility
PKG_BUILDDEP:=		libXfont
PKG_SECTION:=		x11/fonts
PKG_SITES:=		${MASTER_SITE_XORG}

DISTFILES:=		${PKG_NAME}-${PKG_VERSION}.tar.gz

include $(ADK_TOPDIR)/mk/package.mk

$(eval $(call PKG_template,BDFTOPCF,bdftopcf,$(PKG_VERSION)-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))

bdftopcf-install:
	$(INSTALL_DIR) $(IDIR_BDFTOPCF)/usr/bin
	$(INSTALL_BIN) $(WRKINST)/usr/bin/bdftopcf \
		$(IDIR_BDFTOPCF)/usr/bin

include ${ADK_TOPDIR}/mk/pkg-bottom.mk
