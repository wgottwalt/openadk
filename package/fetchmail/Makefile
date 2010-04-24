# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include ${TOPDIR}/rules.mk

PKG_NAME:=		fetchmail
PKG_VERSION:=		6.3.9
PKG_RELEASE:=		1
PKG_MD5SUM:=		72c20ad2b9629f1a109668b05a84d823
PKG_DESCR:=		fetch mail from a POP or IMAP server
PKG_SECTION:=		mail
ifeq (${ADK_PACKAGE_FETCHMAIL_SSL},y)
PKG_DEPENDS:=		libopenssl
PKG_BUILDDEP+=		openssl
endif
PKG_URL:=		http://fetchmail.berlios.de/
PKG_SITES:=		http://download.berlios.de/fetchmail/

DISTFILES:=             ${PKG_NAME}-${PKG_VERSION}.tar.bz2

PKG_FLAVOURS:=		SSL
PKGFD_SSL:=		enable SSL support

include ${TOPDIR}/mk/package.mk

$(eval $(call PKG_template,FETCHMAIL,${PKG_NAME},${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))

CONFIGURE_ARGS+=	--without-hesiod

ifeq (${ADK_PACKAGE_FETCHMAIL_SSL},y)
CONFIGURE_ARGS+=	--with-ssl='${STAGING_DIR}/usr'
else
CONFIGURE_ARGS+=	--without-ssl
endif

post-install:
	${INSTALL_DIR} ${IDIR_FETCHMAIL}/usr/bin
	${INSTALL_BIN} ${WRKINST}/usr/bin/fetchmail \
		 ${IDIR_FETCHMAIL}/usr/bin/

include ${TOPDIR}/mk/pkg-bottom.mk
