# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(TOPDIR)/rules.mk

PKG_NAME:=		php
PKG_VERSION:=		5.3.2
PKG_RELEASE:=		1
PKG_MD5SUM:=		4480d7c6d6b4a86de7b8ec8f0c2d1871
PKG_DESCR:=		PHP CLI
PKG_SECTION:=		lang
PKG_MULTI:=		1
PKG_DEPENDS:=		libopenssl zlib
PKG_BUILDDEP+=		openssl zlib
ifneq ($(ADK_PACKAGE_PHP_MOD_CURL),)
PKG_BUILDDEP+=		curl
endif
ifneq ($(ADK_PACKAGE_PHP_MOD_GD),)
PKG_BUILDDEP+=		libgd libpng
endif
ifneq ($(ADK_PACKAGE_PHP_MOD_GMP),)
PKG_BUILDDEP+=		gmp
endif
ifneq ($(ADK_PACKAGE_PHP_MOD_LDAP),)
PKG_BUILDDEP+=		openldap
endif
ifneq ($(ADK_PACKAGE_PHP_MOD_MYSQL),)
PKG_BUILDDEP+=		mysql
endif
ifneq ($(ADK_PACKAGE_PHP_MOD_PCRE),)
PKG_BUILDDEP+=		pcre
endif
ifneq ($(ADK_PACKAGE_PHP_MOD_PGSQL),)
PKG_BUILDDEP+=		postgresql
endif
ifneq ($(ADK_PACKAGE_PHP_MOD_SQLITE),)
PKG_BUILDDEP+=		sqlite
endif
ifneq ($(ADK_PACKAGE_PHP_MOD_XML),)
PKG_BUILDDEP+=		expat
endif
PHP_URL:=		http://www.php.net
PKG_SITES:=		http://de.php.net/distributions/

PKG_DESCR_FCGI:=	PHP for FastCGI usage

PKG_HOST_DEPENDS:=	!cygwin

# FIX PKG_DEPENDS

include $(TOPDIR)/mk/package.mk

$(eval $(call PKG_template,PHP,php,${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))
$(eval $(call PKG_template,PHP_CLI,php-cli,${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))
$(eval $(call PKG_template,PHP_FASTCGI,php-fastcgi,${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR_FCGI},${PKG_SECTION}))

define PKG_mod_template

INSTALL_MODS_$${ADK_PACKAGE_${1}}+=    ${2}-install

${2}-install:
	${INSTALL_DIR} $$(IDIR_$(1))/usr/lib/php
	${INSTALL_DATA} $(WRKBUILD)/modules/$(2).so $$(IDIR_$(1))/usr/lib/php

endef

PKG_CONFIGURE_OPTS:=	\
	--without-pear \
	--disable-spl \
	--with-config-file-path=/etc \
	--enable-magic-quotes \
	--disable-short-tags \
	--disable-ctype \
	--disable-dom \
	--enable-ftp=shared \
	--without-gettext \
	--without-iconv \
	--disable-libxml \
	--without-libxml-dir \
	--disable-mbstring \
	--disable-mbregex \
	--disable-phar \
	--with-openssl=shared,"$(STAGING_DIR)/usr" \
	--with-kerberos=no \
	--with-openssl-dir="$(STAGING_DIR)/usr" \
	--enable-session=shared \
	--disable-simplexml \
	--disable-soap \
	--disable-fileinfo \
	--enable-sockets=shared \
	--disable-tokenizer \
	--disable-filter \
	--disable-xmlreader \
	--disable-xmlwriter \
	--with-zlib="$(STAGING_DIR)/usr" \
	--with-zlib-dir="$(STAGING_DIR)/usr" \
	--enable-cli \
	--enable-cgi \
	--enable-fastcgi \
	--enable-force-cgi-redirect \
	--enable-discard-path \

ifneq ($(ADK_PACKAGE_PHP_MOD_CURL),)
PKG_CONFIGURE_OPTS+=	--with-curl=shared,"$(STAGING_DIR)/usr"
else
PKG_CONFIGURE_OPTS+=	--without-curl
endif
ifneq ($(ADK_PACKAGE_PHP_MOD_GD),)
PKG_CONFIGURE_OPTS+=	--with-gd=shared,"$(STAGING_DIR)/usr" \
	--without-freetype-dir \
	--with-jpeg-dir="$(STAGING_DIR)/usr" \
	--with-png-dir="$(STAGING_DIR)/usr" \
	--without-xpm-dir \
	--without-ttf \
	--without-t1lib	\
	--enable-gd-native-ttf \
	--disable-gd-jis-conv
else
PKG_CONFIGURE_OPTS+=	--without-gd
endif
ifneq ($(ADK_PACKAGE_PHP_MOD_GMP),)
PKG_CONFIGURE_OPTS+=	--with-gmp=shared,"$(STAGING_DIR)/usr"
else
PKG_CONFIGURE_OPTS+=	--without-gmp
endif
ifneq ($(ADK_PACKAGE_PHP_MOD_LDAP),)
PKG_CONFIGURE_OPTS+=	--with-ldap=shared,"$(STAGING_DIR)/usr" \
	--with-ldap-sasl="$(STAGING_DIR)/usr"
else
PKG_CONFIGURE_OPTS+=	--without-ldap
endif
ifneq ($(ADK_PACKAGE_PHP_MOD_MYSQL),)
PKG_CONFIGURE_OPTS+=	--with-mysql=shared,"$(STAGING_DIR)/usr"
else
PKG_CONFIGURE_OPTS+=	--without-mysql
endif
ifneq ($(ADK_PACKAGE_PHP_MOD_PCRE),)
PKG_CONFIGURE_OPTS+=	--with-pcre-dir=shared,"$(STAGING_DIR)/usr"
else
PKG_CONFIGURE_OPTS+=	--without-pcre-dir
endif
ifneq ($(ADK_PACKAGE_PHP_MOD_PGSQL),)
PKG_CONFIGURE_OPTS+=	--with-pgsql=shared,"$(STAGING_DIR)/usr"
else
PKG_CONFIGURE_OPTS+=	--without-pgsql
endif
ifneq ($(ADK_PACKAGE_PHP_MOD_SQLITE),)
PKG_CONFIGURE_OPTS+=	--without-sqlite
PKG_CONFIGURE_OPTS+=	--with-pdo-sqlite=shared,"$(STAGING_DIR)/usr"
PKG_CONFIGURE_OPTS+=	--enable-pdo=shared
else
PKG_CONFIGURE_OPTS+=	--without-sqlite
endif
ifneq ($(ADK_PACKAGE_PHP_MOD_XML),)
PKG_CONFIGURE_OPTS+=	--enable-xml=shared,"$(STAGING_DIR)/usr" \
	--with-libexpat-dir="$(STAGING_DIR)/usr"
else
PKG_CONFIGURE_OPTS+=	--disable-xml
endif

$(eval $(call PKG_template,PHP_MOD_CURL,php-mod-curl,$(PKG_VERSION)-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))
$(eval $(call PKG_template,PHP_MOD_FTP,php-mod-ftp,$(PKG_VERSION)-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))
$(eval $(call PKG_template,PHP_MOD_GD,php-mod-gd,$(PKG_VERSION)-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))
$(eval $(call PKG_template,PHP_MOD_GMP,php-mod-gmp,$(PKG_VERSION)-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))
$(eval $(call PKG_template,PHP_MOD_LDAP,php-mod-ldap,$(PKG_VERSION)-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))
$(eval $(call PKG_template,PHP_MOD_MYSQL,php-mod-mysql,$(PKG_VERSION)-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))
$(eval $(call PKG_template,PHP_MOD_OPENSSL,php-mod-openssl,$(PKG_VERSION)-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))
#$(eval $(call PKG_template,PHP_MOD_PCRE,php-mod-pcre,$(PKG_VERSION)-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))
$(eval $(call PKG_template,PHP_MOD_PGSQL,php-mod-pgsql,$(PKG_VERSION)-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))
$(eval $(call PKG_template,PHP_MOD_SESSION,php-mod-session,$(PKG_VERSION)-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))
$(eval $(call PKG_template,PHP_MOD_SOCKETS,php-mod-sockets,$(PKG_VERSION)-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))
$(eval $(call PKG_template,PHP_MOD_SQLITE,php-mod-sqlite,$(PKG_VERSION)-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))
$(eval $(call PKG_template,PHP_MOD_XML,php-mod-xml,$(PKG_VERSION)-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))

$(eval $(call PKG_mod_template,PHP_MOD_CURL,curl))
$(eval $(call PKG_mod_template,PHP_MOD_FTP,ftp))
$(eval $(call PKG_mod_template,PHP_MOD_GD,gd))
$(eval $(call PKG_mod_template,PHP_MOD_GMP,gmp))
$(eval $(call PKG_mod_template,PHP_MOD_LDAP,ldap))
$(eval $(call PKG_mod_template,PHP_MOD_MYSQL,mysql))
$(eval $(call PKG_mod_template,PHP_MOD_OPENSSL,openssl))
$(eval $(call PKG_mod_template,PHP_MOD_PGSQL,pgsql))
$(eval $(call PKG_mod_template,PHP_MOD_SESSION,session))
$(eval $(call PKG_mod_template,PHP_MOD_SOCKETS,sockets))
$(eval $(call PKG_mod_template,PHP_MOD_SQLITE,pdo))
$(eval $(call PKG_mod_template,PHP_MOD_XML,xml))

INSTALL_STYLE:=		manual

TLDFLAGS+=		-L$(STAGING_DIR)/usr/lib/mysql
CONFIGURE_ENV+=		LIBS="-ldl"
CONFIGURE_ARGS+=	$(PKG_CONFIGURE_OPTS)

do-install: ${INSTALL_MODS_y} ${INSTALL_MODS_m}
	${INSTALL_DIR} $(IDIR_PHP)/etc
	${INSTALL_DATA} ./files/php.ini $(IDIR_PHP)/etc/
	${INSTALL_DIR} $(IDIR_PHP_CLI)/usr/bin
	${INSTALL_DIR} $(IDIR_PHP_CLI)/etc
	${INSTALL_DATA} ./files/php.ini $(IDIR_PHP_CLI)/etc/
	${INSTALL_BIN} $(WRKBUILD)/sapi/cli/php $(IDIR_PHP_CLI)/usr/bin/php
	${INSTALL_DIR} $(IDIR_PHP_FASTCGI)/etc
	${INSTALL_DATA} ./files/php.ini $(IDIR_PHP_FASTCGI)/etc/
	${INSTALL_DIR} $(IDIR_PHP_FASTCGI)/usr/sbin
	${INSTALL_BIN} $(WRKBUILD)/sapi/cgi/php-cgi \
		$(IDIR_PHP_FASTCGI)/usr/sbin/php

include ${TOPDIR}/mk/pkg-bottom.mk
