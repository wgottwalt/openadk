# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(TOPDIR)/rules.mk

PKG_NAME:=		poppler
PKG_VERSION:=		0.22.1
PKG_RELEASE:=		1
PKG_MD5SUM:=		50c259fdda538c1ba94b62aa25f7ec87
PKG_DESCR:=		pdf rendering library
PKG_SECTION:=		libs
PKG_BUILDDEP:=		fontconfig libstdcxx
PKG_DEPENDS:=		fontconfig libstdcxx
PKG_URL:=		http://poppler.freedesktop.org/
PKG_SITES:=		http://poppler.freedesktop.org/
PKG_OPTS:=		dev

include $(TOPDIR)/mk/package.mk

$(eval $(call PKG_template,POPPLER,poppler,$(PKG_VERSION)-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION},${PKG_OPTS}))

TARGET_LDFLAGS+=	-L$(STAGING_DIR)/usr/lib64

poppler-install:
	$(INSTALL_DIR) $(IDIR_POPPLER)/usr/lib
	$(CP) $(WRKINST)/usr/lib/libpoppler*.so* \
		$(IDIR_POPPLER)/usr/lib

include ${TOPDIR}/mk/pkg-bottom.mk
