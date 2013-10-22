# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(TOPDIR)/rules.mk

PKG_NAME:=		rdesktop
PKG_VERSION:=		1.6.0
PKG_RELEASE:=		1
PKG_MD5SUM:=		c6fcbed7f0ad7e60ac5fcb2d324d8b16
PKG_DESCR:=		client for Windows Terminal Services
PKG_SECTION:=		net
PKG_BUILDDEP:=		libiconv openssl
PKG_URL:=		http://www.rdesktop.org/
PKG_SITES:=		${MASTER_SITE_SOURCEFORGE:=rdesktop/}

include $(TOPDIR)/mk/package.mk

$(eval $(call PKG_template,RDESKTOP,rdesktop,$(PKG_VERSION)-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))

CONFIGURE_ARGS+=	--with-openssl="${STAGING_TARGET_DIR}/usr"

rdesktop-install:
	$(INSTALL_DIR) $(IDIR_RDESKTOP)/usr/bin
	$(INSTALL_BIN) $(WRKINST)/usr/bin/rdesktop \
		$(IDIR_RDESKTOP)/usr/bin
	$(INSTALL_DIR) $(IDIR_RDESKTOP)/usr/share/rdesktop/keymaps
	${INSTALL_DATA} ${WRKINST}/usr/share/rdesktop/keymaps/* \
		$(IDIR_RDESKTOP)/usr/share/rdesktop/keymaps

include ${TOPDIR}/mk/pkg-bottom.mk
