# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(TOPDIR)/rules.mk

PKG_NAME:=		gzip
PKG_VERSION:=		1.2.4
PKG_RELEASE:=		1
PKG_MD5SUM:=		618b61219aa2d812893281bf6c66f158
PKG_DESCR:=		GZIP compression utility
PKG_SECTION:=		archive
PKG_URL:=		http://www.gzip.org/
PKG_SITES:=		${MASTER_SITE_GNU:=gzip/}

DISTFILES:=		${PKG_NAME}-${PKG_VERSION}.tar.gz

include $(TOPDIR)/mk/package.mk

$(eval $(call PKG_template,GZIP,gzip,$(PKG_VERSION)-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))

FAKE_FLAGS+=		prefix=${WRKINST}

gzip-install:
	$(INSTALL_DIR) $(IDIR_GZIP)/usr/bin
	$(CP) $(WRKINST)/bin/gzip $(IDIR_GZIP)/usr/bin

include ${TOPDIR}/mk/pkg-bottom.mk
