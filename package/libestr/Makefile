# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(ADK_TOPDIR)/rules.mk

PKG_NAME:=		libestr
PKG_VERSION:=		0.1.9
PKG_RELEASE:=		1
PKG_HASH:=		822c6e2d01eaca1e72201f403a2ca01f3e86410b880e508e5204e3c2694d751a
PKG_DESCR:=		some essentials for string handling
PKG_SECTION:=		libs/misc
PKG_URL:=		http://libestr.adiscon.com/
PKG_SITES:=		http://libestr.adiscon.com/files/download/
PKG_OPTS:=		dev

DISTFILES:=             ${PKG_NAME}-${PKG_VERSION}.tar.gz

include $(ADK_TOPDIR)/mk/package.mk

$(eval $(call PKG_template,LIBESTR,libestr,$(PKG_VERSION)-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION},${PKG_OPTS}))

CONFIGURE_ENV+=		ac_cv_func_malloc_0_nonnull=yes \
			ac_cv_func_realloc_0_nonnull=yes

libestr-install:
	$(INSTALL_DIR) $(IDIR_LIBESTR)/usr/lib
	$(CP) $(WRKINST)/usr/lib/libestr*.so* \
		$(IDIR_LIBESTR)/usr/lib

include ${ADK_TOPDIR}/mk/pkg-bottom.mk
