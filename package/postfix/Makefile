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
PKG_DEPENDS:=		libdb
PKG_URL:=		http://www.postfix.org/
PKG_SITES:=		http://de.postfix.org/ftpmirror/official/

PKG_HOST_DEPENDS:=	!darwin

include $(TOPDIR)/mk/package.mk

$(eval $(call PKG_template,POSTFIX,postfix,$(PKG_VERSION)-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))

XAKE_FLAGS+=		GCC_HONOUR_COPTS=s
CONFIG_STYLE:=		manual
ALL_TARGET:=		
INSTALL_STYLE:=		manual

postfix-install:
	$(INSTALL_DIR) $(IDIR_POSTFIX)/etc/postfix
	$(CP) $(WRKBUILD)/conf/* $(IDIR_POSTFIX)/etc/postfix
	$(CP) ./files/main.cf $(IDIR_POSTFIX)/etc/postfix
	$(INSTALL_DIR) $(IDIR_POSTFIX)/usr/sbin
	$(CP) $(WRKBUILD)/bin/* $(IDIR_POSTFIX)/usr/sbin
	$(INSTALL_DIR) $(IDIR_POSTFIX)/usr/libexec/postfix
	$(CP) $(WRKBUILD)/libexec/* $(IDIR_POSTFIX)/usr/libexec/postfix
	rm $(IDIR_POSTFIX)/usr/libexec/postfix/master.cf
	rm $(IDIR_POSTFIX)/usr/libexec/postfix/main.cf
	rm $(IDIR_POSTFIX)/usr/libexec/postfix/postfix-script
	mv $(IDIR_POSTFIX)/etc/postfix/postfix-script \
		$(IDIR_POSTFIX)/usr/libexec/postfix/
	rm $(IDIR_POSTFIX)/usr/libexec/postfix/postfix-files
	mv $(IDIR_POSTFIX)/etc/postfix/postfix-files \
		$(IDIR_POSTFIX)/usr/libexec/postfix/
	rm $(IDIR_POSTFIX)/usr/libexec/postfix/post-install
	mv $(IDIR_POSTFIX)/etc/postfix/post-install \
		$(IDIR_POSTFIX)/usr/libexec/postfix/
	rm $(IDIR_POSTFIX)/usr/libexec/postfix/postfix-wrapper
	mv $(IDIR_POSTFIX)/etc/postfix/postfix-wrapper \
		$(IDIR_POSTFIX)/usr/libexec/postfix/
	rm $(IDIR_POSTFIX)/usr/libexec/postfix/postmulti-script
	mv $(IDIR_POSTFIX)/etc/postfix/postmulti-script \
		$(IDIR_POSTFIX)/usr/libexec/postfix/
	chmod 755 $(IDIR_POSTFIX)/usr/libexec/postfix/*

include ${TOPDIR}/mk/pkg-bottom.mk
