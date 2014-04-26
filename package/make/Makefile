# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(TOPDIR)/rules.mk

PKG_NAME:=		make
PKG_VERSION:=		3.81
PKG_RELEASE:=		1
PKG_MD5SUM:=		a4e9494ac6dc3f6b0c5ff75c5d52abba
PKG_DESCR:=		GNU make
PKG_SECTION:=		lang
PKG_URL:=		http://www.gnu.org/software/make
PKG_SITES:=		${MASTER_SITE_GNU:=make/}

DISTFILES:=		${PKG_NAME}-${PKG_VERSION}.tar.gz

include $(TOPDIR)/mk/package.mk

$(eval $(call PKG_template,MAKE,make,$(PKG_VERSION)-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))

make-install:
	$(INSTALL_DIR) $(IDIR_MAKE)/usr/bin
	$(INSTALL_BIN) $(WRKINST)/usr/bin/make $(IDIR_MAKE)/usr/bin

include ${TOPDIR}/mk/pkg-bottom.mk
