# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(ADK_TOPDIR)/rules.mk

PKG_NAME:=		libgcrypt
PKG_VERSION:=		1.7.5
PKG_RELEASE:=		1
PKG_HASH:=		6b2a8234bf2d03a3cdd07936e44ab395d21a6c92279fd850764702215c9dc0a9
PKG_DESCR:=		crypto library
PKG_SECTION:=		libs/crypto
PKG_DEPENDS:=		libgpg-error
PKG_BUILDDEP:=		libgpg-error
PKG_URL:=		http://directory.fsf.org/project/libgcrypt
PKG_SITES:=		ftp://ftp.gnupg.org/gcrypt/libgcrypt/
PKG_OPTS:=		dev

DISTFILES:=             $(PKG_NAME)-$(PKG_VERSION).tar.gz

include $(ADK_TOPDIR)/mk/package.mk

$(eval $(call PKG_template,LIBGCRYPT,libgcrypt,$(PKG_VERSION)-$(PKG_RELEASE),$(PKG_DEPENDS),$(PKG_DESCR),$(PKG_SECTION),$(PKG_OPTS)))

CONFIGURE_ARGS+=	--disable-asm \
			--with-gpg-error-prefix="$(STAGING_TARGET_DIR)/usr"

libgcrypt-install:
	$(INSTALL_DIR) $(IDIR_LIBGCRYPT)/usr/lib
	$(CP) $(WRKINST)/usr/lib/libgcrypt.so* \
		$(IDIR_LIBGCRYPT)/usr/lib

post-install:
	# provides own automake macros
	$(INSTALL_DIR) $(STAGING_HOST_DIR)/usr/share/aclocal
	$(CP) $(WRKINST)/usr/share/aclocal/libgcrypt.m4 \
		$(STAGING_HOST_DIR)/usr/share/aclocal

include $(ADK_TOPDIR)/mk/pkg-bottom.mk
