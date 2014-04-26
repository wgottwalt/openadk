# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(TOPDIR)/rules.mk

PKG_NAME:=		scons
PKG_VERSION:=		2.3.0
PKG_RELEASE:=		2
PKG_MD5SUM:=		083ce5624d6adcbdaf2526623f456ca9
PKG_DESCR:=		a software construction tool
PKG_SECTION:=		lang
HOST_BUILDDEP:=		python2-host
PKG_URL:=		http://www.scons.org
PKG_SITES:=		${MASTER_SITE_SOURCEFORGE:=scons/}

DISTFILES:=		${PKG_NAME}-${PKG_VERSION}.tar.gz

PKG_CFLINE_SCONS:=	depends on ADK_HOST_ONLY

include $(TOPDIR)/mk/host.mk
include $(TOPDIR)/mk/package.mk

$(eval $(call HOST_template,SCONS,scons,$(PKG_VERSION)-${PKG_RELEASE}))

HOST_STYLE:=		manual

scons-hostinstall:
	(cd $(WRKBUILD); PATH='$(HOST_PATH)' python setup.py install \
		--prefix=$(STAGING_HOST_DIR)/usr)

include ${TOPDIR}/mk/host-bottom.mk
include ${TOPDIR}/mk/pkg-bottom.mk
