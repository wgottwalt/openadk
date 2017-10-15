# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(ADK_TOPDIR)/rules.mk

PKG_NAME:=		clamav
PKG_VERSION:=		0.99.2
PKG_RELEASE:=		1
PKG_HASH:=		167bd6a13e05ece326b968fdb539b05c2ffcfef6018a274a10aeda85c2c0027a
PKG_DESCR:=		anti-virus software
PKG_SECTION:=		sys/misc
PKG_DEPENDS:=		libressl zlib libpcre
PKG_BUILDDEP:=		libressl zlib pcre
PKG_NEEDS:=		threads
PKG_URL:=		http://www.clamav.net/
PKG_SITES:=		http://www.clamav.net/downloads/production/

DISTFILES:=             $(PKG_NAME)-$(PKG_VERSION).tar.gz

include $(ADK_TOPDIR)/mk/package.mk

$(eval $(call PKG_template,CLAMAV,clamav,$(PKG_VERSION)-$(PKG_RELEASE),$(PKG_DEPENDS),$(PKG_DESCR),$(PKG_SECTION),$(PKG_OPTS)))

TARGET_LDFLAGS+=	-ltinfo
CONFIGURE_ENV+=		ac_cv_c_mmap_private=yes
CONFIGURE_ARGS+=	--enable-mempool \
			--disable-xml \
			--disable-check \
			--with-openssl="$(STAGING_TARGET_DIR)/usr" \
			--with-pcre="$(STAGING_TARGET_DIR)/usr"

clamav-install:
	$(INSTALL_DIR) $(IDIR_CLAMAV)/etc
	$(CP) $(WRKINST)/etc/* \
		$(IDIR_CLAMAV)/etc
	$(INSTALL_DIR) $(IDIR_CLAMAV)/usr/lib
	$(CP) $(WRKINST)/usr/lib*/lib*.so* \
		$(IDIR_CLAMAV)/usr/lib
	$(INSTALL_DIR) $(IDIR_CLAMAV)/usr/bin
	$(INSTALL_BIN) $(WRKINST)/usr/bin/* \
		$(IDIR_CLAMAV)/usr/bin
	$(INSTALL_DIR) $(IDIR_CLAMAV)/usr/sbin
	$(INSTALL_BIN) $(WRKINST)/usr/sbin/clamd \
		$(IDIR_CLAMAV)/usr/sbin

include $(ADK_TOPDIR)/mk/pkg-bottom.mk
