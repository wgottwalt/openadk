# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include ${ADK_TOPDIR}/rules.mk

PKG_NAME:=		fetchmail
PKG_VERSION:=		6.3.26
PKG_RELEASE:=		1
PKG_HASH:=		79b4c54cdbaf02c1a9a691d9948fcb1a77a1591a813e904283a8b614b757e850
PKG_DESCR:=		fetch mail from a pop3 or imap server
PKG_SECTION:=		net/mail
PKG_URL:=		http://www.fetchmail.info
PKG_SITES:=		${MASTER_SITE_SOURCEFORGE:=fetchmail/}

PKG_CHOICES_FETCHMAIL:=	WITH_LIBRESSL WITHOUT_SSL
PKGCD_WITH_LIBRESSL:=	use libressl for crypto
PKGCB_WITH_LIBRESSL:=	libressl
PKGCS_WITH_LIBRESSL:=	libressl ca-certificates
PKGCD_WITHOUT_SSL:=	use no ssl

include ${ADK_TOPDIR}/mk/package.mk

$(eval $(call PKG_template,FETCHMAIL,fetchmail,${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))

AUTOTOOL_STYLE:=	autoreconf
CONFIGURE_ARGS+=	--without-hesiod

ifeq (${ADK_PACKAGE_FETCHMAIL_WITH_LIBRESSL},y)
CONFIGURE_ARGS+=	--with-ssl='${STAGING_TARGET_DIR}/usr'
endif
ifeq (${ADK_PACKAGE_FETCHMAIL_WITHOUT_SSL},y)
CONFIGURE_ARGS+=	--without-ssl
endif

fetchmail-install:
	${INSTALL_DIR} ${IDIR_FETCHMAIL}/usr/bin
	${INSTALL_BIN} ${WRKINST}/usr/bin/fetchmail \
		 ${IDIR_FETCHMAIL}/usr/bin/

include ${ADK_TOPDIR}/mk/pkg-bottom.mk
