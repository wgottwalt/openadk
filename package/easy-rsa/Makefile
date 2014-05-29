# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(TOPDIR)/rules.mk

PKG_NAME:=		easy-rsa
PKG_VERSION:=		2.0.2
PKG_RELEASE:=		1
PKG_MD5SUM:=		cd55a94b0785a0b1e1076b4dc018d531
PKG_DESCR:=		openssl ca scripts
PKG_SECTION:=		app/crypto
PKG_DEPENDS:=		openssl-util
PKG_URL:=		https://github.com/OpenVPN/easy-rsa
PKG_SITES:=		http://openadk.org/distfiles/

DISTFILES:=		${PKG_NAME}-${PKG_VERSION}.tar.gz

include $(TOPDIR)/mk/package.mk

$(eval $(call PKG_template,EASY_RSA,easy-rsa,$(PKG_VERSION)-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))

CONFIG_STYLE:=		manual
BUILD_STYLE:=		manual
INSTALL_STYLE:=		manual

easy-rsa-install:
	${INSTALL_DIR} $(IDIR_EASY_RSA)/usr/sbin \
		$(IDIR_EASY_RSA)/etc/easy-rsa/keys
	touch $(IDIR_EASY_RSA)/etc/easy-rsa/keys/index.txt
	$(CP) ./files/serial $(IDIR_EASY_RSA)/etc/easy-rsa/keys
	$(CP) $(WRKBUILD)/easy-rsa/2.0/{build-*,clean-all,inherit-inter,list-crl,pkitool,revoke-full,sign-req,whichopensslcnf} \
		$(IDIR_EASY_RSA)/usr/sbin
	${INSTALL_DATA} $(WRKBUILD)/easy-rsa/2.0/openssl-1.0.0.cnf \
		$(IDIR_EASY_RSA)/etc/easy-rsa/openssl.cnf
	${INSTALL_DATA} $(WRKBUILD)/easy-rsa/2.0/vars \
		$(IDIR_EASY_RSA)/etc/easy-rsa/vars

include ${TOPDIR}/mk/pkg-bottom.mk
