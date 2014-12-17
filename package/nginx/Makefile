# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(ADK_TOPDIR)/rules.mk

PKG_NAME:=		nginx
PKG_VERSION:=		1.7.8
PKG_RELEASE:=		1
PKG_MD5SUM:=		fd5ab813fc1853cd8efe580ead577c3e
PKG_DESCR:=		powerful http reverse proxy and webserver
PKG_SECTION:=		net/http
PKG_BUILDDEP:=		openssl pcre zlib
PKG_DEPENDS:=		libopenssl libpcre libpthread zlib
PKG_URL:=		http://nginx.org/
PKG_SITES:=		http://nginx.org/download/

DISTFILES:=		${PKG_NAME}-${PKG_VERSION}.tar.gz

# flavours for speedy and ssl

include $(ADK_TOPDIR)/mk/package.mk

$(eval $(call PKG_template,NGINX,nginx,$(PKG_VERSION)-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))

CONFIG_STYLE:=          minimal
TARGET_CFLAGS+=         -fPIC
CONFIGURE_ARGS:=        --prefix=/srv/nginx \
			--sbin-path=/usr/sbin \
			--user=nginx \
			--group=nginx \
			--crossbuild=Linux::$(ADK_TARGET_ARCH) \
			--with-cc="$(TARGET_CC)" \
                        --with-cc-opt="$(TARGET_CPPFLAGS) $(TARGET_CFLAGS)" \
                        --with-ld-opt="$(TARGET_LDFLAGS)" \
			--conf-path=/etc/nginx/nginx.conf \
                        --error-log-path=/var/log/nginx/error.log \
                        --pid-path=/var/run/nginx.pid \
                        --lock-path=/var/lock/nginx.lock \
                        --http-log-path=/var/log/nginx/access.log \
                        --http-client-body-temp-path=/var/lib/nginx/body \
                        --http-proxy-temp-path=/var/lib/nginx/proxy \
                        --http-fastcgi-temp-path=/var/lib/nginx/fastcgi \
			--with-http_ssl_module
ALL_TARGET:=		
XAKE_FLAGS+=		GCC_HONOUR_COPTS=s

nginx-install:
	$(INSTALL_DIR) $(IDIR_NGINX)/usr/sbin $(IDIR_NGINX)/etc/nginx
	$(INSTALL_BIN) $(WRKINST)/usr/sbin/nginx \
		$(IDIR_NGINX)/usr/sbin
	for f in nginx.conf mime.types fastcgi_params koi-utf koi-win win-utf; do \
		cp $(WRKINST)/etc/nginx/$${f} \
		$(IDIR_NGINX)/etc/nginx ; \
	done
	$(INSTALL_DIR) $(IDIR_NGINX)/srv/nginx/html
	$(CP) $(WRKINST)/srv/nginx/html/* $(IDIR_NGINX)/srv/nginx/html

include ${ADK_TOPDIR}/mk/pkg-bottom.mk
