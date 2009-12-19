# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(TOPDIR)/rules.mk

PKG_NAME:=		lighttpd
PKG_VERSION:=		1.4.25
PKG_RELEASE:=		1
PKG_BUILDDEP+=		pcre libxml2 sqlite
ifeq (${ADK_COMPILE_LIGHTTPD_WITH_OPENSSL},y)
PKG_BUILDDEP+=		openssl
endif
PKG_MD5SUM:=		87e936ec272ddaba8a2fdfecd8c6b704
PKG_DESCR:=		a flexible and lightweight web server
PKG_SECTION:=		net
PKG_DEPENDS:=		libxml2 libsqlite libpcre
PKG_URL:=		http://www.lighttpd.net
PKG_SITES:=		http://download.lighttpd.net/lighttpd/releases-1.4.x/

include $(TOPDIR)/mk/package.mk

ifeq (${ADK_COMPILE_LIGHTTPD_WITH_OPENSSL},y)
PKG_DEPENDS+= 		libopenssl
endif

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

TCPPFLAGS+=		-I$(STAGING_DIR)/usr/include/libxml2
CONFIGURE_STYLE:=	gnu
CONFIGURE_ENV+=		PCRE_LIB="-lpcre"
CONFIGURE_ARGS+=	--without-openssl \
			--libdir=/usr/lib/lighttpd \
			--sysconfdir=/etc/lighttpd \
			--without-attr \
			--without-bzip2 \
			--without-fam \
			--without-gdbm \
			--without-ldap \
			--without-lua \
			--without-memcache \
			--without-mysql \
			--with-pcre \
			--without-valgrind \
			--with-webdav-props
BUILD_STYLE:=		auto
INSTALL_STYLE:=		auto
ifeq (${ADK_COMPILE_LIGHTTPD_WITH_OPENSSL},y)
CONFIGURE_ARGS+=	--with-openssl='${STAGING_DIR}/usr'
endif

post-install: ${INSTALL_MODS_y} ${INSTALL_MODS_m}
	install -m0755 -d $(IDIR_LIGHTTPD)/etc
	install -m0644 ./files/lighttpd.conf $(IDIR_LIGHTTPD)/etc/
	install -m0755 -d $(IDIR_LIGHTTPD)/usr/lib/lighttpd
	for m in dirlisting indexfile staticfile; do \
		$(CP) $(WRKINST)/usr/lib/lighttpd/mod_$$m.so $(IDIR_LIGHTTPD)/usr/lib/lighttpd/ ; \
	done
	install -m0755 -d $(IDIR_LIGHTTPD)/usr/sbin
	$(CP) $(WRKINST)/usr/sbin/lighttpd $(IDIR_LIGHTTPD)/usr/sbin/

include ${TOPDIR}/mk/pkg-bottom.mk
