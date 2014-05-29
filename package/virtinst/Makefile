# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(TOPDIR)/rules.mk

PKG_NAME:=		virtinst
PKG_VERSION:=		0.600.0
PKG_RELEASE:=		1
PKG_MD5SUM:=		d8f6a61d7edbc78129a8b5df2807ad46
PKG_DESCR:=		virtual machine installer
PKG_SECTION:=		sys/misc
PKG_BUILDDEP:=		python2 urlgrabber libxml2 libxslt
PKG_DEPENDS:=		python2 urlgrabber libxml2-python libxslt libvirt
PKG_URL:=		http://virt-manager.org/
PKG_SITES:=		http://virt-manager.org/download/sources/virtinst/

include $(TOPDIR)/mk/package.mk

$(eval $(call PKG_template,VIRTINST,virtinst,$(PKG_VERSION)-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))

CONFIG_STYLE:=		manual
BUILD_STYLE:=		manual
INSTALL_STYLE:=		manual

include $(TOPDIR)/mk/python.mk

do-build:
	(cd $(WRKBUILD); env PYTHONPATH=$(PYTHON_LIBDIR) $(PYTHON) ./setup.py build)
	(cd $(WRKBUILD); env PYTHONPATH=$(PYTHON_LIBDIR) $(PYTHON) ./setup.py install --prefix="$(WRKINST)/usr")

do-install:
	$(INSTALL_DIR) $(IDIR_VIRTINST)/usr/bin
	$(INSTALL_DIR) $(IDIR_VIRTINST)/usr/lib/python$(PYTHON_VERSION)/site-packages
	$(CP) $(WRKINST)/usr/bin/virt-* $(IDIR_VIRTINST)/usr/bin
	$(CP) $(WRKINST)/usr/lib/python$(PYTHON_VERSION)/site-packages/* \
		$(IDIR_VIRTINST)/usr/lib/python$(PYTHON_VERSION)/site-packages

include ${TOPDIR}/mk/pkg-bottom.mk
