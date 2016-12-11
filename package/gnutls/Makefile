# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(ADK_TOPDIR)/rules.mk

PKG_NAME:=		gnutls
PKG_VERSION:=		3.4.17
PKG_RELEASE:=		1
PKG_HASH:=		9b50e8a670d5e950425d96935c7ddd415eb6f8079615a36df425f09a3143172e
PKG_DESCR:=		transport layer security library
PKG_SECTION:=		libs/crypto
PKG_DEPENDS:=		libgcrypt libtasn1 zlib libnettle libgmp
PKG_BUILDDEP:=		libgcrypt liblzo libtasn1 
PKG_BUILDDEP+=		zlib ncurses libnettle
PKG_URL:=		http://www.gnutls.org/
PKG_SITES:=		ftp://ftp.gnutls.org/gcrypt/gnutls/v3.4/
PKG_LIBNAME:=		libgnutls
PKG_OPTS:=		dev

PKG_SUBPKGS:=		LIBGNUTLS GNUTLS_UTILS LIBGNUTLS_EXTRA
PKGSD_GNUTLS_UTILS:=	transport layer security utilities
PKGSS_GNUTLS_UTILS:=	libgnutls libgnutls-extra
PKGSC_GNUTLS_UTILS:=	app/crypto
PKGSC_LIBGNUTLS:=	libs/crypto
PKGSC_LIBGNUTLS_EXTRA:=	libs/crypto

PKG_FLAVOURS_LIBGNUTLS:=	WITH_CRYPTODEV
PKGFD_WITH_CRYPTODEV:=		enable support for cryptodev-linux
PKGFB_WITH_CRYPTODEV:=		cryptodev-linux

include $(ADK_TOPDIR)/mk/package.mk

$(eval $(call PKG_template,LIBGNUTLS,libgnutls,$(PKG_VERSION)-$(PKG_RELEASE),$(PKG_DEPENDS),$(PKG_DESCR),$(PKGSC_LIBGNUTLS),$(PKG_OPTS)))
$(eval $(call PKG_template,GNUTLS_UTILS,gnutls-utils,$(PKG_VERSION)-$(PKG_RELEASE),$(PKGSS_GNUTLS_UTILS),$(PKGSD_GNUTLS_UTILS),$(PKGSC_GNUTLS_UTILS)))
$(eval $(call PKG_template,LIBGNUTLS_EXTRA,libgnutls-extra,$(PKG_VERSION)-$(PKG_RELEASE),$(PKG_DEPENDS),$(PKG_DESCR),$(PKGSC_LIBGNUTLS_EXTRA)))

ifneq ($(ADK_PACKAGE_LIBGNUTLS_WITH_CRYPTODEV),)
CONFIGURE_ARGS+= 	--enable-cryptodev
endif

TARGET_LDFLAGS+=	-pthread
CONFIGURE_ARGS+=	--disable-rpath \
			--disable-doc \
			--without-libz-prefix \
			--without-p11-kit
CONFIGURE_ENV+=		ac_cv_prog_AR='$(TARGET_CROSS)ar'

libgnutls-install:
	$(INSTALL_DIR) $(IDIR_LIBGNUTLS)/usr/lib
	$(CP) $(WRKINST)/usr/lib/libgnutls.so* $(IDIR_LIBGNUTLS)/usr/lib

libgnutls-extra-install:
	$(INSTALL_DIR) $(IDIR_LIBGNUTLS_EXTRA)/usr/lib
	$(CP) $(WRKINST)/usr/lib/libgnutlsxx.so* \
		$(IDIR_LIBGNUTLS_EXTRA)/usr/lib

gnutls-utils-install:
	$(INSTALL_DIR) $(IDIR_GNUTLS_UTILS)/usr/bin
	$(CP) $(WRKINST)/usr/bin/{{cert,srp,psk}tool,gnutls-{cli,serv}} \
	    $(IDIR_GNUTLS_UTILS)/usr/bin

include $(ADK_TOPDIR)/mk/pkg-bottom.mk
