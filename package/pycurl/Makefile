# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(TOPDIR)/rules.mk

PKG_NAME:=		pycurl
PKG_VERSION:=		7.19.0.2
PKG_RELEASE:=		1
PKG_MD5SUM:=		518be33976dbc6838e42495ada64b43f
PKG_DESCR:=		Python module for fetching of files
PKG_SECTION:=		lang
PKG_BUILDDEP:=		python2 curl
PKG_DEPENDS:=		python2 libcurl
PKG_URL:=		http://pycurl.sourceforge.net/
PKG_SITES:=		http://pycurl.sourceforge.net/download/

include $(TOPDIR)/mk/package.mk

$(eval $(call PKG_template,PYCURL,pycurl,$(PKG_VERSION)-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))

CONFIG_STYLE:=		manual
BUILD_STYLE:=		manual
INSTALL_STYLE:=		manual

XAKE_FLAGS+=		GCC_HONOUR_COPTS=s
TARGET_CFLAGS+=		-fPIC
MAKE_ENV+=		LDSHARED="$(TARGET_CC) -shared"
CURL_CONFIG:=		$(STAGING_DIR)/usr/bin/curl-config

include $(TOPDIR)/mk/python.mk

do-build:
	(cd $(WRKBUILD); env GCC_HONOUR_COPTS=s PYTHONPATH=$(PYTHON_LIBDIR) $(PYTHON) ./setup.py --curl-config=$(CURL_CONFIG) build)
	(cd $(WRKBUILD); env GCC_HONOUR_COPTS=s PYTHONPATH=$(PYTHON_LIBDIR) $(PYTHON) ./setup.py --curl-config=$(CURL_CONFIG) install --prefix="$(WRKINST)/usr")

do-install:
	$(INSTALL_DIR) $(IDIR_PYCURL)/usr/lib/python$(PYTHON_VERSION)/site-packages
	$(CP) $(WRKINST)/usr/lib/python$(PYTHON_VERSION)/site-packages/* \
		$(IDIR_PYCURL)/usr/lib/python$(PYTHON_VERSION)/site-packages

include ${TOPDIR}/mk/pkg-bottom.mk
