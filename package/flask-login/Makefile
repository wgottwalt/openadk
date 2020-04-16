# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(ADK_TOPDIR)/rules.mk

# always use tab spaces as separator, no spaces
PKG_NAME:=		Flask-Login
PKG_VERSION:=		0.5.0
PKG_RELEASE:=		1
PKG_HASH:=		6d33aef15b5bcead780acc339464aae8a6e28f13c90d8b1cf9de8b549d1c0b4b
PKG_DESCR:=		login management for flask
PKG_SECTION:=		dev/python
PKG_DEPENDS:=		flask
PKG_URL:=		https://pypi.org/project/Flask-Login	
PKG_SITES:=		https://files.pythonhosted.org/packages/f9/01/f6c0a3a654ca125cf9cd273314c03a8bc6a47bf861765c8c1d375e15a28d/
DISTFILES:=             $(PKG_NAME)-$(PKG_VERSION).tar.gz

include $(ADK_TOPDIR)/mk/package.mk

$(eval $(call PKG_template,FLASK_LOGIN,flask-login,$(PKG_VERSION)-$(PKG_RELEASE),$(PKG_DEPENDS),$(PKG_DESCR),$(PKG_SECTION)))

CONFIG_STYLE:=		manual
BUILD_STYLE:=		manual
INSTALL_STYLE:=		manual

include $(ADK_TOPDIR)/mk/python3.mk

do-build:
	cd $(WRKBUILD); env PYTHONPATH=$(PYTHON_LIBDIR) $(PYTHON) ./setup.py build
	$(INSTALL_DIR) $(WRKINST)/usr/lib/python$(PYTHON_VERSION)/site-packages
	cd $(WRKBUILD); env PYTHONPATH=$(PYTHON_LIBDIR):$(WRKINST)/usr/lib/python$(PYTHON_VERSION)/site-packages $(PYTHON) ./setup.py install --prefix="$(WRKINST)/usr"

do-install:
	$(INSTALL_DIR) $(IDIR_FLASK_LOGIN)/usr/lib/python$(PYTHON_VERSION)/site-packages
	$(CP) $(WRKINST)/usr/lib/python$(PYTHON_VERSION)/site-packages/Flask_Login* $(IDIR_FLASK_LOGIN)/usr/lib/python$(PYTHON_VERSION)/site-packages/
	$(CP) $(WRKINST)/usr/lib/python$(PYTHON_VERSION)/site-packages/easy-install.pth $(IDIR_FLASK_LOGIN)/usr/lib/python$(PYTHON_VERSION)/site-packages/$(PKG_NAME).pth

# please remove ALL above comments, before commiting
include $(ADK_TOPDIR)/mk/pkg-bottom.mk
