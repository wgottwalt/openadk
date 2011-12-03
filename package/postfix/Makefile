# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(TOPDIR)/rules.mk

PKG_NAME:=		postfix
PKG_VERSION:=		2.8.7
PKG_RELEASE:=		1
PKG_MD5SUM:=		b3ff47a38db920fc15bb207f42da53db
PKG_DESCR:=		Postfix MTA
PKG_SECTION:=		mail
PKG_BUILDDEP:=		db
PKG_URL:=		http://www.postfix.org/
PKG_SITES:=		http://de.postfix.org/ftpmirror/official/

include $(TOPDIR)/mk/package.mk

$(eval $(call PKG_template,POSTFIX,postfix,$(PKG_VERSION)-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))

XAKE_FLAGS+=		GCC_HONOUR_COPTS=s
CONFIG_STYLE:=		manual
ALL_TARGET:=		

postfix-install:
	$(INSTALL_DIR) $(IDIR_POSTFIX)/usr/bin
	$(INSTALL_BIN) $(WRKINST)/usr/bin/postfix \
		$(IDIR_POSTFIX)/usr/bin

include ${TOPDIR}/mk/pkg-bottom.mk
