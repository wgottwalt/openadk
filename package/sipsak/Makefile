# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include ${TOPDIR}/rules.mk

PKG_NAME:=		sipsak
PKG_VERSION:=		0.9.6
PKG_RELEASE:=		2
PKG_MD5SUM:=		c4eb8e282902e75f4f040f09ea9d99d5
PKG_DESCR:=		sip stress and diagnostics utility
PKG_SECTION:=		net/voip
PKG_DEPENDS:=		libopenssl
PKG_BUILDDEP:=		openssl
PKG_URL:=		http://sourceforge.net/projects/sipsak.berlios/
PKG_SITES:=		${MASTER_SITE_SOURCEFORGE:=sipsak/}

DISTFILES:=		$(PKG_NAME)-$(PKG_VERSION)-1.tar.gz

include ${TOPDIR}/mk/package.mk

$(eval $(call PKG_template,SIPSAK,sipsak,${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))

CONFIGURE_ARGS+=	--disable-gnutls

sipsak-install:
	${INSTALL_DIR} ${IDIR_SIPSAK}/usr/bin
	${INSTALL_BIN} ${WRKINST}/usr/bin/sipsak ${IDIR_SIPSAK}/usr/bin/

include ${TOPDIR}/mk/pkg-bottom.mk
