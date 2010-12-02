# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(TOPDIR)/rules.mk

PKG_NAME:=		sudo
PKG_VERSION:=		1.7.4p4
PKG_RELEASE:=		1
PKG_MD5SUM:=		55d9906535d70a1de347cd3d3550ee87
PKG_DESCR:=		su do
PKG_SECTION:=		misc
PKG_URL:=		http://www.courtesan.com/sudo/
PKG_SITES:=		http://www.courtesan.com/sudo/dist/

include $(TOPDIR)/mk/package.mk

$(eval $(call PKG_template,SUDO,$(PKG_NAME),$(PKG_VERSION)-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))

CONFIGURE_ARGS+=	--without-pam \
			--with-timedir=/var/run

post-install:
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
