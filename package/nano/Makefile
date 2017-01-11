# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include ${ADK_TOPDIR}/rules.mk

PKG_NAME:=		nano
PKG_VERSION:=		2.7.4
PKG_RELEASE:=		1
PKG_HASH:=		752170643039e2c95a433de357f0c70a8c4c4c561a90a7e7259a63e225b659b9
PKG_DESCR:=		enhanced clone of the pico editor
PKG_SECTION:=		app/editor
PKG_DEPENDS:=		libncurses
PKG_BUILDDEP:=		ncurses
PKG_URL:=		http://www.nano-editor.org/
PKG_SITES:=		http://www.nano-editor.org/dist/v2.7/

include ${ADK_TOPDIR}/mk/package.mk

$(eval $(call PKG_template,NANO,nano,${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))

CONFIGURE_ENV+=		ac_cv_header_regex_h=no
CONFIGURE_ARGS+=	--enable-nanorc \
			--enable-tiny \
			--disable-utf8 \
			--disable-glibtest \
			--disable-color \
			--without-slang \
			--disable-browser \
			--disable-help \
			--disable-mouse \
			--disable-speller \
			--disable-operatingdir \
			--enable-multibuffer
TARGET_LDFLAGS+=	-ltinfo

nano-install:
	${INSTALL_DIR} ${IDIR_NANO}/usr/bin
	${INSTALL_BIN} ${WRKINST}/usr/bin/nano ${IDIR_NANO}/usr/bin/
	${INSTALL_DIR} ${IDIR_NANO}/etc
	$(INSTALL_DATA) ./files/nanorc ${IDIR_NANO}/etc/

include ${ADK_TOPDIR}/mk/pkg-bottom.mk
