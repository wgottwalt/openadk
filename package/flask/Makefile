# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(ADK_TOPDIR)/rules.mk

PKG_NAME:=		Flask
PKG_VERSION:=		1.1.1
PKG_RELEASE:=		1
PKG_HASH:=		13f9f196f330c7c2c5d7a5cf91af894110ca0215ac051b5844701f2bfd934d52
PKG_DESCR:=		flask python web framework	
PKG_SECTION:=		net/http
PKG_URL:=		https://pypi.org/project/Flask/	
PKG_SITES:=		https://files.pythonhosted.org/packages/2e/80/3726a729de758513fd3dbc64e93098eb009c49305a97c6751de55b20b694/
PKG_DEPENDS:=		python3 python3-mod-zlib
PKG_BUILDDEP:=		python3

DISTFILES:=             Flask-$(PKG_VERSION).tar.gz

include $(ADK_TOPDIR)/mk/package.mk

$(eval $(call PKG_template,FLASK,flask,$(PKG_VERSION)-$(PKG_RELEASE),$(PKG_DEPENDS),$(PKG_DESCR),$(PKG_SECTION),$(PKG_OPTS)))

CONFIG_STYLE:=		manual
BUILD_STYLE:=		manual
INSTALL_STYLE:=		manual

include $(ADK_TOPDIR)/mk/python3.mk

do-build:
	cd $(WRKBUILD); env PYTHONPATH=$(PYTHON_LIBDIR) $(PYTHON) ./setup.py build
	$(INSTALL_DIR) $(WRKINST)/usr/lib/python$(PYTHON_VERSION)/site-packages
	cd $(WRKBUILD); env PYTHONPATH=$(PYTHON_LIBDIR):$(WRKINST)/usr/lib/python$(PYTHON_VERSION)/site-packages $(PYTHON) ./setup.py install --prefix="$(WRKINST)/usr"

do-install:
	$(INSTALL_DIR) $(IDIR_FLASK)/usr/lib/python$(PYTHON_VERSION)/site-packages
	$(CP) $(WRKINST)/usr/lib/python$(PYTHON_VERSION)/site-packages/* $(IDIR_FLASK)/usr/lib/python$(PYTHON_VERSION)/site-packages/

include $(ADK_TOPDIR)/mk/pkg-bottom.mk
