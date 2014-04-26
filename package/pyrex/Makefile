# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(TOPDIR)/rules.mk

PKG_NAME:=		Pyrex
PKG_VERSION:=		0.9.9
PKG_RELEASE:=		3
PKG_MD5SUM:=		515dee67d15d4393841e2d60e8341947
PKG_DESCR:=		mixes Python and C data types
PKG_SECTION:=		libs
PKG_DEPENDS:=		python2
PKG_URL:=		http://www.cosc.canterbury.ac.nz/greg.ewing/python/Pyrex/
PKG_SITES:=		http://www.cosc.canterbury.ac.nz/greg.ewing/python/Pyrex/

DISTFILES:=		${PKG_NAME}-${PKG_VERSION}.tar.gz

include $(TOPDIR)/mk/package.mk

$(eval $(call PKG_template,PYREX,pyrex,$(PKG_VERSION)-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))

CONFIG_STYLE:=		manual
BUILD_STYLE:=		manual
INSTALL_STYLE:=		manual

include $(TOPDIR)/mk/python.mk

do-build:
	cd $(WRKBUILD); env PYTHONPATH=$(PYTHON_LIBDIR) $(PYTHON) ./setup.py build
	cd $(WRKBUILD); env PYTHONPATH=$(PYTHON_LIBDIR) $(PYTHON) ./setup.py install --prefix="$(STAGING_HOST_DIR)/usr"
	cd $(WRKBUILD); env PYTHONPATH=$(PYTHON_LIBDIR) $(PYTHON) ./setup.py install --prefix="$(WRKINST)/usr"

do-install:
	$(INSTALL_DIR) $(IDIR_PYREX)/usr/lib/python$(PYTHON_VERSION)
	$(CP) $(WRKINST)/usr/lib/python$(PYTHON_VERSION)/* \
		$(IDIR_PYREX)/usr/lib/python$(PYTHON_VERSION)

include ${TOPDIR}/mk/pkg-bottom.mk
