# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(TOPDIR)/rules.mk

PKG_NAME:=		bzr
PKG_VERSION:=		2.3b3
PKG_RELEASE:=		1
PKG_MD5SUM:=		94f9181b9a4ab84b94cfbc06bd5dfd91
PKG_DESCR:=		bazaar
PKG_SECTION:=		scm
PKG_DEPENDS:=		python2
PKG_BUILDDEP:=		python2
PKG_URL:=		http://bazaar.canonical.com/en/
PKG_SITES:=		http://launchpad.net/bzr/2.3/${PKG_VERSION}/+download/

include $(TOPDIR)/mk/package.mk

$(eval $(call PKG_template,BZR,$(PKG_NAME),$(PKG_VERSION)-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))

CONFIG_STYLE:=		manual
BUILD_STYLE:=		manual
INSTALL_STYLE:=		manual

include $(TOPDIR)/mk/python.mk

do-build:
	cd $(WRKBUILD); env PYTHONPATH=$(PYTHON_LIBDIR) $(PYTHON) ./setup.py install --prefix="$(WRKINST)/usr"

do-install:
	$(INSTALL_DIR) $(IDIR_BZR)/usr/bin
	$(INSTALL_BIN) $(WRKINST)/usr/bin/bzr \
		$(IDIR_BZR)/usr/bin

include ${TOPDIR}/mk/pkg-bottom.mk
