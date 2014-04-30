# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(TOPDIR)/rules.mk

PKG_NAME:=		libsecret
PKG_VERSION:=		0.16
PKG_RELEASE:=		1
PKG_MD5SUM:=		ab0edcd5887a6fe78c948e36b6341858
PKG_DESCR:=		library for storing and retrieving passwords
PKG_SECTION:=		libs
PKG_DEPENDS:=		libgcrypt
PKG_BUILDDEP:=		autotool libgcrypt
PKG_URL:=		https://wiki.gnome.org/Libsecret
PKG_SITES:=		https://git.gnome.org/browse/libsecret/snapshot/
PKG_OPTS:=		dev

include $(TOPDIR)/mk/package.mk

$(eval $(call PKG_template,LIBSECRET,libsecret,$(PKG_VERSION)-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION},${PKG_OPTS}))

AUTOTOOL_STYLE:=	autoreconf
CONFIGURE_ARGS+=	--enable-vala=no \
			--enable-gcrypt

libsecret-install:
	$(INSTALL_DIR) $(IDIR_LIBSECRET)/usr/lib
	$(CP) $(WRKINST)/usr/lib/libsecret*.so* \
		$(IDIR_LIBSECRET)/usr/lib

include ${TOPDIR}/mk/pkg-bottom.mk
