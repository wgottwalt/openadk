# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(ADK_TOPDIR)/rules.mk

PKG_NAME:=		supl
PKG_VERSION:=		1.0.6
PKG_RELEASE:=		1
PKG_HASH:=		068dc47ce818ce5634f09a88159df85a6ce3456e2467b11b8c5f8543a99bb347
PKG_DESCR:=		tools for accessing sup/rrlp server
PKG_SECTION:=		net/misc
PKG_DEPENDS:=		libressl
PKG_BUILDDEP:=		libressl
PKG_URL:=		http://www.tajuma.com/supl/
PKG_SITES:=		$(MASTER_SITE_SOURCEFORGE:=supl/)

DISTFILES:=             $(PKG_NAME)_$(PKG_VERSION).tar.gz
WRKDIST=		$(WRKDIR)/trunk

include $(ADK_TOPDIR)/mk/package.mk

$(eval $(call PKG_template,SUPL,supl,$(PKG_VERSION)-$(PKG_RELEASE),$(PKG_DEPENDS),$(PKG_DESCR),$(PKG_SECTION)))

CONFIG_STYLE:=		minimal
CONFIGURE_ARGS+=	--prefix="$(WRKINST)/usr" \
			--precompiled-asn1=yes

supl-install:
	$(INSTALL_DIR) $(IDIR_SUPL)/usr/{bin,lib}
	$(INSTALL_BIN) $(WRKINST)/usr/bin/supl-{cert,client,proxy} \
		$(IDIR_SUPL)/usr/bin
	$(CP) $(WRKINST)/usr/lib/lib{asnrrlp,asnsupl,supl}.so* \
		$(IDIR_SUPL)/usr/lib

include $(ADK_TOPDIR)/mk/pkg-bottom.mk
