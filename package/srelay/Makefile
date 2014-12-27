# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include ${ADK_TOPDIR}/rules.mk

PKG_NAME:=		srelay
PKG_VERSION:=		0.4.7p3
PKG_RELEASE:=		1
PKG_HASH:=		6dc818894046ee3d20e11054151c069b8ef16f3aba816331f4f1f578d8bf4761
PKG_DESCR:=		socks 4/5 proxy server
PKG_SECTION:=		net/proxy
PKG_SITES:=		${MASTER_SITE_SOURCEFORGE:=socks-relay/}

DISTFILES:=		${PKG_NAME}-${PKG_VERSION}.tar.gz

include ${ADK_TOPDIR}/mk/package.mk

$(eval $(call PKG_template,SRELAY,srelay,${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))

INSTALL_STYLE:=		manual

CONFIGURE_ARGS+=	--disable-thread \
			--with-libwrap=no

do-install:
	${INSTALL_DIR} ${IDIR_SRELAY}/usr/bin ${IDIR_SRELAY}/etc
	${INSTALL_DATA} ./files/srelay.conf ${IDIR_SRELAY}/etc
	${INSTALL_BIN} ${WRKBUILD}/srelay ${IDIR_SRELAY}/usr/bin

include ${ADK_TOPDIR}/mk/pkg-bottom.mk
