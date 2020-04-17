# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(ADK_TOPDIR)/rules.mk

# always use tab spaces as separator, no spaces
PKG_NAME:=		SQLAlchemy
PKG_VERSION:=		1.3.16
PKG_RELEASE:=		1
PKG_HASH:=		7224e126c00b8178dfd227bc337ba5e754b197a3867d33b9f30dc0208f773d70
PKG_DESCR:=		python database OR mapper
PKG_SECTION:=		dev/python
PKG_URL:=		https://www.sqlalchemy.org/
PKG_SITES:=		https://files.pythonhosted.org/packages/7f/4b/adfb1f03da7f50db054a5b728d32dbfae8937754cfa159efa0216a3758d1/
DISTFILES:=             $(PKG_NAME)-$(PKG_VERSION).tar.gz

include $(ADK_TOPDIR)/mk/package.mk

$(eval $(call PKG_template,SQLALCHEMY,sqlalchemy,$(PKG_VERSION)-$(PKG_RELEASE),$(PKG_DEPENDS),$(PKG_DESCR),$(PKG_SECTION)))

CONFIG_STYLE:=		manual
BUILD_STYLE:=		manual
INSTALL_STYLE:=		manual

include $(ADK_TOPDIR)/mk/python3.mk

do-build:
	cd $(WRKBUILD); env PYTHONPATH=$(PYTHON_LIBDIR) $(PYTHON) ./setup.py build
	$(INSTALL_DIR) $(WRKINST)/usr/lib/python$(PYTHON_VERSION)/site-packages
	cd $(WRKBUILD); env PYTHONPATH=$(PYTHON_LIBDIR):$(WRKINST)/usr/lib/python$(PYTHON_VERSION)/site-packages $(PYTHON) ./setup.py install --prefix="$(WRKINST)/usr"

do-install:
	$(INSTALL_DIR) $(IDIR_SQLALCHEMY)/usr/lib/python$(PYTHON_VERSION)/site-packages
	$(CP) $(WRKINST)/usr/lib/python$(PYTHON_VERSION)/site-packages/*egg $(IDIR_SQLALCHEMY)/usr/lib/python$(PYTHON_VERSION)/site-packages/
	$(CP) $(WRKINST)/usr/lib/python$(PYTHON_VERSION)/site-packages/easy-install.pth $(IDIR_SQLALCHEMY)/usr/lib/python$(PYTHON_VERSION)/site-packages/$(PKG_NAME).pth

include $(ADK_TOPDIR)/mk/pkg-bottom.mk
