# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(TOPDIR)/rules.mk

PKG_NAME:=		CherryPy
PKG_VERSION:=		3.2.0rc1
PKG_RELEASE:=		1
PKG_MD5SUM:=		ee17494e8d4cb9089069f33c28161493
PKG_DESCR:=		A Python Web Framework
PKG_SECTION:=		libs
PKG_DEPENDS:=		python2
PKG_BUILDDEP:=		python2
PKG_URL:=		http://www.cherrypy.org/
PKG_SITES:=		http://download.cherrypy.org/cherrypy/3.2.0rc1/

include $(TOPDIR)/mk/package.mk

$(eval $(call PKG_template,CHERRYPY,$(PKG_NAME),$(PKG_VERSION)-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))

CONFIG_STYLE:=		manual
BUILD_STYLE:=		manual
INSTALL_STYLE:=		manual

PYTHON_VERSION=2.7
PYTHON_DIR:=$(STAGING_TOOLS)
PYTHON_LIB_DIR:=$(PYTHON_DIR)/lib
PYTHON:=${STAGING_TOOLS}/bin/hostpython

do-build:
	cd $(WRKBUILD); env PYTHONPATH=$(PYTHON_LIB_DIR) $(PYTHON) ./setup.py build
	cd $(WRKBUILD); env PYTHONPATH=$(PYTHON_LIB_DIR) $(PYTHON) ./setup.py install --prefix="$(WRKINST)/usr"

do-install:
	$(INSTALL_DIR) $(IDIR_CHERRYPY)/usr/bin
	$(INSTALL_DIR) $(IDIR_CHERRYPY)/usr/lib/python$(PYTHON_VERSION)
	$(CP) $(WRKINST)/usr/lib/python$(PYTHON_VERSION)/* $(IDIR_CHERRYPY)/usr/lib/python$(PYTHON_VERSION)
	$(CP) $(WRKINST)/usr/lib/python$(PYTHON_VERSION)/site-packages/cherrypy/cherryd $(IDIR_CHERRYPY)/usr/bin

include ${TOPDIR}/mk/pkg-bottom.mk
