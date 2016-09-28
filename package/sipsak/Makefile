# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include ${ADK_TOPDIR}/rules.mk

PKG_NAME:=		sipsak
PKG_VERSION:=		0.9.6
PKG_RELEASE:=		2
PKG_HASH:=		5064c56d482a080b6a4aea71821b78c21b59d44f6d1aa14c27429441917911a9
PKG_DESCR:=		sip stress and diagnostics utility
PKG_SECTION:=		net/voip
PKG_URL:=		http://sourceforge.net/projects/sipsak.berlios/
PKG_SITES:=		${MASTER_SITE_SOURCEFORGE:=sipsak.berlios/}

DISTFILES:=		$(PKG_NAME)-$(PKG_VERSION)-1.tar.gz

PKG_CHOICES_SIPSAK:=	WITH_LIBRESSL WITHOUT_SSL
PKGCD_WITH_LIBRESSL:=	use libressl for crypto
PKGCB_WITH_LIBRESSL:=	libressl
PKGCS_WITH_LIBRESSL:=	libressl ca-certificates
PKGCD_WITHOUT_SSL:=	use no ssl

include ${ADK_TOPDIR}/mk/package.mk

$(eval $(call PKG_template,SIPSAK,sipsak,${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))

CONFIGURE_ENV+=		ac_cv_func_malloc_0_nonnull=yes
CONFIGURE_ARGS+=	--disable-gnutls

sipsak-install:
	${INSTALL_DIR} ${IDIR_SIPSAK}/usr/bin
	${INSTALL_BIN} ${WRKINST}/usr/bin/sipsak ${IDIR_SIPSAK}/usr/bin/

include ${ADK_TOPDIR}/mk/pkg-bottom.mk
