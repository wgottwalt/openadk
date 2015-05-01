# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include ${ADK_TOPDIR}/rules.mk

PKG_NAME:=		weechat
PKG_VERSION:=		1.1.1
PKG_RELEASE:=		1
PKG_HASH:=		a32f7e57d5e834195bacaffa874419b4a9d17cd42883c80d7ecb9fadbf601349
PKG_DESCR:=		lightweight irc client
PKG_SECTION:=		app/chat
PKG_DEPENDS:=		libncurses zlib libcurl libgcrypt
PKG_BUILDDEP:=		cmake-host ncurses zlib curl libgcrypt
PKG_URL:=		http://www.weechat.org/
PKG_SITES:=		http://www.weechat.org/files/src/

DISTFILES:=		${PKG_NAME}-${PKG_VERSION}.tar.gz

include ${ADK_TOPDIR}/mk/package.mk

$(eval $(call PKG_template,WEECHAT,weechat,${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))

CONFIG_STYLE:=          cmake
CMAKE_FLAGS+=		-DENABLE_GNUTLS=OFF \
			-DENABLE_PERL=OFF \
			-DENABLE_PYTHON=OFF \
			-DENABLE_NLS=OFF \
			-DGCRYPT_LDFLAGS="-L$(STAGING_TARGET_DIR)/usr/lib -ltinfo -lgcrypt" \
			-DGCRYPT_CFLAGS="-I$(STAGING_TARGET_DIR)/usr/include" \

weechat-install:
	${INSTALL_DIR} ${IDIR_WEECHAT}/usr/bin
	${INSTALL_BIN} ${WRKINST}/usr/bin/weechat-curses \
		${IDIR_WEECHAT}/usr/bin/weechat

include ${ADK_TOPDIR}/mk/pkg-bottom.mk
