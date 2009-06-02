# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include ${TOPDIR}/rules.mk

PKG_NAME:=		weechat
PKG_VERSION:=		0.1.8
PKG_RELEASE:=		2
PKG_MD5SUM:=		73d6bc211ac32c597f0d278506480a20
PKG_DESCR:=		Lightweight IRC client
PKG_SECTION:=		net
PKG_DEPENDS:=		libncurses libiconv
PKG_URL:=		http://weechat.flashtux.org/download/
PKG_SITES:=		http://weechat.flashtux.org/download/

include ${TOPDIR}/mk/package.mk

ifeq (${ADK_COMPILE_WEECHAT_WITH_TLS},y)
PKG_DEPENDS+=		gnutls
endif

ifeq (${ADK_COMPILE_WEECHAT_WITH_LUA},y)
PKG_DEPENDS+=		liblua
endif

$(eval $(call PKG_template,WEECHAT,${PKG_NAME},${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))

ifeq (${ADK_COMPILE_WEECHAT_WITH_TLS},y)
ENABLE_TLS:=		--with-libgnutls-prefix=${STAGING_DIR}/usr
else
ENABLE_TLS:=		--disable-gnutls
endif

ifneq (${ADK_COMPILE_WEECHAT_WITH_LUA},y)
DISABLE_LUA:=		--disable-lua
endif

CONFIGURE_STYLE:=	gnu
CONFIGURE_ARGS+=	${ENABLE_TLS} \
			--with-debug=0 \
			--disable-perl \
			--disable-python \
			--disable-ruby \
			--with-libiconv-prefix='${STAGING_DIR}/usr' \
			${DISABLE_LUA}
BUILD_STYLE:=		auto
INSTALL_STYLE:=		auto

post-install:
	${INSTALL_DIR} ${IDIR_WEECHAT}/usr/bin
	${INSTALL_BIN} ${WRKINST}/usr/bin/weechat-curses ${IDIR_WEECHAT}/usr/bin/

include ${TOPDIR}/mk/pkg-bottom.mk
