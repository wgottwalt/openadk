# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(TOPDIR)/rules.mk

PKG_NAME:=		php
PKG_VERSION:=		5.5.12
PKG_RELEASE:=		1
PKG_MD5SUM:=		3fb091987063135fd86b3b5ba5010479
PKG_DESCR:=		php language interpreter
PKG_SECTION:=		dev/lang
PKG_DEPENDS:=		libpthread librt
PHP_URL:=		http://www.php.net/
PKG_SITES:=		http://de.php.net/distributions/

PKG_SUBPKGS:=		PHP PHP_CLI PHP_FASTCGI
PKGSD_PHP_FASTCGI:=	PHP for FastCGI usage
PKGSN_PHP_FASTCGI:=	php
PKGSD_PHP_CLI:=		PHP CLI
PKGSN_PHP_CLI:=		php

PKG_FLAVOURS_PHP:=	MOD_BZ2 MOD_CURL MOD_FTP MOD_GD MOD_GMP MOD_MYSQL
PKG_FLAVOURS_PHP+=	MOD_OPENSSL MOD_PGSQL MOD_SESSION MOD_SNMP MOD_SQLITE 
PKG_FLAVOURS_PHP+=	MOD_SOCKETS MOD_XML MOD_SIMPLEXML MOD_ZLIB MOD_JSON
PKG_FLAVOURS_PHP+=	MOD_LDAP

PKGFD_MOD_BZ2:=		Bzip2 support
PKGFB_MOD_BZ2:=		bzip2
PKGFS_MOD_BZ2:=		bzip2
PKGFD_MOD_CURL:=	Curl support
PKGFB_MOD_CURL:=	curl
PKGFS_MOD_CURL:=	libcurl
PKGFD_MOD_FTP:=		FTP support
PKGFD_MOD_GD:=		Gd support
PKGFB_MOD_GD:=		libgd libpng libjpeg-turbo
PKGFS_MOD_GD:=		libgd libpng libjpeg-turbo
PKGFD_MOD_GMP:=		GMP support
PKGFB_MOD_GMP:=		gmp
PKGFS_MOD_GMP:=		libgmp
PKGFD_MOD_JSON:=	JSON support
PKGFD_MOD_LDAP:=	LDAP support
PKGFB_MOD_LDAP:=	openldap
PKGFS_MOD_LDAP:=	libopenldap
PKGFD_MOD_MYSQL:=	MySQL support
PKGFS_MOD_MYSQL:=	libmysqlclient
PKGFB_MOD_MYSQL:=	mysql
PKGFD_MOD_OPENSSL:=	OpenSSL support
PKGFB_MOD_OPENSSL:=	openssl
PKGFS_MOD_OPENSSL:=	libopenssl
PKGFD_MOD_PGSQL:=	PGSQL support
PKGFB_MOD_PGSQL:=	postgresql
PKGFS_MOD_PGSQL:=	libpq
PKGFD_MOD_SESSION:=	Session support
PKGFD_MOD_SNMP:=	SNMP support
PKGFB_MOD_SNMP:=	net-snmp
PKGFS_MOD_SNMP:=	libnetsnmp
PKGFD_MOD_SQLITE:=	SQlite support
PKGFB_MOD_SQLITE:=	sqlite
PKGFS_MOD_SQLITE:=	libsqlite
PKGFD_MOD_SOCKETS:=	Socket support
PKGFD_MOD_XML:=		XML support
PKGFB_MOD_XML:=		expat
PKGFS_MOD_XML:=		libexpat
PKGFD_MOD_SIMPLEXML:=	simple XML support
PKGFB_MOD_SIMPLEXML:=	libxml2
PKGFS_MOD_SIMPLEXML:=	libxml2
PKGFD_MOD_ZLIB:=	ZLIB support
PKGFB_MOD_ZLIB:=	zlib
PKGFS_MOD_ZLIB:=	zlib

PKG_HOST_DEPENDS:=	!cygwin

include $(TOPDIR)/mk/package.mk

$(eval $(call PKG_template,PHP,php,${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))
$(eval $(call PKG_template,PHP_CLI,php-cli,${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKGSD_PHP_CLI},${PKG_SECTION}))
$(eval $(call PKG_template,PHP_FASTCGI,php-fastcgi,${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKGSD_PHP_FASTCGI},${PKG_SECTION}))

define PKG_mod_template

INSTALL_MODS_$${ADK_PACKAGE_${1}}+=    ${2}-install

${2}-install:
	${INSTALL_DIR} $$(IDIR_$(1))/usr/lib/php
	for m in ${2}; do \
		${INSTALL_DATA} $(WRKBUILD)/modules/$$$${m}.so $$(IDIR_$(1))/usr/lib/php ;\
	done
endef

PKG_CONFIGURE_OPTS:=	\
	--with-config-file-path=/etc \
	--enable-cli \
	--enable-cgi \
	--enable-opcache=no \
	--disable-hash \
	--disable-mbstring \
	--disable-mbregex \
	--disable-phar \
	--disable-short-tags \
	--disable-ctype \
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
	--with-pcre-regex=no \
	--with-kerberos=no

ifneq ($(ADK_PACKAGE_PHP_MOD_BZ2),)
PKG_CONFIGURE_OPTS+=	--with-bz2=shared,"$(STAGING_TARGET_DIR)/usr"
else
PKG_CONFIGURE_OPTS+=	--without-bz2
endif
ifneq ($(ADK_PACKAGE_PHP_MOD_CURL),)
PKG_CONFIGURE_OPTS+=	--with-curl=shared,"$(STAGING_TARGET_DIR)/usr"
else
PKG_CONFIGURE_OPTS+=	--without-curl
endif
ifneq ($(ADK_PACKAGE_PHP_MOD_FTP),)
PKG_CONFIGURE_OPTS+=	--enable-ftp=shared
else
PKG_CONFIGURE_OPTS+=	--disable-ftp
endif
ifneq ($(ADK_PACKAGE_PHP_MOD_GD),)
PKG_CONFIGURE_OPTS+=	--with-gd=shared,"$(STAGING_TARGET_DIR)/usr" \
			--with-png-dir="$(STAGING_TARGET_DIR)/usr" \
			--with-jpeg-dir="$(STAGING_TARGET_DIR)/usr" \
			--without-freetype-dir \
			--without-ttf \
			--without-t1lib	\
			--enable-gd-native-ttf \
			--disable-gd-jis-conv
else
PKG_CONFIGURE_OPTS+=	--without-gd
endif
ifneq ($(ADK_PACKAGE_PHP_MOD_GMP),)
PKG_CONFIGURE_OPTS+=	--with-gmp=shared,"$(STAGING_TARGET_DIR)/usr"
else
PKG_CONFIGURE_OPTS+=	--without-gmp
endif
ifneq ($(ADK_PACKAGE_PHP_MOD_JSON),)
PKG_CONFIGURE_OPTS+=	--enable-json=shared,"$(STAGING_TARGET_DIR)/usr"
else
PKG_CONFIGURE_OPTS+=	--disable-json
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
ifneq ($(ADK_PACKAGE_PHP_MOD_OPENSSL),)
PKG_CONFIGURE_OPTS+=	--with-openssl=shared,"$(STAGING_TARGET_DIR)/usr" \
			--with-openssl-dir="$(STAGING_TARGET_DIR)/usr"
else
PKG_CONFIGURE_OPTS+=	--without-openssl
endif
ifneq ($(ADK_PACKAGE_PHP_MOD_PGSQL),)
PKG_CONFIGURE_OPTS+=	--with-pgsql=shared,"$(STAGING_TARGET_DIR)/usr"
else
PKG_CONFIGURE_OPTS+=	--without-pgsql
endif
ifneq ($(ADK_PACKAGE_PHP_MOD_SESSION),)
PKG_CONFIGURE_OPTS+=	--enable-session=shared
else
PKG_CONFIGURE_OPTS+=	--without-session
endif
ifneq ($(ADK_PACKAGE_PHP_MOD_SNMP),)
PKG_CONFIGURE_OPTS+=	--with-snmp=shared,"$(STAGING_TARGET_DIR)/usr"
CONFIGURE_ENV+=		LIBS="-lnetsnmpmibs"
else
PKG_CONFIGURE_OPTS+=	--without-snmp
endif
ifneq ($(ADK_PACKAGE_PHP_MOD_SQLITE),)
PKG_CONFIGURE_OPTS+=	--with-sqlite3="$(STAGING_TARGET_DIR)/usr"
PKG_CONFIGURE_OPTS+=	--with-pdo-sqlite=shared,"$(STAGING_TARGET_DIR)/usr"
PKG_CONFIGURE_OPTS+=	--enable-pdo=shared
else
PKG_CONFIGURE_OPTS+=	--without-sqlite3 --without-pdo-sqlite
endif
ifneq ($(ADK_PACKAGE_PHP_MOD_SOCKETS),)
PKG_CONFIGURE_OPTS+=	--enable-sockets=shared
else
PKG_CONFIGURE_OPTS+=	--enable-sockets=no
endif
ifneq ($(ADK_PACKAGE_PHP_MOD_XML),)
PKG_CONFIGURE_OPTS+=	--enable-xml=shared,"$(STAGING_TARGET_DIR)/usr" \
			--with-libexpat-dir="$(STAGING_TARGET_DIR)/usr"
else
PKG_CONFIGURE_OPTS+=	--disable-xml
endif
ifneq ($(ADK_PACKAGE_PHP_MOD_SIMPLEXML),)
PKG_CONFIGURE_OPTS+=	--enable-simplexml=shared --enable-libxml --with-libxml-dir="$(STAGING_TARGET_DIR)/usr"
else
PKG_CONFIGURE_OPTS+=	--disable-simplexml --disable-libxml
endif
ifneq ($(ADK_PACKAGE_PHP_MOD_ZLIB),)
PKG_CONFIGURE_OPTS+=	--with-zlib=shared,"$(STAGING_TARGET_DIR)/usr"
else
PKG_CONFIGURE_OPTS+=	--without-zlib
endif

$(eval $(call PKG_template,PHP_MOD_BZ2,php-mod-bz2,$(PKG_VERSION)-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))
$(eval $(call PKG_template,PHP_MOD_CURL,php-mod-curl,$(PKG_VERSION)-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))
$(eval $(call PKG_template,PHP_MOD_FTP,php-mod-ftp,$(PKG_VERSION)-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))
$(eval $(call PKG_template,PHP_MOD_GD,php-mod-gd,$(PKG_VERSION)-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))
$(eval $(call PKG_template,PHP_MOD_GMP,php-mod-gmp,$(PKG_VERSION)-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))
$(eval $(call PKG_template,PHP_MOD_JSON,php-mod-json,$(PKG_VERSION)-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))
$(eval $(call PKG_template,PHP_MOD_LDAP,php-mod-ldap,$(PKG_VERSION)-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))
$(eval $(call PKG_template,PHP_MOD_MYSQL,php-mod-mysql,$(PKG_VERSION)-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))
$(eval $(call PKG_template,PHP_MOD_OPENSSL,php-mod-openssl,$(PKG_VERSION)-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))
$(eval $(call PKG_template,PHP_MOD_PGSQL,php-mod-pgsql,$(PKG_VERSION)-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))
$(eval $(call PKG_template,PHP_MOD_SESSION,php-mod-session,$(PKG_VERSION)-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))
$(eval $(call PKG_template,PHP_MOD_SNMP,php-mod-snmp,$(PKG_VERSION)-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))
$(eval $(call PKG_template,PHP_MOD_SOCKETS,php-mod-sockets,$(PKG_VERSION)-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))
$(eval $(call PKG_template,PHP_MOD_SQLITE,php-mod-sqlite,$(PKG_VERSION)-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))
$(eval $(call PKG_template,PHP_MOD_XML,php-mod-xml,$(PKG_VERSION)-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))
$(eval $(call PKG_template,PHP_MOD_SIMPLEXML,php-mod-simplexml,$(PKG_VERSION)-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))
$(eval $(call PKG_template,PHP_MOD_ZLIB,php-mod-zlib,$(PKG_VERSION)-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))

$(eval $(call PKG_mod_template,PHP_MOD_BZ2,bz2))
$(eval $(call PKG_mod_template,PHP_MOD_CURL,curl))
$(eval $(call PKG_mod_template,PHP_MOD_FTP,ftp))
$(eval $(call PKG_mod_template,PHP_MOD_GD,gd))
$(eval $(call PKG_mod_template,PHP_MOD_GMP,gmp))
$(eval $(call PKG_mod_template,PHP_MOD_JSON,json))
$(eval $(call PKG_mod_template,PHP_MOD_LDAP,ldap))
$(eval $(call PKG_mod_template,PHP_MOD_MYSQL,mysql))
$(eval $(call PKG_mod_template,PHP_MOD_OPENSSL,openssl))
$(eval $(call PKG_mod_template,PHP_MOD_PGSQL,pgsql))
$(eval $(call PKG_mod_template,PHP_MOD_SESSION,session))
$(eval $(call PKG_mod_template,PHP_MOD_SOCKETS,sockets))
$(eval $(call PKG_mod_template,PHP_MOD_SNMP,snmp))
$(eval $(call PKG_mod_template,PHP_MOD_SQLITE,pdo pdo_sqlite))
$(eval $(call PKG_mod_template,PHP_MOD_XML,xml))
$(eval $(call PKG_mod_template,PHP_MOD_SIMPLEXML,simplexml))
$(eval $(call PKG_mod_template,PHP_MOD_ZLIB,zlib))

INSTALL_STYLE:=		manual
TARGET_LDFLAGS+=	-L$(STAGING_TARGET_DIR)/usr/lib/mysql
CONFIGURE_ENV+=		LIBS="-ldl"
CONFIGURE_ARGS+=	$(PKG_CONFIGURE_OPTS)

do-install: ${INSTALL_MODS_y} ${INSTALL_MODS_m}
	${INSTALL_DIR} $(IDIR_PHP)/etc
	${INSTALL_DATA} ./files/php.ini $(IDIR_PHP)/etc
	${INSTALL_DIR} $(IDIR_PHP_CLI)/usr/bin
	${INSTALL_BIN} $(WRKBUILD)/sapi/cli/php $(IDIR_PHP_CLI)/usr/bin/php
	${INSTALL_DIR} $(IDIR_PHP_FASTCGI)/usr/bin
	${INSTALL_BIN} $(WRKBUILD)/sapi/cgi/php-cgi \
		$(IDIR_PHP_FASTCGI)/usr/bin/php

include ${TOPDIR}/mk/pkg-bottom.mk
