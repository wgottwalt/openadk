# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(TOPDIR)/rules.mk

PKG_NAME:=		CherryPy
PKG_VERSION:=		3.3.0
PKG_RELEASE:=		1
PKG_MD5SUM:=		4ac4af5ac21a893f07221cbd7ec4be11
PKG_DESCR:=		python web framework
PKG_SECTION:=		net/http
PKG_DEPENDS:=		python2
PKG_BUILDDEP:=		python2
PKG_URL:=		http://www.cherrypy.org/
PKG_SITES:=		https://pypi.python.org/packages/source/C/CherryPy/

DISTFILES:=		${PKG_NAME}-${PKG_VERSION}.tar.gz

include $(TOPDIR)/mk/package.mk

$(eval $(call PKG_template,CHERRYPY,cherrypy,$(PKG_VERSION)-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))

CONFIG_STYLE:=		manual
BUILD_STYLE:=		manual
INSTALL_STYLE:=		manual

include $(TOPDIR)/mk/python.mk

do-build:
	cd $(WRKBUILD); env PYTHONPATH=$(PYTHON_LIBDIR) $(PYTHON) ./setup.py build
	cd $(WRKBUILD); env PYTHONPATH=$(PYTHON_LIBDIR) $(PYTHON) ./setup.py install --prefix="$(WRKINST)/usr"

do-install:
	$(INSTALL_DIR) $(IDIR_CHERRYPY)/usr/bin
	$(INSTALL_DIR) $(IDIR_CHERRYPY)/usr/lib/python$(PYTHON_VERSION)
	$(CP) $(WRKINST)/usr/lib/python$(PYTHON_VERSION)/* $(IDIR_CHERRYPY)/usr/lib/python$(PYTHON_VERSION)
	$(CP) $(WRKINST)/usr/lib/python$(PYTHON_VERSION)/site-packages/cherrypy/cherryd $(IDIR_CHERRYPY)/usr/bin

include ${TOPDIR}/mk/pkg-bottom.mk
