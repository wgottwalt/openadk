# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(ADK_TOPDIR)/rules.mk

PKG_NAME:=		libdcadec
PKG_VERSION:=		0.2.0
PKG_RELEASE:=		1
PKG_HASH:=		ed9d207fde3e8d576f3af8b0d1235b3371e315175757173689104efcaebf0d44
PKG_DESCR:=		dts coherent acoustics decoder with support for hd extensions
PKG_SECTION:=		libs/audio
PKG_URL:=		https://github.com/foo86/dcadec
PKG_SITES:=		https://github.com/foo86/dcadec/archive/
PKG_OPTS:=		dev

DISTFILES:=             v$(PKG_VERSION).tar.gz
WRKDIST=		$(WRKDIR)/dcadec-$(PKG_VERSION)

include $(ADK_TOPDIR)/mk/package.mk

$(eval $(call PKG_template,LIBDCADEC,libdcadec,$(PKG_VERSION)-$(PKG_RELEASE),$(PKG_DEPENDS),$(PKG_DESCR),$(PKG_SECTION),$(PKG_OPTS)))

XAKE_FLAGS+=		PREFIX=/usr
CONFIG_STYLE:=		manual

libdcadec-install:
	$(INSTALL_DIR) $(IDIR_LIBDCADEC)/usr/lib
	$(CP) $(WRKINST)/usr/lib/liblibdcadec*.so* \
		$(IDIR_LIBDCADEC)/usr/lib

include $(ADK_TOPDIR)/mk/pkg-bottom.mk
