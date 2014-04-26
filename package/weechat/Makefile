# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include ${TOPDIR}/rules.mk

PKG_NAME:=		weechat
PKG_VERSION:=		0.4.2
PKG_RELEASE:=		2
PKG_MD5SUM:=		fd584c258aace2aa898f40e1fcf06084
PKG_DESCR:=		lightweight IRC client
PKG_SECTION:=		chat
PKG_DEPENDS:=		libncurses libgcrypt libz libcurl
PKG_BUILDDEP:=		ncurses libiconv-tiny autotool libgcrypt
PKG_BUILDDEP+=		zlib curl
PKG_URL:=		http://www.weechat.org/
PKG_SITES:=		http://www.weechat.org/files/src/

DISTFILES:=		${PKG_NAME}-${PKG_VERSION}.tar.gz

include ${TOPDIR}/mk/package.mk

$(eval $(call PKG_template,WEECHAT,weechat,${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))

AUTOTOOL_STYLE:=	autoreconf
TARGET_LDFLAGS+=	-ltinfo
CONFIGURE_ARGS+=	--with-debug=0 \
			--disable-perl \
			--disable-python \
			--disable-lua \
			--disable-tcl \
			--disable-gnutls \
			--disable-ruby \
			--with-libiconv-prefix='${STAGING_TARGET_DIR}/usr'

weechat-install:
	${INSTALL_DIR} ${IDIR_WEECHAT}/usr/bin
	${INSTALL_BIN} ${WRKINST}/usr/bin/weechat-curses \
		${IDIR_WEECHAT}/usr/bin/weechat

include ${TOPDIR}/mk/pkg-bottom.mk
