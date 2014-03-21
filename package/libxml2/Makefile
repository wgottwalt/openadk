# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include ${TOPDIR}/rules.mk

PKG_NAME:=		libxml2
PKG_VERSION:=		2.9.1
PKG_RELEASE:=		6
PKG_MD5SUM:=		9c0cfef285d5c4a5c80d00904ddab380
PKG_DESCR:=		XML C parser and toolkit
PKG_SECTION:=		libs
PKG_DEPENDS:=		zlib
PKG_BUILDDEP:=		libxml2-host zlib
HOST_BUILDDEP:=		python2-host
PKG_URL:=		http://www.xmlsoft.org/
PKG_SITES:=		http://xmlsoft.org/sources/
PKG_OPTS:=		dev

PKG_SUBPKGS:=		LIBXML2 LIBXML2_PYTHON
PKGSD_LIBXML2_PYTHON:=	XML python bindings
PKGSC_LIBXML2_PYTHON:=	libs
PKGSB_LIBXML2_PYTHON:=	python2
PKGSS_LIBXML2_PYTHON:=	python2

ifeq ($(ADK_STATIC),y)
PKG_OPTS+=		libmix
endif

include ${TOPDIR}/mk/host.mk
include ${TOPDIR}/mk/package.mk

$(eval $(call HOST_template,LIBXML2,libxml2,${PKG_VERSION}-${PKG_RELEASE}))
$(eval $(call PKG_template,LIBXML2,libxml2,${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION},${PKG_OPTS}))
$(eval $(call PKG_template,LIBXML2_PYTHON,libxml2-python,${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKGSD_LIBXML2_PYTHON},${PKGSC_LIBXML2_PYTHON}))

include $(TOPDIR)/mk/python.mk

HOST_STYLE:=		auto
HOST_CONFIGURE_ARGS+=	--with-python \
			--without-iconv \
			--without-lzma \
			--without-zlib
HOST_MAKE_FLAGS+=	LDFLAGS=-lpthread

AUTOTOOL_STYLE:=	autoreconf
TARGET_CFLAGS:=		$(filter-out -flto,$(TARGET_CFLAGS))
TARGET_LDFLAGS+=	-lpthread
ifneq ($(ADK_PACKAGE_LIBXML2_PYTHON),)
CONFIGURE_ARGS+=	--with-python
else
CONFIGURE_ARGS+=	--without-python
endif
CONFIGURE_ARGS+=	--without-c14n \
			--without-debug \
			--without-docbook \
			--with-catalog \
			--with-html \
			--without-ftp \
			--without-http \
			--without-iconv \
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
			--with-zlib

libxml2-install:
	${INSTALL_DIR} ${IDIR_LIBXML2}/usr/lib
	${CP} ${WRKINST}/usr/lib/libxml2.so* ${IDIR_LIBXML2}/usr/lib

libxml2-python-install:
	$(INSTALL_DIR) $(IDIR_LIBXML2_PYTHON)/usr/lib/python$(PYTHON_VERSION)/site-packages
	$(CP) $(WRKINST)/usr/lib/python$(PYTHON_VERSION)/site-packages/*.{so,py} \
		$(IDIR_LIBXML2_PYTHON)/usr/lib/python$(PYTHON_VERSION)/site-packages
	
include ${TOPDIR}/mk/host-bottom.mk
include ${TOPDIR}/mk/pkg-bottom.mk
