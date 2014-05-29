# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(TOPDIR)/rules.mk

PKG_NAME:=		mkfontdir
PKG_VERSION:=		1.0.7
PKG_RELEASE:=		1
PKG_MD5SUM:=		52a5bc129f3f3ac54e7115608cec3cdc
PKG_DESCR:=		font utility
PKG_SECTION:=		x11/fonts
PKG_DEPENDS:=		mkfontscale
PKG_SITES:=		${MASTER_SITE_XORG}
PKG_OPTS:=		noscripts

DISTFILES:=		${PKG_NAME}-${PKG_VERSION}.tar.gz

include $(TOPDIR)/mk/package.mk

$(eval $(call PKG_template,MKFONTDIR,mkfontdir,$(PKG_VERSION)-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION},${PKG_OPTS}))

mkfontdir-install:
	$(INSTALL_DIR) $(IDIR_MKFONTDIR)/usr/bin
	$(INSTALL_BIN) $(WRKINST)/usr/bin/mkfontdir \
		$(IDIR_MKFONTDIR)/usr/bin

include ${TOPDIR}/mk/pkg-bottom.mk
