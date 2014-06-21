# This file is part of the OpenADK project. OpenADK is copyrighted 
# material, please see the LICENCE file in the top-level directory.

include $(ADK_TOPDIR)/rules.mk

PKG_NAME:=		bzr
PKG_VERSION:=		2.6.0
PKG_RELEASE:=		1
PKG_MD5SUM:=		28c86653d0df10d202c6b842deb0ea35
PKG_DESCR:=		source code management system
PKG_SECTION:=		dev/scm
PKG_BUILDDEP:=		python2
PKG_DEPENDS:=		python2
PKG_URL:=		http://bazaar.canonical.com/en/
PKG_SITES:=		https://launchpad.net/bzr/2.6/2.6.0/+download/

DISTFILES:=		${PKG_NAME}-${PKG_VERSION}.tar.gz

PKG_HOST_DEPENDS:=	!darwin

include $(ADK_TOPDIR)/mk/package.mk

$(eval $(call PKG_template,BZR,bzr,$(PKG_VERSION)-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))

CONFIG_STYLE:=		manual
BUILD_STYLE:=		manual
INSTALL_STYLE:=		manual

include $(ADK_TOPDIR)/mk/python.mk

do-build:
	cd $(WRKBUILD); env PYTHONPATH=$(PYTHON_LIBDIR) $(PYTHON) ./setup.py install --prefix=$(WRKINST)/usr build_ext --allow-python-fallback

do-install:
	$(INSTALL_DIR) $(IDIR_BZR)/usr/lib/python$(PYTHON_VERSION)/site-packages
	$(CP) $(WRKINST)/usr/lib/python$(PYTHON_VERSION)/site-packages/* \
		$(IDIR_BZR)/usr/lib/python$(PYTHON_VERSION)/site-packages
	$(INSTALL_DIR) $(IDIR_BZR)/usr/bin
	$(INSTALL_BIN) $(WRKBUILD)/bzr $(IDIR_BZR)/usr/bin

include ${ADK_TOPDIR}/mk/pkg-bottom.mk
