# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include ${TOPDIR}/rules.mk

PKG_NAME:=		weechat
PKG_VERSION:=		0.3.2
PKG_RELEASE:=		1
PKG_MD5SUM:=		0c4f6e7196703c6eca12217f254612aa
PKG_DESCR:=		Lightweight IRC client
PKG_SECTION:=		chat
PKG_DEPENDS:=		libncurses libiconv
PKG_BUILDDEP:=		ncurses libiconv
PKG_URL:=		http://www.weechat.org/
PKG_SITES:=		http://www.weechat.org/files/src/

include ${TOPDIR}/mk/package.mk

$(eval $(call PKG_template,WEECHAT,${PKG_NAME},${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))

TCFLAGS+=		-liconv
CONFIGURE_ARGS+=	--with-debug=0 \
			--disable-perl \
			--disable-python \
			--disable-lua \
			--disable-gnutls \
			--disable-ruby \
			--with-libiconv-prefix='${STAGING_DIR}/usr'

post-install:
	${INSTALL_DIR} ${IDIR_WEECHAT}/usr/bin
	${INSTALL_BIN} ${WRKINST}/usr/bin/weechat-curses \
		${IDIR_WEECHAT}/usr/bin/

include ${TOPDIR}/mk/pkg-bottom.mk
