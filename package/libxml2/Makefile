# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(ADK_TOPDIR)/rules.mk

PKG_NAME:=		libxml2
PKG_VERSION:=		2.9.2
PKG_RELEASE:=		2
PKG_HASH:=		5178c30b151d044aefb1b08bf54c3003a0ac55c59c866763997529d60770d5bc
PKG_DESCR:=		xml parser and toolkit
PKG_SECTION:=		libs/data
PKG_DEPENDS:=		zlib
PKG_BUILDDEP:=		libxml2-host python2 zlib
HOST_BUILDDEP:=		python2-host
PKG_URL:=		http://www.xmlsoft.org/
PKG_SITES:=		http://xmlsoft.org/sources/
PKG_OPTS:=		dev

DISTFILES:=		$(PKG_NAME)-$(PKG_VERSION).tar.gz

PKG_SUBPKGS:=		LIBXML2 LIBXML2_PYTHON
PKGSD_LIBXML2_PYTHON:=	xml python bindings
PKGSC_LIBXML2_PYTHON:=	libs/misc
PKGSB_LIBXML2_PYTHON:=	python2
PKGSS_LIBXML2_PYTHON:=	python2

include $(ADK_TOPDIR)/mk/host.mk
include $(ADK_TOPDIR)/mk/package.mk

$(eval $(call HOST_template,LIBXML2,libxml2,$(PKG_VERSION)-$(PKG_RELEASE)))
$(eval $(call PKG_template,LIBXML2,libxml2,$(PKG_VERSION)-$(PKG_RELEASE),$(PKG_DEPENDS),$(PKG_DESCR),$(PKG_SECTION),$(PKG_OPTS)))
$(eval $(call PKG_template,LIBXML2_PYTHON,libxml2-python,$(PKG_VERSION)-$(PKG_RELEASE),$(PKG_DEPENDS),$(PKGSD_LIBXML2_PYTHON),$(PKGSC_LIBXML2_PYTHON)))

include $(ADK_TOPDIR)/mk/python.mk

TARGET_CPPFLAGS+=	-I$(STAGING_TARGET_DIR)/usr/include/python$(PYTHON_VERSION)
HOST_CPPFLAGS+=		-I$(STAGING_HOST_DIR)/usr/include/python$(PYTHON_VERSION)
HOST_STYLE:=		auto
HOST_CONFIGURE_ARGS+=	--with-python \
			--with-threads \
			--without-iconv \
			--without-lzma \
			--without-zlib

AUTOTOOL_STYLE:=	autoreconf
CONFIGURE_ARGS+=	--without-c14n \
			--without-debug \
			--without-docbook \
			--with-catalog \
			--with-html \
			--without-ftp \
			--without-http \
			--without-iconv \
			--without-lzma \
			--without-iso8859x \
			--without-legacy \
			--with-output \
			--without-pattern \
			--without-push \
			--with-reader \
			--without-readline \
			--without-regexps \
			--with-sax1 \
			--with-schemas \
			--with-threads \
			--with-tree \
			--with-valid \
			--with-writer \
			--with-xinclude \
			--with-xpath \
			--with-xptr \
			--with-python \
			--with-zlib

libxml2-install:
	$(INSTALL_DIR) $(IDIR_LIBXML2)/usr/lib
	$(CP) $(WRKINST)/usr/lib/libxml2.so* $(IDIR_LIBXML2)/usr/lib

libxml2-python-install:
	$(INSTALL_DIR) $(IDIR_LIBXML2_PYTHON)/usr/lib/python/site-packages
	$(CP) $(WRKINST)/usr/lib/python/site-packages/*.{so,py} \
		$(IDIR_LIBXML2_PYTHON)/usr/lib/python/site-packages
	
include $(ADK_TOPDIR)/mk/host-bottom.mk
include $(ADK_TOPDIR)/mk/pkg-bottom.mk
