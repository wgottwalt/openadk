# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(ADK_TOPDIR)/rules.mk

PKG_NAME:=		htpdate
PKG_VERSION:=		1.1.1
PKG_RELEASE:=		1
PKG_HASH:=		0d75f91cb61f8869c8298d198fa52b9a139ae505b366e9d4d331af8bc1c04880
PKG_DESCR:=		hypertext time protocol implementation
PKG_SECTION:=		net/ntp
PKG_URL:=		http://www.vervest.org/htp/
PKG_SITES:=		http://www.vervest.org/htp/archive/c/

include $(ADK_TOPDIR)/mk/package.mk

$(eval $(call PKG_template,HTPDATE,htpdate,$(PKG_VERSION)-$(PKG_RELEASE),$(PKG_DEPENDS),$(PKG_DESCR),$(PKG_SECTION)))

CONFIG_STYLE:=		manual

htpdate-install:
	$(INSTALL_DIR) $(IDIR_HTPDATE)/usr/sbin
	$(INSTALL_BIN) $(WRKBUILD)/htpdate $(IDIR_HTPDATE)/usr/sbin/

include $(ADK_TOPDIR)/mk/pkg-bottom.mk
