# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(TOPDIR)/rules.mk

PKG_NAME:=		libsecret
PKG_VERSION:=		0.18
PKG_RELEASE:=		1
PKG_MD5SUM:=		279d723cd005e80d1d304f74a3488acc
PKG_DESCR:=		library for storing and retrieving passwords
PKG_SECTION:=		libs
PKG_DEPENDS:=		libgcrypt glib
PKG_BUILDDEP:=		intltool-host gettext-tiny libgcrypt glib
PKG_URL:=		https://wiki.gnome.org/Libsecret
PKG_SITES:=		http://ftp.gnome.org/pub/gnome/sources/libsecret/${PKG_VERSION}/
PKG_OPTS:=		dev

include $(TOPDIR)/mk/package.mk

$(eval $(call PKG_template,LIBSECRET,libsecret,$(PKG_VERSION)-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION},${PKG_OPTS}))

CONFIGURE_ARGS+=	--enable-vala=no \
			--enable-gcrypt

libsecret-install:
	$(INSTALL_DIR) $(IDIR_LIBSECRET)/usr/lib
	$(CP) $(WRKINST)/usr/lib/libsecret*.so* \
		$(IDIR_LIBSECRET)/usr/lib

include ${TOPDIR}/mk/pkg-bottom.mk
