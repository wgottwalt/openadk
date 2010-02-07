# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include ${TOPDIR}/rules.mk

PKG_NAME:=		miau
PKG_VERSION:=		0.6.5
PKG_RELEASE:=		1
PKG_MD5SUM:=		76f794889d47ad277c25e9c5bbddefa4
PKG_DESCR:=		miau is an IRC-bouncer/proxy
PKG_SECTION:=		net
PKG_URL:=		http://miau.sourceforge.net
PKG_SITES:=		${MASTER_SITE_SOURCEFORGE:=miau/}

include ${TOPDIR}/mk/package.mk

$(eval $(call PKG_template,MIAU,${PKG_NAME},${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))

CONFIGURE_ARGS+=	--enable-automode \
			--enable-releasenick \
			--enable-uptime \
			--enable-privlog \
			--enable-onconnect

post-install:
	${INSTALL_DIR} ${IDIR_MIAU}/usr/bin ${IDIR_MIAU}/etc/miau
	${INSTALL_BIN} ${WRKINST}/usr/bin/miau ${IDIR_MIAU}/usr/bin/
	${INSTALL_DATA} ./files/miaurc ${IDIR_MIAU}/etc/miau/

include ${TOPDIR}/mk/pkg-bottom.mk
