# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(TOPDIR)/rules.mk

PKG_NAME:=		pycurl
PKG_VERSION:=		7.19.0
PKG_RELEASE:=		1
PKG_MD5SUM:=		919d58fe37e69fe87ce4534d8b6a1c7b
PKG_DESCR:=		Python module for fetching of files
PKG_SECTION:=		misc
PKG_BUILDDEP:=		python2 curl
PKG_DEPENDS:=		python2 libcurl
PKG_URL:=		http://pycurl.sourceforge.net/
PKG_SITES:=		http://pycurl.sourceforge.net/download/

include $(TOPDIR)/mk/package.mk

$(eval $(call PKG_template,PYCURL,pycurl,$(PKG_VERSION)-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))

CONFIG_STYLE:=		manual
BUILD_STYLE:=		manual
INSTALL_STYLE:=		manual

TARGET_CFLAGS+=		-fPIC
MAKE_ENV+=		LDSHARED="$(TARGET_CC) -shared"

include $(TOPDIR)/mk/python.mk

#do-configure:
	# native build for urlgrabber package
#	(cd $(WRKBUILD); env CC=$(CC_FOR_BUILD) CFLAGS="$(CFLAGS_FOR_BUILD)" python ./setup.py build)
#	(cd $(WRKBUILD); enc CC=$(CC_FOR_BUILD) CFLAGS="$(CFLAGS_FOR_BUILD)" python ./setup.py install --prefix="$(STAGING_DIR)/usr")

do-build:
	(cd $(WRKBUILD); env PYTHONPATH=$(PYTHON_LIBDIR) $(PYTHON) ./setup.py --curl-config="$(STAGING_DIR)/usr/bin/curl-config" build)
	(cd $(WRKBUILD); env PYTHONPATH=$(PYTHON_LIBDIR) $(PYTHON) ./setup.py install --prefix="$(WRKINST)/usr")

do-install:
	$(INSTALL_DIR) $(IDIR_PYCURL)/usr/lib/python$(PYTHON_VERSION)/site-packages
	$(CP) $(WRKINST)/usr/lib/python$(PYTHON_VERSION)/site-packages/* \
		$(IDIR_PYCURL)/usr/lib/python$(PYTHON_VERSION)/site-packages

include ${TOPDIR}/mk/pkg-bottom.mk
