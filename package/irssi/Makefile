# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include ${TOPDIR}/rules.mk

PKG_NAME:=		irssi
PKG_VERSION:=		0.8.16
PKG_RELEASE:=		1
PKG_MD5SUM:=		5a8ee7144b63fa01747d6f400c40ef34
PKG_DESCR:=		irc text client
PKG_SECTION:=		app/chat
PKG_DEPENDS:=		glib libncurses
PKG_BUILDDEP:=		glib ncurses
PKG_URL:=		http://www.irssi.org/
PKG_SITES:=		http://www.irssi.org/files/

DISTFILES:=		${PKG_NAME}-${PKG_VERSION}.tar.gz

PKG_FLAVOURS_IRSSI:=	WITH_SSL WITH_IPV6
PKGFD_WITH_SSL:=	enable ssl/tls support
PKGFS_WITH_SSL:=	libopenssl
PKGFB_WITH_SSL:=	openssl
PKGFD_WITH_IPV6:=	enable ipv6 support

include ${TOPDIR}/mk/package.mk

$(eval $(call PKG_template,IRSSI,irssi,${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))

TARGET_LDFLAGS+=	-ltinfo
CONFIGURE_ARGS+=	--with-perl=no \
			--with-gnu-ld \
			--with-textui \
			--with-terminfo \
			--without-bot \
			--without-proxy

ifneq (${ADK_PACKAGE_IRSSI_WITH_IPV6},)
CONFIGURE_ARGS+=	--enable-ipv6
else
CONFIGURE_ARGS+=	--disable-ipv6
endif

ifneq (${ADK_PACKAGE_IRSSI_WITH_SSL},)
CONFIGURE_ARGS+=	--enable-ssl
else
CONFIGURE_ARGS+=	--disable-ssl
endif

irssi-install:
	${INSTALL_DIR} ${IDIR_IRSSI}/usr/bin
	${INSTALL_BIN} ${WRKINST}/usr/bin/irssi ${IDIR_IRSSI}/usr/bin/

include ${TOPDIR}/mk/pkg-bottom.mk
