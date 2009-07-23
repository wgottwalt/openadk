# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(TOPDIR)/rules.mk

PKG_NAME:=		openvpn
PKG_VERSION:=		2.1_rc19
PKG_RELEASE:=		1
PKG_MD5SUM:=		ba2ee667a8b7606b125b7d32f47ca578
PKG_DESCR:=		Open Source VPN solution using SSL
PKG_SECTION:=		net
PKG_DEPENDS:=		kmod-tun
PKG_URL:=		http://openvpn.net
PKG_SITES:=		http://openvpn.net/release/ \
			${MASTER_SITE_SOURCEFORGE:=openvpn/}

include $(TOPDIR)/mk/package.mk

ifeq ($(ADK_COMPILE_OPENVPN_WITH_OPENSSL),y)
PKG_DEPENDS+=		libopenssl
endif

ifneq ($(ADK_COMPILE_OPENVPN_WITH_LZO),y)
PKG_DEPENDS+=		liblzo
endif

$(eval $(call PKG_template,OPENVPN,${PKG_NAME},$(PKG_VERSION)-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))
$(eval $(call PKG_template,OPENVPN_EASY_RSA,openvpn-easy-rsa,$(PKG_VERSION)-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))

ifneq ($(ADK_COMPILE_OPENVPN_WITH_OPENSSL),y)
DISABLE_OPENSSL:=--disable-ssl --disable-crypto
endif

ifneq ($(ADK_COMPILE_OPENVPN_WITH_LZO),y)
DISABLE_LZO:=--disable-lzo
endif

ifneq ($(ADK_COMPILE_OPENVPN_WITH_SERVER),y)
DISABLE_SERVER:=--disable-server
endif

ifneq ($(ADK_COMPILE_OPENVPN_WITH_HTTP),y)
DISABLE_HTTP:=--disable-http
endif
ifeq ($(ADK_COMPILE_OPENVPN_WITH_PASSWORD_SAVE),y)
ENABLE_PASSWORD_SAVE:=--enable-password-save
endif
ifeq ($(ADK_COMPILE_OPENVPN_WITH_SMALL),y)
ENABLE_SMALL:=--enable-small
endif

CONFIGURE_STYLE=	gnu
CONFIGURE_ENV+=		CPPFLAGS="-I$(STAGING_DIR)/usr/include" \
			LDFLAGS="-L$(STAGING_DIR)/usr/lib"
CONFIGURE_ARGS+=	--disable-pthread \
			--disable-plugins \
			--disable-management \
			--disable-socks \
			--enable-iproute2 \
			--with-iproute-path=ip \
			--without-ifconfig-path \
			--without-route-path \
			$(DISABLE_LZO) \
			$(DISABLE_OPENSSL) \
			$(DISABLE_SERVER) \
			$(DISABLE_HTTP) \
			$(ENABLE_PASSWORD_SAVE) \
			$(ENABLE_SMALL)
BUILD_STYLE=		auto
INSTALL_STYLE=		auto

post-install:
	# main package
	${INSTALL_DIR} $(IDIR_OPENVPN)/usr/sbin $(IDIR_OPENVPN)/etc/openvpn
	${INSTALL_BIN} $(WRKINST)/usr/sbin/openvpn $(IDIR_OPENVPN)/usr/sbin/
	$(CP) ./files/openvpn.conf $(IDIR_OPENVPN)/etc/openvpn/
	# subpackage easy-rsa
	${INSTALL_DIR} $(IDIR_OPENVPN_EASY_RSA)/usr/sbin $(IDIR_OPENVPN_EASY_RSA)/etc/easy-rsa/keys
	touch $(IDIR_OPENVPN_EASY_RSA)/etc/easy-rsa/keys/index.txt
	$(CP) ./files/serial $(IDIR_OPENVPN_EASY_RSA)/etc/easy-rsa/keys
	$(CP) $(WRKBUILD)/easy-rsa/2.0/{build-*,clean-all,inherit-inter,list-crl,pkitool,revoke-full,sign-req,whichopensslcnf} \
		$(IDIR_OPENVPN_EASY_RSA)/usr/sbin
	${INSTALL_DATA} $(WRKBUILD)/easy-rsa/2.0/openssl.cnf $(IDIR_OPENVPN_EASY_RSA)/etc/easy-rsa/openssl.cnf
	${INSTALL_DATA} $(WRKBUILD)/easy-rsa/2.0/vars $(IDIR_OPENVPN_EASY_RSA)/etc/easy-rsa/vars

include ${TOPDIR}/mk/pkg-bottom.mk
