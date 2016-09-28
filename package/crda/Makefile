# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(ADK_TOPDIR)/rules.mk

PKG_NAME:=		crda
PKG_VERSION:=		1.1.3
PKG_RELEASE:=		1
PKG_HASH:=		aa8a7fe92f0765986c421a5b6768a185375ac210393df0605ee132f6754825f0
PKG_DESCR:=		central regulatory domain agent for wireless networks
PKG_SECTION:=		net/wifi
PKG_DEPENDS:=		libnl
PKG_BUILDDEP:=		libnl
PKG_URL:=		http://wireless.kernel.org/en/developers/Regulatory
PKG_SITES:=		http://linuxwireless.org/download/crda/

DISTFILES:=             $(PKG_NAME)-$(PKG_VERSION).tar.bz2

PKG_FLAVOURS_CRDA:=	WITH_UDEV
PKGFD_WITH_UDEV:=	install shipped udev rules
PKGFS_WITH_UDEV:=	udev
PKGFB_WITH_UDEV:=	eudev

PKG_CHOICES_CRDA:=	WITH_LIBRESSL WITH_GCRYPT
PKGCD_WITH_LIBRESSL:=	ssl support via libressl library
PKGCB_WITH_LIBRESSL:=	libressl
PKGCS_WITH_LIBRESSL:=	libressl
PKGCD_WITH_GCRYPT:=	ssl support via gcrypt library
PKGCB_WITH_GCRYPT:=	libgcrypt
PKGCS_WITH_GCRYPT:=	libgcrypt

include $(ADK_TOPDIR)/mk/package.mk

$(eval $(call PKG_template,CRDA,crda,$(PKG_VERSION)-$(PKG_RELEASE),$(PKG_DEPENDS),$(PKG_DESCR),$(PKG_SECTION)))

CONFIG_STYLE:=		manual
ALL_TARGET:=		all_noverify

ifneq ($(ADK_PACKAGE_CRDA_WITH_LIBRESSL),)
XAKE_FLAGS+=		USE_OPENSSL=1
endif

crda-install:
	$(INSTALL_DIR) $(IDIR_CRDA)/usr/sbin
	$(INSTALL_BIN) $(WRKINST)/sbin/{crda,regdbdump} \
		$(IDIR_CRDA)/usr/sbin
ifneq ($(ADK_PACKAGE_CRDA_WITH_UDEV),)
	$(INSTALL_DIR) $(IDIR_CRDA)/lib/udev/rules.d
	$(INSTALL_DATA) $(WRKINST)/lib/udev/rules.d/85-regulatory.rules \
		$(IDIR_CRDA)/lib/udev/rules.d
endif

include $(ADK_TOPDIR)/mk/pkg-bottom.mk
