# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(TOPDIR)/rules.mk

PKG_NAME:=		rdesktop
PKG_VERSION:=		1.8.1
PKG_RELEASE:=		1
PKG_MD5SUM:=		f5382c5c85b0d2cc88b9b1aa9bbf1356
PKG_DESCR:=		client for windows terminal services
PKG_SECTION:=		x11/apps
PKG_DEPENDS:=		libsamplerate libopenssl alsa-lib libao
PKG_BUILDDEP:=		libiconv-tiny openssl libsamplerate alsa-lib libao
PKG_URL:=		http://www.rdesktop.org/
PKG_SITES:=		${MASTER_SITE_SOURCEFORGE:=rdesktop/}

DISTFILES:=		${PKG_NAME}-${PKG_VERSION}.tar.gz

include $(TOPDIR)/mk/package.mk

$(eval $(call PKG_template,RDESKTOP,rdesktop,$(PKG_VERSION)-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))

TARGET_CFLAGS+=		-D_GNU_SOURCE -D_POSIX_SOURCE
CONFIGURE_ARGS+=	--with-openssl="${STAGING_TARGET_DIR}/usr" \
			--disable-smartcard \
			--disable-credssp

rdesktop-install:
	$(INSTALL_DIR) $(IDIR_RDESKTOP)/usr/bin
	$(INSTALL_BIN) $(WRKINST)/usr/bin/rdesktop \
		$(IDIR_RDESKTOP)/usr/bin
	$(INSTALL_DIR) $(IDIR_RDESKTOP)/usr/share/rdesktop/keymaps
	${INSTALL_DATA} ${WRKINST}/usr/share/rdesktop/keymaps/* \
		$(IDIR_RDESKTOP)/usr/share/rdesktop/keymaps

include ${TOPDIR}/mk/pkg-bottom.mk
