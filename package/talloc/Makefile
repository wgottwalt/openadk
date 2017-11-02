# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(ADK_TOPDIR)/rules.mk

PKG_NAME:=		talloc
PKG_VERSION:=		2.1.9
PKG_RELEASE:=		1
PKG_HASH:=		f0aad4cb88a3322207c82136ddc07bed48a37c2c21f82962d6c5ccb422711062
PKG_DESCR:=		memory allocation library
PKG_SECTION:=		libs/misc
PKG_BUILDDEP:=		python2-host python2
PKG_URL:=		https://talloc.samba.org/talloc/doc/html/index.html
PKG_SITES:=		https://www.samba.org/ftp/talloc/
PKG_LIBNAME:=		libtalloc
PKG_OPTS:=		dev

DISTFILES:=             $(PKG_NAME)-$(PKG_VERSION).tar.gz

include $(ADK_TOPDIR)/mk/package.mk

$(eval $(call PKG_template,LIBTALLOC,libtalloc,$(PKG_VERSION)-$(PKG_RELEASE),$(PKG_DEPENDS),$(PKG_DESCR),$(PKG_SECTION)))

CONFIG_STYLE:=		minimal
CONFIGURE_ARGS+=	--prefix=/usr \
			--cross-compile \
			--cross-answers=$(WRKSRC)/cache.txt \
			--hostcc=gcc

CONFIGURE_ENV+=		PYTHON_CONFIG="$(STAGING_TARGET_DIR)/usr/bin/python-config" \
			python_LDFLAGS="" \
			python_LIBDIR=""

pre-configure:
	$(CP) ./files/cache.txt $(WRKSRC)
	echo 'Checking uname machine type: "$(ADK_TARGET_ARCH)"' >>$(WRKSRC)/cache.txt

libtalloc-install:
	$(INSTALL_DIR) $(IDIR_LIBTALLOC)/usr/lib
	$(CP) $(WRKINST)/usr/lib/libtalloc.so* \
		$(IDIR_LIBTALLOC)/usr/lib

include $(ADK_TOPDIR)/mk/pkg-bottom.mk
