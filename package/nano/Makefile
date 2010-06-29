# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include ${TOPDIR}/rules.mk

PKG_NAME:=		nano
PKG_VERSION:=		2.2.4
PKG_RELEASE:=		1
PKG_MD5SUM:=		6304308afb1f7ef4a5e93eb99206632a
PKG_DESCR:=		An enhanced clone of the Pico text editor
PKG_SECTION:=		admin
PKG_DEPENDS:=		libncurses
PKG_BUILDDEP+=		ncurses
PKG_URL:=		http://www.nano-editor.org
PKG_SITES:=		http://www.nano-editor.org/dist/v2.2/

PKG_FLAVOURS:=		TINY

include ${TOPDIR}/mk/package.mk

$(eval $(call PKG_template,NANO,${PKG_NAME},${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))

CONFIGURE_ENV+=		ac_cv_header_regex_h=no
CONFIGURE_ARGS+=	--enable-nanorc \
			--disable-glibtest \
			--disable-utf8 \
			--disable-color \
			--without-slang
ifeq (${ADK_PACKAGE_NANO_TINY},y)
CONFIGURE_ARGS+=	--enable-tiny
else
CONFIGURE_ARGS+=	--disable-browser \
			--disable-help \
			--disable-mouse \
			--disable-nls \
			--disable-speller \
			--disable-operatingdir \
			--enable-multibuffer
endif

post-install:
	${INSTALL_DIR} ${IDIR_NANO}/usr/bin
	${INSTALL_BIN} ${WRKINST}/usr/bin/nano ${IDIR_NANO}/usr/bin/
	${INSTALL_DIR} ${IDIR_NANO}/etc
	$(INSTALL_DATA) ./files/nanorc ${IDIR_NANO}/etc/

include ${TOPDIR}/mk/pkg-bottom.mk
