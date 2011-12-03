# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(TOPDIR)/rules.mk

PKG_NAME:=		php
PKG_VERSION:=		5.3.8
PKG_RELEASE:=		1
PKG_MD5SUM:=		f4ce40d5d156ca66a996dbb8a0e7666a
PKG_DESCR:=		PHP language interpreter
PKG_SECTION:=		lang
PKG_DEPENDS:=		libopenssl zlib
PKG_BUILDDEP:=		openssl zlib
PHP_URL:=		http://www.php.net/
PKG_SITES:=		http://de.php.net/distributions/
PKG_MULTI:=		1

PKG_SUBPKGS:=		PHP PHP_CLI PHP_FASTCGI
PKGSD_PHP_FASTCGI:=	PHP for FastCGI usage
PKGSD_PHP_CLI:=		PHP CLI

#PKG_FLAVOURS_PHP:=	MOD_CURL MOD_GD MOD_GMP MOD_LDAP MOD_MYSQL
PKG_FLAVOURS_PHP:=	MOD_CURL MOD_GMP MOD_LDAP MOD_MYSQL
PKG_FLAVOURS_PHP+=	MOD_PGSQL MOD_SQLITE MOD_XML

PKGFD_MOD_CURL:=	Curl support
PKGFB_MOD_CURL:=	curl
PKGFS_MOD_CURL:=	libcurl
#PKGFD_MOD_GD:=		Gd support
#PKGFB_MOD_GD:=		libgd libpng
#PKGFS_MOD_GD:=		libgd libpng
PKGFD_MOD_GMP:=		GMP support
PKGFB_MOD_GMP:=		gmp
PKGFS_MOD_GMP:=		libgmp
PKGFD_MOD_LDAP:=	LDAP support
PKGFB_MOD_LDAP:=	openldap
PKGFS_MOD_LDAP:=	libopenldap
PKGFD_MOD_MYSQL:=	MySQL support
PKGFS_MOD_MYSQL:=	libmysqlclient
PKGFB_MOD_MYSQL:=	mysql
PKGFD_MOD_PGSQL:=	PGSQL support
PKGFB_MOD_PGSQL:=	postgresql
PKGFS_MOD_PGSQL:=	libpq
PKGFD_MOD_SQLITE:=	SQlite support
PKGFB_MOD_SQLITE:=	sqlite
PKGFS_MOD_SQLITE:=	libsqlite
PKGFD_MOD_XML:=		XML support
PKGFB_MOD_XML:=		expat
PKGFS_MOD_XML:=		libexpat

PKG_ARCH_DEPENDS:=	!cris
PKG_HOST_DEPENDS:=	!cygwin

include $(TOPDIR)/mk/package.mk

$(eval $(call PKG_template,PHP,php,${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))
$(eval $(call PKG_template,PHP_CLI,php-cli,${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKGSD_PHP_CLI},${PKG_SECTION}))
$(eval $(call PKG_template,PHP_FASTCGI,php-fastcgi,${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKGSD_PHP_FASTCGI},${PKG_SECTION}))

define PKG_mod_template

INSTALL_MODS_$${ADK_PACKAGE_${1}}+=    ${2}-install

${2}-install:
	${INSTALL_DIR} $$(IDIR_$(1))/usr/lib/php
	${INSTALL_DATA} $(WRKBUILD)/modules/$(2).so $$(IDIR_$(1))/usr/lib/php
endef

PKG_CONFIGURE_OPTS:=	\
	--with-config-file-path=/etc \
	--enable-magic-quotes \
	--enable-ftp=shared \
	--enable-session=shared \
	--enable-sockets=shared \
	--enable-cli \
	--enable-cgi \
	--enable-fastcgi \
	--enable-force-cgi-redirect \
	--enable-discard-path \
	--disable-mbstring \
	--disable-mbregex \
	--disable-phar \
	--disable-libxml \
	--disable-spl \
	--disable-short-tags \
	--disable-ctype \
	--disable-simplexml \
	--disable-soap \
	--disable-fileinfo \
	--disable-tokenizer \
	--disable-filter \
	--disable-xmlreader \
	--disable-xmlwriter \
	--disable-dom \
	--without-pear \
	--without-gettext \
	--without-iconv \
	--without-libxml-dir \
	--with-kerberos=no \
	--with-openssl=shared,"$(STAGING_TARGET_DIR)/usr" \
	--with-openssl-dir="$(STAGING_TARGET_DIR)/usr" \
	--with-zlib="$(STAGING_TARGET_DIR)/usr" \
	--with-zlib-dir="$(STAGING_TARGET_DIR)/usr" \

ifneq ($(ADK_PACKAGE_PHP_MOD_CURL),)
PKG_CONFIGURE_OPTS+=	--with-curl=shared,"$(STAGING_TARGET_DIR)/usr"
else
PKG_CONFIGURE_OPTS+=	--without-curl
endif
#ifneq ($(ADK_PACKAGE_PHP_MOD_GD),)
#PKG_CONFIGURE_OPTS+=	--with-gd=shared,"$(STAGING_TARGET_DIR)/usr" \
			--without-jpeg-dir \
			--with-png-dir="$(STAGING_TARGET_DIR)/usr" \
			--without-freetype-dir \
			--without-xpm-dir \
			--without-ttf \
			--without-t1lib	\
			--enable-gd-native-ttf \
			--disable-gd-jis-conv
#else
PKG_CONFIGURE_OPTS+=	--without-gd
#endif
ifneq ($(ADK_PACKAGE_PHP_MOD_GMP),)
PKG_CONFIGURE_OPTS+=	--with-gmp=shared,"$(STAGING_TARGET_DIR)/usr"
else
PKG_CONFIGURE_OPTS+=	--without-gmp
endif
ifneq ($(ADK_PACKAGE_PHP_MOD_LDAP),)
PKG_CONFIGURE_OPTS+=	--with-ldap=shared,"$(STAGING_TARGET_DIR)/usr" \
			--with-ldap-sasl="$(STAGING_TARGET_DIR)/usr"
else
PKG_CONFIGURE_OPTS+=	--without-ldap
endif
ifneq ($(ADK_PACKAGE_PHP_MOD_MYSQL),)
PKG_CONFIGURE_OPTS+=	--with-mysql=shared,"$(STAGING_TARGET_DIR)/usr"
else
PKG_CONFIGURE_OPTS+=	--without-mysql
endif
ifneq ($(ADK_PACKAGE_PHP_MOD_PGSQL),)
PKG_CONFIGURE_OPTS+=	--with-pgsql=shared,"$(STAGING_TARGET_DIR)/usr"
else
PKG_CONFIGURE_OPTS+=	--without-pgsql
endif
ifneq ($(ADK_PACKAGE_PHP_MOD_SQLITE),)
PKG_CONFIGURE_OPTS+=	--without-sqlite
PKG_CONFIGURE_OPTS+=	--with-pdo-sqlite=shared,"$(STAGING_TARGET_DIR)/usr"
PKG_CONFIGURE_OPTS+=	--enable-pdo=shared
else
PKG_CONFIGURE_OPTS+=	--without-sqlite
endif
ifneq ($(ADK_PACKAGE_PHP_MOD_XML),)
PKG_CONFIGURE_OPTS+=	--enable-xml=shared,"$(STAGING_TARGET_DIR)/usr" \
			--with-libexpat-dir="$(STAGING_TARGET_DIR)/usr"
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
TARGET_LDFLAGS+=	-L$(STAGING_TARGET_DIR)/usr/lib/mysql
CONFIGURE_ENV+=		LIBS="-ldl"
CONFIGURE_ARGS+=	$(PKG_CONFIGURE_OPTS)

do-install: ${INSTALL_MODS_y} ${INSTALL_MODS_m}
	${INSTALL_DIR} $(IDIR_PHP)/etc
	${INSTALL_DATA} ./files/php.ini $(IDIR_PHP)/etc
	${INSTALL_DIR} $(IDIR_PHP_CLI)/usr/bin
	${INSTALL_DIR} $(IDIR_PHP_CLI)/etc
	${INSTALL_DATA} ./files/php.ini $(IDIR_PHP_CLI)/etc
	${INSTALL_BIN} $(WRKBUILD)/sapi/cli/php $(IDIR_PHP_CLI)/usr/bin/php
	${INSTALL_DIR} $(IDIR_PHP_FASTCGI)/etc
	${INSTALL_DATA} ./files/php.ini $(IDIR_PHP_FASTCGI)/etc
	${INSTALL_DIR} $(IDIR_PHP_FASTCGI)/usr/bin
	${INSTALL_BIN} $(WRKBUILD)/sapi/cgi/php-cgi \
		$(IDIR_PHP_FASTCGI)/usr/bin/php

include ${TOPDIR}/mk/pkg-bottom.mk
