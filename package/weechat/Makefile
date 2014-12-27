# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include ${ADK_TOPDIR}/rules.mk

PKG_NAME:=		weechat
PKG_VERSION:=		0.4.3
PKG_RELEASE:=		1
PKG_HASH:=		bfb5a34f78eaad0e22e1aa0783ff330907f253fcd50a1d3fd0aa19df9114dde9
PKG_DESCR:=		lightweight irc client
PKG_SECTION:=		app/chat
PKG_DEPENDS:=		libncurses libgcrypt zlib libcurl
PKG_BUILDDEP:=		ncurses zlib libgcrypt curl
PKG_URL:=		http://www.weechat.org/
PKG_SITES:=		http://www.weechat.org/files/src/

DISTFILES:=		${PKG_NAME}-${PKG_VERSION}.tar.gz

include ${ADK_TOPDIR}/mk/package.mk

$(eval $(call PKG_template,WEECHAT,weechat,${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))

AUTOTOOL_STYLE:=	autoreconf
TARGET_LDFLAGS+=	-ltinfo
CONFIGURE_ARGS+=	--with-debug=0 \
			--disable-perl \
			--disable-python \
			--disable-lua \
			--disable-tcl \
			--disable-gnutls \
			--disable-ruby

weechat-install:
	${INSTALL_DIR} ${IDIR_WEECHAT}/usr/bin
	${INSTALL_BIN} ${WRKINST}/usr/bin/weechat-curses \
		${IDIR_WEECHAT}/usr/bin/weechat

include ${ADK_TOPDIR}/mk/pkg-bottom.mk
