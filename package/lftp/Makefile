# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(ADK_TOPDIR)/rules.mk

PKG_NAME:=		lftp
PKG_VERSION:=		4.6.2
PKG_RELEASE:=		1
PKG_HASH:=		1e61d5c94b06c333309185e86cfce0729e45e3f69f7496c58d61093b135c8bb9
PKG_DESCR:=		ftp and http client
PKG_SECTION:=		net/http
PKG_DEPENDS:=		libncurses libexpat libstdcxx
PKG_DEPENDS+=		zlib libreadline
PKG_BUILDDEP:=		ncurses expat readline zlib
PKG_URL:=		http://lftp.yar.ru/
PKG_SITES:=		http://lftp.yar.ru/ftp/

PKG_CHOICES_LFTP:=	WITHOUT_SSL WITH_GNUTLS WITH_LIBRESSL WITH_OPENSSL
PKGCD_WITHOUT_SSL:=	use no ssl
PKGCD_WITH_OPENSSL:=	use openssl for crypto
PKGCS_WITH_OPENSSL:=	libopenssl ca-certificates
PKGCB_WITH_OPENSSL:=	openssl
PKGCD_WITH_LIBRESSL:=	use libressl for crypto
PKGCS_WITH_LIBRESSL:=	libressl ca-certificates
PKGCB_WITH_LIBRESSL:=	libressl
PKGCD_WITH_GNUTLS:=	use gnutls for crypto
PKGCS_WITH_GNUTLS:=	libgnutls ca-certificates
PKGCB_WITH_GNUTLS:=	gnutls

include $(ADK_TOPDIR)/mk/package.mk

$(eval $(call PKG_template,LFTP,lftp,$(PKG_VERSION)-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))

ifeq (${ADK_PACKAGE_LFTP_WITHOUT_SSL},y)
CONFIGURE_ARGS+=	--without-openssl \
			--without-gnutls
endif
ifeq (${ADK_PACKAGE_LFTP_WITH_GNUTLS},y)
CONFIGURE_ARGS+=	--without-openssl \
			--with-gnutls
endif
ifeq (${ADK_PACKAGE_LFTP_WITH_OPENSSL},y)
CONFIGURE_ARGS+=	--with-openssl \
			--without-gnutls
endif
ifeq (${ADK_PACKAGE_LFTP_WITH_LIBRESSL},y)
CONFIGURE_ARGS+=	--with-openssl \
			--without-gnutls
endif

lftp-install:
	$(INSTALL_DIR) $(IDIR_LFTP)/usr/bin
	$(INSTALL_BIN) $(WRKINST)/usr/bin/lftp \
		$(IDIR_LFTP)/usr/bin

include ${ADK_TOPDIR}/mk/pkg-bottom.mk
