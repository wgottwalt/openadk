# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(ADK_TOPDIR)/rules.mk

PKG_NAME:=		libcdio
PKG_VERSION:=		0.92
PKG_RELEASE:=		2
PKG_HASH:=		3336bf352aff43b5023e41a6d23525172a3b4ee433c467bd0fab5b8becb33fad
PKG_DESCR:=		library for cd-rom and cd image access
PKG_SECTION:=		libs/misc
PKG_URL:=		http://www.gnu.org/software/libcdio
PKG_SITES:=		${MASTER_SITE_GNU:=libcdio/}
PKG_OPTS:=		dev

DISTFILES:=		${PKG_NAME}-${PKG_VERSION}.tar.gz

include $(ADK_TOPDIR)/mk/package.mk

$(eval $(call PKG_template,LIBCDIO,libcdio,$(PKG_VERSION)-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION},${PKG_OPTS}))

TARGET_LDFLAGS+=	-ltinfo

libcdio-install:
	$(INSTALL_DIR) $(IDIR_LIBCDIO)/usr/lib
	$(CP) $(WRKINST)/usr/lib/lib*.so* \
		$(IDIR_LIBCDIO)/usr/lib

include ${ADK_TOPDIR}/mk/pkg-bottom.mk
