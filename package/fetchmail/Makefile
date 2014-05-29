# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include ${TOPDIR}/rules.mk

PKG_NAME:=		fetchmail
PKG_VERSION:=		6.3.26
PKG_RELEASE:=		1
PKG_MD5SUM:=		d9ae3d939205a3c06a21ea79b8f14793
PKG_DESCR:=		fetch mail from a pop3 or imap server
PKG_SECTION:=		net/mail
PKG_URL:=		http://fetchmail.berlios.de/
PKG_SITES:=		http://download.berlios.de/fetchmail/

DISTFILES:=             ${PKG_NAME}-${PKG_VERSION}.tar.bz2

PKG_FLAVOURS_FETCHMAIL:=WITH_SSL
PKGFD_WITH_SSL:=	enable SSL support
PKGFS_WITH_SSL:=	libopenssl
PKGFB_WITH_SSL:=	openssl

include ${TOPDIR}/mk/package.mk

$(eval $(call PKG_template,FETCHMAIL,fetchmail,${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))

CONFIGURE_ARGS+=	--without-hesiod

ifeq (${ADK_PACKAGE_FETCHMAIL_WITH_SSL},y)
CONFIGURE_ARGS+=	--with-ssl='${STAGING_TARGET_DIR}/usr'
else
CONFIGURE_ARGS+=	--without-ssl
endif

fetchmail-install:
	${INSTALL_DIR} ${IDIR_FETCHMAIL}/usr/bin
	${INSTALL_BIN} ${WRKINST}/usr/bin/fetchmail \
		 ${IDIR_FETCHMAIL}/usr/bin/

include ${TOPDIR}/mk/pkg-bottom.mk
