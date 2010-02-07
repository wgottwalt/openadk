# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(TOPDIR)/rules.mk

PKG_NAME:=		patch
PKG_VERSION:=		2.5.9
PKG_RELEASE:=		1
PKG_MD5SUM:=		dacfb618082f8d3a2194601193cf8716
PKG_DESCR:=		GNU patch
PKG_SECTION:=		misc
PKG_URL:=		http://www.gnu.org/software/patch
PKG_SITES:=		${MASTER_SITE_GNU:=patch/}

include $(TOPDIR)/mk/package.mk

$(eval $(call PKG_template,PATCH,${PKG_NAME},$(PKG_VERSION)-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))

post-install:
	$(INSTALL_DIR) $(IDIR_PATCH)/usr/bin
	$(INSTALL_BIN) $(WRKINST)/usr/bin/patch $(IDIR_PATCH)/usr/bin

include ${TOPDIR}/mk/pkg-bottom.mk
