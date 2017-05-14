# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(ADK_TOPDIR)/rules.mk

PKG_NAME:=		gpgme
PKG_VERSION:=		1.9.0
PKG_RELEASE:=		1
PKG_HASH:=		1b29fedb8bfad775e70eafac5b0590621683b2d9869db994568e6401f4034ceb
PKG_DESCR:=		easy access to gnupg for applications
PKG_SECTION:=		libs/crypto
PKG_DEPENDS:=		libgpg-error libassuan
PKG_BUILDDEP:=		libgpg-error libassuan
PKG_URL:=		https://gnupg.org/related_software/gpgme/index.html
PKG_SITES:=		https://gnupg.org/ftp/gcrypt/gpgme/
PKG_OPTS:=		dev

DISTFILES:=             $(PKG_NAME)-$(PKG_VERSION).tar.bz2

include $(ADK_TOPDIR)/mk/package.mk

$(eval $(call PKG_template,GPGME,gpgme,$(PKG_VERSION)-$(PKG_RELEASE),$(PKG_DEPENDS),$(PKG_DESCR),$(PKG_SECTION),$(PKG_OPTS)))

TARGET_CPPFLAGS+=	-D_FILE_OFFSET_BITS=64 -DLARGEFILE_SOURCE=1

gpgme-install:
	$(INSTALL_DIR) $(IDIR_GPGME)/usr/lib
	$(CP) $(WRKINST)/usr/lib/libgpgme*.so* \
		$(IDIR_GPGME)/usr/lib

include $(ADK_TOPDIR)/mk/pkg-bottom.mk
