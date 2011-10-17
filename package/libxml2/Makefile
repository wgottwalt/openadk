# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include ${TOPDIR}/rules.mk

PKG_NAME:=		libxml2
PKG_VERSION:=		2.7.8
PKG_RELEASE:=		1
PKG_MD5SUM:=		8127a65e8c3b08856093099b52599c86
PKG_DESCR:=		XML C parser and toolkit
PKG_SECTION:=		libs
PKG_DEPENDS:=		zlib
PKG_BUILDDEP:=		zlib
PKG_URL:=		http://www.xmlsoft.org/
PKG_SITES:=		http://xmlsoft.org/sources/

PKG_SUBPKGS:=		LIBXML2 LIBXML2_DEV LIBXML2_PYTHON
PKGSD_LIBXML2_DEV:=	XML parser headers
PKGSC_LIBXML2_DEV:=	devel
PKGSD_LIBXML2_PYTHON:=	XML python bindings
PKGSC_LIBXML2_PYTHON:=	libs
PKGSB_LIBXML2_PYTHON:=	python2

include ${TOPDIR}/mk/package.mk

$(eval $(call PKG_template,LIBXML2,libxml2,${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))
$(eval $(call PKG_template,LIBXML2_DEV,libxml2-dev,${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKGSD_LIBXML2_DEV},${PKGSC_LIBXML2_DEV}))
$(eval $(call PKG_template,LIBXML2_PYTHON,libxml2-python,${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKGSD_LIBXML2_PYTHON},${PKGSC_LIBXML2_PYTHON}))

include $(TOPDIR)/mk/python.mk

TARGET_CFLAGS:=		$(filter-out -flto,$(TARGET_CFLAGS))
ifeq ($(ADK_PACKAGE_LIBXML2_PYTHON),y)
CONFIGURE_ARGS+=	--with-python=${STAGING_DIR}/usr
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

libxml2-dev-install:
	${INSTALL_DIR} ${IDIR_LIBXML2_DEV}/usr/include
	${CP} ${WRKINST}/usr/include/* ${IDIR_LIBXML2_DEV}/usr/include
	${INSTALL_DIR} ${IDIR_LIBXML2_DEV}/usr/lib/pkgconfig
	${INSTALL_DATA} ${WRKINST}/usr/lib/pkgconfig/libxml-2.0.pc \
		${IDIR_LIBXML2_DEV}/usr/lib/pkgconfig
	${INSTALL_DIR} ${IDIR_LIBXML2_DEV}/usr/bin
	${INSTALL_BIN} ${WRKINST}/usr/bin/xml2-config \
		${IDIR_LIBXML2_DEV}/usr/bin

libxml2-python-install:
	$(INSTALL_DIR) $(IDIR_LIBXML2_PYTHON)/usr/lib/python$(PYTHON_VERSION)/site-packages
	$(CP) $(WRKINST)/usr/lib/python$(PYTHON_VERSION)/site-packages/* \
		$(IDIR_LIBXML2_PYTHON)/usr/lib/python$(PYTHON_VERSION)/site-packages
	
include ${TOPDIR}/mk/pkg-bottom.mk
