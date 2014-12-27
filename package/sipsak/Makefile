# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include ${ADK_TOPDIR}/rules.mk

PKG_NAME:=		sipsak
PKG_VERSION:=		0.9.6
PKG_RELEASE:=		2
PKG_HASH:=		4c9af4437123ca1d65498a00b70a7a186972a21f14c8b3cc905b9f5d1705142c
PKG_DESCR:=		sip stress and diagnostics utility
PKG_SECTION:=		net/voip
PKG_DEPENDS:=		libopenssl
PKG_BUILDDEP:=		openssl
PKG_URL:=		http://sourceforge.net/projects/sipsak.berlios/
PKG_SITES:=		${MASTER_SITE_SOURCEFORGE:=sipsak/}

DISTFILES:=		$(PKG_NAME)-$(PKG_VERSION)-1.tar.gz

include ${ADK_TOPDIR}/mk/package.mk

$(eval $(call PKG_template,SIPSAK,sipsak,${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))

CONFIGURE_ARGS+=	--disable-gnutls

sipsak-install:
	${INSTALL_DIR} ${IDIR_SIPSAK}/usr/bin
	${INSTALL_BIN} ${WRKINST}/usr/bin/sipsak ${IDIR_SIPSAK}/usr/bin/

include ${ADK_TOPDIR}/mk/pkg-bottom.mk
