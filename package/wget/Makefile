# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include ${ADK_TOPDIR}/rules.mk

PKG_NAME:=		wget
PKG_VERSION:=		1.16.3
PKG_RELEASE:=		1
PKG_HASH:=		9f1c6d09d7148c1c2d9fd0ea655dcf4dcc407deb2db32d4126251ca0245cb670
PKG_DESCR:=		retrieving files using http(s) and ftp
PKG_SECTION:=		net/http
PKG_URL:=		http://www.gnu.org/software/wget/
PKG_SITES:=		${MASTER_SITE_GNU:=wget/}
PKG_BB:=		1

DISTFILES:=		${PKG_NAME}-${PKG_VERSION}.tar.gz

PKG_CHOICES_WGET:=	WITH_GNUTLS WITH_OPENSSL WITHOUT_SSL
PKGCD_WITHOUT_SSL:=	use no ssl
PKGCD_WITH_OPENSSL:=	use openssl for crypto
PKGCS_WITH_OPENSSL:=	libopenssl ca-certificates libgmp
PKGCB_WITH_OPENSSL:=	openssl
PKGCD_WITH_GNUTLS:=	use gnutls for crypto
PKGCS_WITH_GNUTLS:=	libgnutls ca-certificates libgmp
PKGCB_WITH_GNUTLS:=	gnutls

include ${ADK_TOPDIR}/mk/package.mk

$(eval $(call PKG_template,WGET,wget,${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))

ifeq (${ADK_PACKAGE_WGET_WITHOUT_SSL},y)
CONFIGURE_ARGS+=	--with-ssl=no
endif
ifeq (${ADK_PACKAGE_WGET_WITH_OPENSSL},y)
CONFIGURE_ARGS+=	--with-ssl=openssl \
			--with-openssl=yes \
			--with-libssl-prefix=${STAGING_TARGET_DIR}
endif
ifeq (${ADK_PACKAGE_WGET_WITH_GNUTLS},y)
CONFIGURE_ARGS+=	--with-ssl=gnutls \
			--with-libgnutls-prefix="$(STAGING_TARGET_DIR)/usr"
endif

wget-install:
	${INSTALL_DIR} ${IDIR_WGET}/etc ${IDIR_WGET}/usr/bin
	${INSTALL_DATA} ${WRKBUILD}/doc/sample.wgetrc \
		${IDIR_WGET}/etc/wgetrc
	${INSTALL_BIN} ${WRKINST}/usr/bin/wget ${IDIR_WGET}/usr/bin

include ${ADK_TOPDIR}/mk/pkg-bottom.mk
