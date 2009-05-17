# $Id$
#-
# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(TOPDIR)/rules.mk

PKG_NAME:=		openvpn
PKG_VERSION:=		2.0.9
PKG_RELEASE:=		7
PKG_MD5SUM:=		60745008b90b7dbe25fe8337c550fec6

MASTER_SITES:=		http://openvpn.net/release/ \
			${MASTER_SITE_SOURCEFORGE:=openvpn/}

include $(TOPDIR)/mk/package.mk

$(eval $(call PKG_template,OPENVPN,openvpn,$(PKG_VERSION)-$(PKG_RELEASE),$(ARCH)))
$(eval $(call PKG_template,OPENVPN_EASY_RSA,openvpn-easy-rsa,$(PKG_VERSION)-$(PKG_RELEASE),$(ARCH)))

PKG_DEPEND:="kmod-tun"

ifneq ($(ADK_COMPILE_OPENVPN_WITH_OPENSSL),y)
DISABLE_OPENSSL:=--disable-ssl --disable-crypto
else
PKG_DEPEND+=", libopenssl"
endif

ifneq ($(ADK_COMPILE_OPENVPN_WITH_LZO),y)
DISABLE_LZO:=--disable-lzo
else
PKG_DEPEND+=", liblzo"
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
	install -d -m0755 $(IDIR_OPENVPN)/usr/sbin
	$(CP) $(WRKINST)/usr/sbin/openvpn $(IDIR_OPENVPN)/usr/sbin/
	install -d -m0755 $(IDIR_OPENVPN)/etc/init.d
	$(CP) ./files/openvpn.init $(IDIR_OPENVPN)/etc/init.d/openvpn
	install -d -m0755 $(IDIR_OPENVPN)/etc/openvpn
	$(CP) ./files/openvpn.conf $(IDIR_OPENVPN)/etc/openvpn/
	echo "Depends: $(PKG_DEPEND)" >> $(IDIR_OPENVPN)/CONTROL/control
	# subpackage easy-rsa
	install -d -m0755 $(IDIR_OPENVPN_EASY_RSA)/usr/sbin
	install -d -m0755 $(IDIR_OPENVPN_EASY_RSA)/etc/easy-rsa/keys
	touch $(IDIR_OPENVPN_EASY_RSA)/etc/easy-rsa/keys/index.txt
	$(CP) ./files/serial $(IDIR_OPENVPN_EASY_RSA)/etc/easy-rsa/keys
	$(CP) $(WRKBUILD)/easy-rsa/2.0/{build-*,clean-all,inherit-inter,list-crl,pkitool,revoke-full,sign-req,whichopensslcnf} $(IDIR_OPENVPN_EASY_RSA)/usr/sbin
	install -m 0644 $(WRKBUILD)/easy-rsa/2.0/openssl.cnf $(IDIR_OPENVPN_EASY_RSA)/etc/easy-rsa/openssl.cnf
	install -m 0644 $(WRKBUILD)/easy-rsa/2.0/vars $(IDIR_OPENVPN_EASY_RSA)/etc/easy-rsa/vars

include ${TOPDIR}/mk/pkg-bottom.mk
