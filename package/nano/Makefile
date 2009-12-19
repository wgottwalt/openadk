# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include ${TOPDIR}/rules.mk

PKG_NAME:=		nano
PKG_VERSION:=		2.0.9
PKG_RELEASE:=		1
PKG_BUILDDEP+=		ncurses
PKG_MD5SUM:=		2be94dc43fb60fff4626a2401a977220
PKG_DESCR:=		An enhanced clone of the Pico text editor
PKG_SECTION:=		admin
PKG_DEPENDS:=		libncurses
PKG_URL:=		http://www.nano-editor.org
PKG_SITES:=		http://www.nano-editor.org/dist/v2.0/

include ${TOPDIR}/mk/package.mk

$(eval $(call PKG_template,NANO,${PKG_NAME},${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))

CONFIGURE_STYLE:=	gnu
CONFIGURE_ENV+=		ac_cv_header_regex_h=no
CONFIGURE_ARGS+=	--enable-nanorc \
			--disable-glibtest \
			--disable-utf8 \
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
ifneq (${ADK_UNICODE},)
CONFIGURE_ARGS+=	--enable-utf8
endif
endif

BUILD_STYLE:=		auto
INSTALL_STYLE:=		auto

post-install:
	${INSTALL_DIR} ${IDIR_NANO}/usr/bin
	${INSTALL_BIN} ${WRKINST}/usr/bin/nano ${IDIR_NANO}/usr/bin/
	${INSTALL_DIR} ${IDIR_NANO}/etc
	$(INSTALL_DATA) ./files/nanorc ${IDIR_NANO}/etc/

include ${TOPDIR}/mk/pkg-bottom.mk
