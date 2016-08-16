# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include ${ADK_TOPDIR}/rules.mk

PKG_NAME:=		mutt
PKG_VERSION:=		1.6.2
PKG_RELEASE:=		1
PKG_HASH:=		c5d02ef06486cdf04f9eeb9e9d7994890d8dfa7f47e7bfeb53a2a67da2ac1d8e
PKG_DESCR:=		mail client for console
PKG_SECTION:=		net/mail
PKG_DEPENDS:=		libncurses
PKG_BUILDDEP:=		ncurses
PKG_URL:=		http://www.mutt.org/
PKG_SITES:=		ftp://ftp.mutt.org/pub/mutt/

PKG_CHOICES_MUTT:=	WITHOUT_SSL WITH_LIBRESSL WITH_OPENSSL
PKGCD_WITHOUT_SSL:=	use no ssl
PKGCD_WITH_LIBRESSL:=	use libressl for crypto
PKGCB_WITH_LIBRESSL:=	libressl
PKGCS_WITH_LIBRESSL:=	libressl ca-certificates
PKGCD_WITH_OPENSSL:=	use openssl for crypto
PKGCB_WITH_OPENSSL:=	openssl
PKGCS_WITH_OPENSSL:=	libopenssl ca-certificates

DISTFILES:=		${PKG_NAME}-${PKG_VERSION}.tar.gz

include ${ADK_TOPDIR}/mk/package.mk

$(eval $(call PKG_template,MUTT,mutt,${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))

TARGET_LDFLAGS+=	-ltinfo
CONFIGURE_ARGS+=	--includedir=${WRKBUILD}/. \
			--oldincludedir=${WRKBUILD}/. \
			--with-homespool="~/Maildir" \
			--enable-pop \
			--enable-imap

ifeq ($(ADK_PACKAGE_MUTT_WITHOUT_SSL),y)
CONFIGURE_ARGS+=	--without-ssl
else
CONFIGURE_ARGS+=	--with-ssl
endif

mutt-install:
	${INSTALL_DIR} ${IDIR_MUTT}/usr/bin
	${INSTALL_BIN} ${WRKINST}/usr/bin/mutt ${IDIR_MUTT}/usr/bin/
ifeq (${ADK_PACKAGE_GPG},y)
	${INSTALL_BIN} ${WRKINST}/usr/bin/pgpewrap ${IDIR_MUTT}/usr/bin/
endif

include ${ADK_TOPDIR}/mk/pkg-bottom.mk
