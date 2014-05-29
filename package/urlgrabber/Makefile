# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(TOPDIR)/rules.mk

PKG_NAME:=		urlgrabber
PKG_VERSION:=		3.9.1
PKG_RELEASE:=		1
PKG_MD5SUM:=		00c8359bf71062d0946bacea521f80b4
PKG_DESCR:=		python module for fetching of files
PKG_SECTION:=		dev/python
PKG_BUILDDEP:=		pycurl
PKG_DEPENDS:=		pycurl
PKG_URL:=		http://urlgrabber.baseurl.org/
PKG_SITES:=		http://urlgrabber.baseurl.org/download/

include $(TOPDIR)/mk/package.mk

$(eval $(call PKG_template,URLGRABBER,urlgrabber,$(PKG_VERSION)-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))

CONFIG_STYLE:=		manual
BUILD_STYLE:=		manual
INSTALL_STYLE:=		manual

include $(TOPDIR)/mk/python.mk

do-build:
	(cd $(WRKBUILD); env PYTHONPATH=$(PYTHON_LIBDIR) $(PYTHON) ./setup.py build)
	(cd $(WRKBUILD); env PYTHONPATH=$(PYTHON_LIBDIR) $(PYTHON) ./setup.py install --prefix="$(WRKINST)/usr")

do-install:
	$(INSTALL_DIR) $(IDIR_URLGRABBER)/usr/lib/python$(PYTHON_VERSION)/site-packages
	$(CP) $(WRKINST)/usr/lib/python$(PYTHON_VERSION)/site-packages/* \
		$(IDIR_URLGRABBER)/usr/lib/python$(PYTHON_VERSION)/site-packages

include ${TOPDIR}/mk/pkg-bottom.mk
