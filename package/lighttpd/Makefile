# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(TOPDIR)/rules.mk

PKG_NAME:=		lighttpd
PKG_VERSION:=		1.4.35
PKG_RELEASE:=		1
PKG_MD5SUM:=		69057685df672218d45809539b874917
PKG_DESCR:=		a lightweight web server
PKG_SECTION:=		www
PKG_DEPENDS:=		libgcc
PKG_URL:=		http://www.lighttpd.net/
PKG_SITES:=		http://download.lighttpd.net/lighttpd/releases-1.4.x/
PKG_MULTI:=		1

PKG_FLAVOURS_LIGHTTPD:=	WITH_IPV6 WITH_SSL
PKGFD_WITH_IPV6:=	enable IPv6 support
PKGFD_WITH_SSL:=	enable SSL support
PKGFB_WITH_SSL:=	openssl
PKGFS_WITH_SSL:=	libopenssl

PKG_SUBPKGS:=		LIGHTTPD LIGHTTPD_MOD_ALIAS LIGHTTPD_MOD_AUTH
PKG_SUBPKGS+=		LIGHTTPD_MOD_CGI LIGHTTPD_MOD_DIRLISTING LIGHTTPD_MOD_EVASIVE LIGHTTPD_MOD_EXPIRE LIGHTTPD_MOD_FASTCGI
PKG_SUBPKGS+=		LIGHTTPD_MOD_PROXY LIGHTTPD_MOD_REDIRECT LIGHTTPD_MOD_REWRITE LIGHTTPD_MOD_SETENV
PKG_SUBPKGS+=		LIGHTTPD_MOD_SIMPLE_VHOST LIGHTTPD_MOD_SSI LIGHTTPD_MOD_STATUS LIGHTTPD_MOD_USERTRACK
PKG_SUBPKGS+=		LIGHTTPD_MOD_WEBDAV
PKGSD_LIGHTTPD_MOD_ALIAS:=	alias support
PKGSD_LIGHTTPD_MOD_AUTH:=	authentication support
PKGSD_LIGHTTPD_MOD_CGI:=	CGI support
PKGSD_LIGHTTPD_MOD_DIRLISTING:=	Dirlisting support
PKGSB_LIGHTTPD_MOD_DIRLISTING:=	pcre
PKGSS_LIGHTTPD_MOD_DIRLISTING:= libpcre
PKGSD_LIGHTTPD_MOD_EVASIVE:=	Evasive support
PKGSD_LIGHTTPD_MOD_EXPIRE:=	Expire support
PKGSD_LIGHTTPD_MOD_FASTCGI:=	FastCGI support
PKGSD_LIGHTTPD_MOD_PROXY:=	Proxy support
PKGSD_LIGHTTPD_MOD_REDIRECT:=	Redirect support
PKGSD_LIGHTTPD_MOD_REWRITE:=	Rewrite support
PKGSD_LIGHTTPD_MOD_SETENV:=	Setenv support
PKGSD_LIGHTTPD_MOD_SIMPLE_VHOST:= 	Simple Vhost support
PKGSD_LIGHTTPD_MOD_SSI:=	SSI support
PKGSD_LIGHTTPD_MOD_STATUS:=	Status support
PKGSD_LIGHTTPD_MOD_USERTRACK:=	Usertracking support
PKGSD_LIGHTTPD_MOD_WEBDAV:=	Webdav support
PKGSB_LIGHTTPD_MOD_WEBDAV:=	libxml2 sqlite
PKGSS_LIGHTTPD_MOD_WEBDAV:=	libxml2 libsqlite

include $(TOPDIR)/mk/package.mk

define PKG_mod_template

INSTALL_MODS_$${ADK_PACKAGE_${1}}+=	${2}-install

${2}-install:
	${INSTALL_DIR} $$(IDIR_$(1))/usr/lib/lighttpd
	${INSTALL_BIN} $(WRKINST)/usr/lib/lighttpd/mod_$(2).so $$(IDIR_$(1))/usr/lib/lighttpd/

endef

$(eval $(call PKG_template,LIGHTTPD,lighttpd,$(PKG_VERSION)-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))
$(eval $(call PKG_template,LIGHTTPD_MOD_ALIAS,lighttpd-mod-alias,$(PKG_VERSION)-${PKG_RELEASE},${PKG_DEPENDS},${PKGSD_LIGHTTPD_MOD_ALIAS},${PKG_SECTION}))
$(eval $(call PKG_template,LIGHTTPD_MOD_AUTH,lighttpd-mod-auth,$(PKG_VERSION)-${PKG_RELEASE},${PKG_DEPENDS},${PKGSD_LIGHTTPD_MOD_AUTH},${PKG_SECTION}))
$(eval $(call PKG_template,LIGHTTPD_MOD_CGI,lighttpd-mod-cgi,$(PKG_VERSION)-${PKG_RELEASE},${PKG_DEPENDS},${PKGSD_LIGHTTPD_MOD_CGI},${PKG_SECTION}))
$(eval $(call PKG_template,LIGHTTPD_MOD_DIRLISTING,lighttpd-mod-dirlisting,$(PKG_VERSION)-${PKG_RELEASE},${PKG_DEPENDS},${PKGSD_LIGHTTPD_MOD_DIRLISTING},${PKG_SECTION}))
$(eval $(call PKG_template,LIGHTTPD_MOD_EVASIVE,lighttpd-mod-evasive,$(PKG_VERSION)-${PKG_RELEASE},${PKG_DEPENDS},${PKGSD_LIGHTTPD_MOD_EVASIVE},${PKG_SECTION}))
$(eval $(call PKG_template,LIGHTTPD_MOD_EXPIRE,lighttpd-mod-expire,$(PKG_VERSION)-${PKG_RELEASE},${PKG_DEPENDS},${PKGSD_LIGHTTPD_MOD_EXPIRE},${PKG_SECTION}))
$(eval $(call PKG_template,LIGHTTPD_MOD_FASTCGI,lighttpd-mod-fastcgi,$(PKG_VERSION)-${PKG_RELEASE},${PKG_DEPENDS},${PKGSD_LIGHTTPD_MOD_FASTCGI},${PKG_SECTION}))
$(eval $(call PKG_template,LIGHTTPD_MOD_PROXY,lighttpd-mod-proxy,$(PKG_VERSION)-${PKG_RELEASE},${PKG_DEPENDS},${PKGSD_LIGHTTPD_MOD_PROXY},${PKG_SECTION}))
$(eval $(call PKG_template,LIGHTTPD_MOD_REDIRECT,lighttpd-mod-redirect,$(PKG_VERSION)-${PKG_RELEASE},${PKG_DEPENDS},${PKGSD_LIGHTTPD_MOD_REDIRECT},${PKG_SECTION}))
$(eval $(call PKG_template,LIGHTTPD_MOD_REWRITE,lighttpd-mod-rewrite,$(PKG_VERSION)-${PKG_RELEASE},${PKG_DEPENDS},${PKGSD_LIGHTTPD_MOD_REWRITE},${PKG_SECTION}))
$(eval $(call PKG_template,LIGHTTPD_MOD_SETENV,lighttpd-mod-setenv,$(PKG_VERSION)-${PKG_RELEASE},${PKG_DEPENDS},${PKGSD_LIGHTTPD_MOD_SETENV},${PKG_SECTION}))
$(eval $(call PKG_template,LIGHTTPD_MOD_SIMPLE_VHOST,lighttpd-mod-simple-vhost,$(PKG_VERSION)-${PKG_RELEASE},${PKG_DEPENDS},${PKGSD_LIGHTTPD_MOD_SIMPLE_VHOST},${PKG_SECTION}))
$(eval $(call PKG_template,LIGHTTPD_MOD_SSI,lighttpd-mod-ssi,$(PKG_VERSION)-${PKG_RELEASE},${PKG_DEPENDS},${PKGSD_LIGHTTPD_MOD_SSI},${PKG_SECTION}))
$(eval $(call PKG_template,LIGHTTPD_MOD_STATUS,lighttpd-mod-status,$(PKG_VERSION)-${PKG_RELEASE},${PKG_DEPENDS},${PKGSD_LIGHTTPD_MOD_STATUS},${PKG_SECTION}))
$(eval $(call PKG_template,LIGHTTPD_MOD_USERTRACK,lighttpd-mod-usertrack,$(PKG_VERSION)-${PKG_RELEASE},${PKG_DEPENDS},${PKGSD_LIGHTTPD_MOD_USERTRACK},${PKG_SECTION}))
$(eval $(call PKG_template,LIGHTTPD_MOD_WEBDAV,lighttpd-mod-webdav,$(PKG_VERSION)-${PKG_RELEASE},${PKG_DEPENDS},${PKGSD_LIGHTTPD_MOD_WEBDAV},${PKG_SECTION}))

$(eval $(call PKG_mod_template,LIGHTTPD_MOD_ALIAS,alias))
$(eval $(call PKG_mod_template,LIGHTTPD_MOD_AUTH,auth))
$(eval $(call PKG_mod_template,LIGHTTPD_MOD_CGI,cgi))
$(eval $(call PKG_mod_template,LIGHTTPD_MOD_DIRLISTING,dirlisting))
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

#TARGET_CPPFLAGS+=	-I$(STAGING_TARGET_DIR)/usr/include/libxml2
CONFIGURE_ARGS+=	--libdir=/usr/lib/lighttpd \
			--sysconfdir=/etc/lighttpd \
			--without-attr \
			--without-zlib \
			--without-bzip2 \
			--without-fam \
			--without-gdbm \
			--without-ldap \
			--without-lua \
			--without-memcache \
			--without-mysql \
			--without-valgrind

ifneq ($(ADK_PACKAGE_LIGHTTPD_MOD_WEBDAV),)
CONFIGURE_ARGS+=	--with-webdav-props \
			--with-webdav-locks
else
CONFIGURE_ARGS+=	--without-webdav-props \
			--without-webdav-locks
endif

ifneq ($(ADK_PACKAGE_LIGHTTPD_MOD_SSI)$(ADK_PACKAGE_LIGHTTPD_MOD_DIRLISTING)$(ADK_PACKAGE_LIGHTTPD_MOD_REWRITE)$(ADK_PACKAGE_LIGHTTPD_MOD_REDIRECT),)
CONFIGURE_ARGS+=	--with-pcre
CONFIGURE_ENV+=		PCRE_LIB="-lpcre"
else
CONFIGURE_ARGS+=	--without-pcre
endif

ifneq ($(ADK_PACKAGE_LIGHTTPD_WITH_IPV6),)
CONFIGURE_ARGS+=	--enable-ipv6
else
CONFIGURE_ARGS+=	--disable-ipv6
endif
ifneq ($(ADK_PACKAGE_LIGHTTPD_WITH_SSL),)
CONFIGURE_ARGS+=	--with-openssl
else
CONFIGURE_ARGS+=	--without-openssl
endif


post-install: ${INSTALL_MODS_y} ${INSTALL_MODS_m}
	${INSTALL_DIR} $(IDIR_LIGHTTPD)/etc/lighttpd/conf.d
	${INSTALL_DATA} ./files/lighttpd.conf $(IDIR_LIGHTTPD)/etc/lighttpd
	${INSTALL_DATA} ./files/modules.conf $(IDIR_LIGHTTPD)/etc/lighttpd
	${CP} ./files/conf.d $(IDIR_LIGHTTPD)/etc/lighttpd
	${CP} ${WRKBUILD}/doc/config/conf.d/*.conf \
		$(IDIR_LIGHTTPD)/etc/lighttpd/conf.d
	${INSTALL_DIR} $(IDIR_LIGHTTPD)/usr/lib/lighttpd
	for m in indexfile staticfile accesslog; do \
		$(CP) $(WRKINST)/usr/lib/lighttpd/mod_$$m.so $(IDIR_LIGHTTPD)/usr/lib/lighttpd/ ; \
	done
	${INSTALL_DIR} $(IDIR_LIGHTTPD)/usr/sbin
	$(INSTALL_BIN) $(WRKINST)/usr/sbin/lighttpd $(IDIR_LIGHTTPD)/usr/sbin

include ${TOPDIR}/mk/pkg-bottom.mk
