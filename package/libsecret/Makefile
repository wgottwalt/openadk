# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(ADK_TOPDIR)/rules.mk

PKG_NAME:=		libsecret
PKG_VERSION:=		0.18
PKG_RELEASE:=		2
PKG_HASH:=		0c73aa762dbd1e38ba7b03de350e23ce818cb810b0784375e95ef61e004b02e3
PKG_DESCR:=		library for storing and retrieving passwords
PKG_SECTION:=		libs/crypto
PKG_DEPENDS:=		libgcrypt glib
PKG_BUILDDEP:=		intltool-host libgcrypt glib
PKG_NEEDS:=		intl
PKG_URL:=		https://wiki.gnome.org/Libsecret
PKG_SITES:=		http://ftp.gnome.org/pub/gnome/sources/libsecret/${PKG_VERSION}/
PKG_OPTS:=		dev

include $(ADK_TOPDIR)/mk/package.mk

$(eval $(call PKG_template,LIBSECRET,libsecret,$(PKG_VERSION)-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION},${PKG_OPTS}))

CONFIGURE_ARGS+=	--enable-vala=no \
			--disable-manpages \
			--enable-gcrypt

libsecret-install:
	$(INSTALL_DIR) $(IDIR_LIBSECRET)/usr/lib
	$(CP) $(WRKINST)/usr/lib/libsecret*.so* \
		$(IDIR_LIBSECRET)/usr/lib

include ${ADK_TOPDIR}/mk/pkg-bottom.mk
