# $Id$
#-
# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include ${TOPDIR}/rules.mk

PKG_NAME:=		nano
PKG_VERSION:=		2.0.6
PKG_RELEASE:=		1
PKG_MD5SUM:=		619107f0fc3c4383d668cef15aa3ca32
MASTER_SITES:=		http://www.nano-editor.org/dist/v2.0/

include ${TOPDIR}/mk/package.mk

$(eval $(call PKG_template,NANO,nano,${PKG_VERSION}-${PKG_RELEASE}))

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
