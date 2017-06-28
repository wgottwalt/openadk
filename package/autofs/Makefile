# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(ADK_TOPDIR)/rules.mk

PKG_NAME:=		autofs
PKG_VERSION:=		5.1.3
PKG_RELEASE:=		1
PKG_HASH:=		e96eebfe3ed5fb1a30f4510f538198affde223e370c6dc2bed9780309272b1bf
PKG_DESCR:=		automount filesystems
PKG_SECTION:=		net/fs
PKG_DEPENDS:=		libtirpc
PKG_BUILDDEP:=		libtirpc
PKG_SITES:=		https://www.kernel.org/pub/linux/daemons/autofs/v5/

include $(ADK_TOPDIR)/mk/package.mk

$(eval $(call PKG_template,AUTOFS,autofs,$(PKG_VERSION)-$(PKG_RELEASE),$(PKG_DEPENDS),$(PKG_DESCR),$(PKG_SECTION)))

AUTOTOOL_STYLE:=	autoreconf
CONFIGURE_ARGS+=	--with-libtirpc

autofs-install:
	$(INSTALL_DIR) $(IDIR_AUTOFS)/usr/bin
	$(INSTALL_BIN) $(WRKINST)/usr/bin/autofs \
		$(IDIR_AUTOFS)/usr/bin

include $(ADK_TOPDIR)/mk/pkg-bottom.mk
