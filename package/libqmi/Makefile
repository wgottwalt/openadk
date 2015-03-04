# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(ADK_TOPDIR)/rules.mk

PKG_NAME:=		libqmi
PKG_VERSION:=		1.12.4
PKG_RELEASE:=		1
PKG_HASH:=		5527342bc869400d2a9c3038d66ec8ef87980aefb6c7aae593a13ebfee686a15
PKG_DESCR:=		qmi modem protocol helper library
PKG_SECTION:=		libs/net
PKG_DEPENDS:=		glib
PKG_BUILDDEP:=		glib
PKG_URL:=		http://cgit.freedesktop.org/libqmi/
PKG_SITES:=		http://cgit.freedesktop.org/libqmi/snapshot/
PKG_OPTS:=		dev

include $(ADK_TOPDIR)/mk/package.mk

$(eval $(call PKG_template,LIBQMI,libqmi,$(PKG_VERSION)-$(PKG_RELEASE),$(PKG_DEPENDS),$(PKG_DESCR),$(PKG_SECTION),$(PKG_OPTS)))

AUTOTOOL_STYLE:=	autogen

libqmi-install:
	$(INSTALL_DIR) $(IDIR_LIBQMI)/usr/{bin,lib}
	$(INSTALL_BIN) $(WRKINST)/usr/bin/qmi{-network,cli} \
		$(IDIR_LIBQMI)/usr/bin
	$(CP) $(WRKINST)/usr/lib/libqmi-glib.so* $(IDIR_LIBQMI)/usr/lib/

include $(ADK_TOPDIR)/mk/pkg-bottom.mk
