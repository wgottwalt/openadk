# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(TOPDIR)/rules.mk

PKG_NAME:=		bzr
PKG_VERSION:=		2.0.4
PKG_RELEASE:=		1
PKG_MD5SUM:=		0b253f59601ebc9ee5975c612fc65f43
PKG_DESCR:=		bazaar
PKG_SECTION:=		scm
PKG_DEPENDS:=		python2
PKG_BUILDDEP:=		python2
PKG_URL:=		http://bazaar.canonical.com/en/
PKG_SITES:=		http://launchpad.net/bzr/2.0/${PKG_VERSION}/+download/

include $(TOPDIR)/mk/package.mk

$(eval $(call PKG_template,BZR,$(PKG_NAME),$(PKG_VERSION)-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))

PYTHON_VERSION=2.6
PYTHON_DIR:=$(STAGING_DIR)/usr
PYTHON_BIN_DIR:=$(PYTHON_DIR)/bin
PYTHON_INC_DIR:=$(PYTHON_DIR)/include/python$(PYTHON_VERSION)
PYTHON_LIB_DIR:=$(PYTHON_DIR)/lib/python$(PYTHON_VERSION)
PYTHON:=python$(PYTHON_VERSION)
PYTHON_PKG_DIR:=/usr/lib/python$(PYTHON_VERSION)/site-packages

CONFIG_STYLE:=		manual

post-install:
	$(INSTALL_DIR) $(IDIR_BZR)/usr/bin
	$(INSTALL_BIN) $(WRKINST)/usr/bin/bzr \
		$(IDIR_BZR)/usr/bin

include ${TOPDIR}/mk/pkg-bottom.mk
