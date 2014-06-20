# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(TOPDIR)/rules.mk

PKG_NAME:=		sudo
PKG_VERSION:=		1.8.10
PKG_RELEASE:=		3
PKG_MD5SUM:=		954d64906c3f6e2436f33445a049c58b
PKG_DESCR:=		su do
PKG_SECTION:=		sys/misc
PKG_URL:=		http://www.courtesan.com/sudo/
PKG_SITES:=		http://www.courtesan.com/sudo/dist/

DISTFILES:=		${PKG_NAME}-${PKG_VERSION}.tar.gz

include $(TOPDIR)/mk/package.mk

$(eval $(call PKG_template,SUDO,sudo,$(PKG_VERSION)-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))

HOST_CPPFLAGS+=		-I../ -I../include
CONFIGURE_ARGS+=	--without-pam \
			--without-sendmail \
			--with-env-editor

ifeq ($(ADK_TARGET_USE_SSP),y)
CONFIGURE_ARGS+=	--enable-hardening
else
CONFIGURE_ARGS+=	--disable-hardening
endif

sudo-install:
	$(INSTALL_DIR) $(IDIR_SUDO)/usr/bin
	$(INSTALL_DIR) $(IDIR_SUDO)/usr/sbin
	$(INSTALL_DIR) $(IDIR_SUDO)/etc
	$(INSTALL_DATA) ./files/sudoers $(IDIR_SUDO)/etc
	chmod 440 $(IDIR_SUDO)/etc/sudoers
	$(INSTALL_BIN) $(WRKINST)/usr/bin/sudo \
		$(IDIR_SUDO)/usr/bin
	$(INSTALL_BIN) $(WRKINST)/usr/sbin/visudo \
		$(IDIR_SUDO)/usr/sbin

include ${TOPDIR}/mk/pkg-bottom.mk
