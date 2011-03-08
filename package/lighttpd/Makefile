# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(TOPDIR)/rules.mk

PKG_NAME:=		lighttpd
PKG_VERSION:=		1.4.28
PKG_RELEASE:=		2
PKG_MD5SUM:=		202d36efc6324adb95a3600d2826ec6a
PKG_DESCR:=		a lightweight web server
PKG_SECTION:=		www
PKG_DEPENDS:=		libpcre libxml2 libsqlite libopenssl
PKG_BUILDDEP:=		pcre libxml2 sqlite openssl
PKG_URL:=		http://www.lighttpd.net/
PKG_SITES:=		http://download.lighttpd.net/lighttpd/releases-1.4.x/
PKG_MULTI:=		1

PKG_SUBPKGS:=		LIGHTTPD LIGHTTPD_MOD_ACCESSLOG LIGHTTPD_MOD_ALIAS LIGHTTPD_MOD_AUTH
PKG_SUBPKGS+=		LIGHTTPD_MOD_CGI LIGHTTPD_MOD_EVASIVE LIGHTTPD_MOD_EXPIRE LIGHTTPD_MOD_FASTCGI
PKG_SUBPKGS+=		LIGHTTPD_MOD_PROXY LIGHTTPD_MOD_REDIRECT LIGHTTPD_MOD_REWRITE LIGHTTPD_MOD_SETENV
PKG_SUBPKGS+=		LIGHTTPD_MOD_SIMPLE_VHOST LIGHTTPD_MOD_SSI LIGHTTPD_MOD_STATUS LIGHTTPD_MOD_USERTRACK
PKG_SUBPKGS+=		LIGHTTPD_MOD_WEBDAV

include $(TOPDIR)/mk/package.mk

define PKG_mod_template

INSTALL_MODS_$${ADK_PACKAGE_${1}}+=	${2}-install

${2}-install:
	${INSTALL_DIR} $$(IDIR_$(1))/usr/lib/lighttpd
	${INSTALL_BIN} $(WRKINST)/usr/lib/lighttpd/mod_$(2).so $$(IDIR_$(1))/usr/lib/lighttpd/

endef

$(eval $(call PKG_template,LIGHTTPD,lighttpd,$(PKG_VERSION)-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))
$(eval $(call PKG_template,LIGHTTPD_MOD_ACCESSLOG,lighttpd-mod-accesslog,$(PKG_VERSION)-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))
$(eval $(call PKG_template,LIGHTTPD_MOD_ALIAS,lighttpd-mod-alias,$(PKG_VERSION)-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))
$(eval $(call PKG_template,LIGHTTPD_MOD_AUTH,lighttpd-mod-auth,$(PKG_VERSION)-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))
$(eval $(call PKG_template,LIGHTTPD_MOD_CGI,lighttpd-mod-cgi,$(PKG_VERSION)-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))
$(eval $(call PKG_template,LIGHTTPD_MOD_EVASIVE,lighttpd-mod-evasive,$(PKG_VERSION)-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))
$(eval $(call PKG_template,LIGHTTPD_MOD_EXPIRE,lighttpd-mod-expire,$(PKG_VERSION)-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))
$(eval $(call PKG_template,LIGHTTPD_MOD_FASTCGI,lighttpd-mod-fastcgi,$(PKG_VERSION)-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))
$(eval $(call PKG_template,LIGHTTPD_MOD_PROXY,lighttpd-mod-proxy,$(PKG_VERSION)-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))
$(eval $(call PKG_template,LIGHTTPD_MOD_REDIRECT,lighttpd-mod-redirect,$(PKG_VERSION)-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))
$(eval $(call PKG_template,LIGHTTPD_MOD_REWRITE,lighttpd-mod-rewrite,$(PKG_VERSION)-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))
$(eval $(call PKG_template,LIGHTTPD_MOD_SETENV,lighttpd-mod-setenv,$(PKG_VERSION)-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))
$(eval $(call PKG_template,LIGHTTPD_MOD_SIMPLE_VHOST,lighttpd-mod-simple-vhost,$(PKG_VERSION)-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))
$(eval $(call PKG_template,LIGHTTPD_MOD_SSI,lighttpd-mod-ssi,$(PKG_VERSION)-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))
$(eval $(call PKG_template,LIGHTTPD_MOD_STATUS,lighttpd-mod-status,$(PKG_VERSION)-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))
$(eval $(call PKG_template,LIGHTTPD_MOD_USERTRACK,lighttpd-mod-usertrack,$(PKG_VERSION)-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))
$(eval $(call PKG_template,LIGHTTPD_MOD_WEBDAV,lighttpd-mod-webdav,$(PKG_VERSION)-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))

$(eval $(call PKG_mod_template,LIGHTTPD_MOD_ACCESSLOG,accesslog))
$(eval $(call PKG_mod_template,LIGHTTPD_MOD_ALIAS,alias))
$(eval $(call PKG_mod_template,LIGHTTPD_MOD_AUTH,auth))
$(eval $(call PKG_mod_template,LIGHTTPD_MOD_CGI,cgi))
$(eval $(call PKG_mod_template,LIGHTTPD_MOD_EVASIVE,evasive))
$(eval $(call PKG_mod_template,LIGHTTPD_MOD_EXPIRE,expire))
$(eval $(call PKG_mod_template,LIGHTTPD_MOD_FASTCGI,fastcgi))
$(eval $(call PKG_mod_template,LIGHTTPD_MOD_PROXY,proxy))
$(eval $(call PKG_mod_template,LIGHTTPD_MOD_REDIRECT,redirect))
$(eval $(call PKG_mod_template,LIGHTTPD_MOD_REWRITE,rewrite))
$(eval $(call PKG_mod_template,LIGHTTPD_MOD_SETENV,setenv))
$(eval $(call PKG_mod_template,LIGHTTPD_MOD_SIMPLE_VHOST,simple_vhost))
$(eval $(call PKG_mod_template,LIGHTTPD_MOD_SSI,ssi))
$(eval $(call PKG_mod_template,LIGHTTPD_MOD_STATUS,status))
$(eval $(call PKG_mod_template,LIGHTTPD_MOD_USERTRACK,usertrack))
$(eval $(call PKG_mod_template,LIGHTTPD_MOD_WEBDAV,webdav))

TARGET_CPPFLAGS+=	-I$(STAGING_TARGET_DIR)/usr/include/libxml2
CONFIGURE_ENV+=		PCRE_LIB="-lpcre"
CONFIGURE_ARGS+=	--libdir=/usr/lib/lighttpd \
			--sysconfdir=/etc/lighttpd \
			--without-attr \
			--without-bzip2 \
			--without-fam \
			--without-gdbm \
			--without-ldap \
			--without-lua \
			--without-memcache \
			--without-mysql \
			--without-valgrind \
			--with-pcre \
			--with-webdav-props \
			--with-openssl='${STAGING_TARGET_DIR}/usr'

post-install: ${INSTALL_MODS_y} ${INSTALL_MODS_m}
	${INSTALL_DIR} $(IDIR_LIGHTTPD)/etc/lighttpd/conf.d
	${INSTALL_DATA} ./files/lighttpd.conf $(IDIR_LIGHTTPD)/etc/lighttpd
	${INSTALL_DATA} ./files/modules.conf $(IDIR_LIGHTTPD)/etc/lighttpd
	${CP} ${WRKBUILD}/doc/config/conf.d/*.conf \
		$(IDIR_LIGHTTPD)/etc/lighttpd/conf.d
	${INSTALL_DIR} $(IDIR_LIGHTTPD)/usr/lib/lighttpd
	for m in dirlisting indexfile staticfile; do \
		$(CP) $(WRKINST)/usr/lib/lighttpd/mod_$$m.so $(IDIR_LIGHTTPD)/usr/lib/lighttpd/ ; \
	done
	${INSTALL_DIR} $(IDIR_LIGHTTPD)/usr/sbin
	$(INSTALL_BIN) $(WRKINST)/usr/sbin/lighttpd $(IDIR_LIGHTTPD)/usr/sbin

include ${TOPDIR}/mk/pkg-bottom.mk
