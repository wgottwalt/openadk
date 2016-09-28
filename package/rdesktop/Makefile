# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(ADK_TOPDIR)/rules.mk

PKG_NAME:=		rdesktop
PKG_VERSION:=		1.8.1
PKG_RELEASE:=		1
PKG_HASH:=		76cc834b89c34d8332f3cb3889483b2ae4d4e8118eeb45a8967c77dd18228246
PKG_DESCR:=		client for windows terminal services
PKG_SECTION:=		x11/apps
PKG_DEPENDS:=		libsamplerate alsa-lib libao libressl
PKG_BUILDDEP:=		libsamplerate alsa-lib libao libressl
PKG_URL:=		http://www.rdesktop.org/
PKG_SITES:=		${MASTER_SITE_SOURCEFORGE:=rdesktop/}

DISTFILES:=		${PKG_NAME}-${PKG_VERSION}.tar.gz

include $(ADK_TOPDIR)/mk/package.mk

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

include ${ADK_TOPDIR}/mk/pkg-bottom.mk
