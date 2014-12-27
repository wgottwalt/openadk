# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(ADK_TOPDIR)/rules.mk

PKG_NAME:=		postfix
PKG_VERSION:=		2.11.0
PKG_RELEASE:=		1
PKG_HASH:=		ca1d9d32d5662678dc4e3f700cce82f5d7bed6a614852b17b1a5166936330c38
PKG_DESCR:=		popular mail transfer agent
PKG_SECTION:=		net/mail
PKG_BUILDDEP:=		tinycdb
PKG_URL:=		http://www.postfix.org/
PKG_SITES:=		http://de.postfix.org/ftpmirror/official/

DISTFILES:=		${PKG_NAME}-${PKG_VERSION}.tar.gz

PKG_HOST_DEPENDS:=	!darwin

include $(ADK_TOPDIR)/mk/package.mk

$(eval $(call PKG_template,POSTFIX,postfix,$(PKG_VERSION)-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))

XAKE_FLAGS+=		GCC_HONOUR_COPTS=s
CONFIG_STYLE:=		manual
ALL_TARGET:=		
INSTALL_STYLE:=		manual

do-configure:
	(cd $(WRKBUILD) && make -f Makefile.init makefiles "CCARGS=-DNO_PCRE -DNO_NIS -DNO_DB -DHAS_CDB -I$(STAGING_TARGET_DIR)/usr/include" "AUXLIBS=$(STAGING_TARGET_DIR)/usr/lib/libcdb.a")

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

include ${ADK_TOPDIR}/mk/pkg-bottom.mk
