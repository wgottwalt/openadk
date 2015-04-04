# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(ADK_TOPDIR)/rules.mk

PKG_NAME:=		json-c
PKG_VERSION:=		0.11
PKG_RELEASE:=		1
PKG_HASH:=		28dfc65145dc0d4df1dfe7701ac173c4e5f9347176c8983edbfac9149494448c
PKG_DESCR:=		json library
PKG_SECTION:=		libs/data
PKG_URL:=		https://github.com/json-c/json-c/wiki
PKG_SITES:=		https://s3.amazonaws.com/json-c_releases/releases/
PKG_OPTS:=		dev
PKG_NOPARALLEL:=	1

DISTFILES:=		${PKG_NAME}-${PKG_VERSION}.tar.gz

include $(ADK_TOPDIR)/mk/package.mk

$(eval $(call PKG_template,JSON_C,json-c,$(PKG_VERSION)-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION},${PKG_OPTS}))

CONFIGURE_ENV+=		ac_cv_func_malloc_0_nonnull=yes \
			ac_cv_func_realloc_0_nonnull=yes

json-c-install:
	$(INSTALL_DIR) $(IDIR_JSON_C)/usr/lib
	$(CP) $(WRKINST)/usr/lib/libjson*.so* \
		$(IDIR_JSON_C)/usr/lib

include ${ADK_TOPDIR}/mk/pkg-bottom.mk
