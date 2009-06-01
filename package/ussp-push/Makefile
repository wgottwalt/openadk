# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include ${TOPDIR}/rules.mk

PKG_NAME:=		ussp-push
PKG_VERSION:=		0.11
PKG_RELEASE:=		1
PKG_MD5SUM:=		5c44983ee27809867041feff6bb4423a
PKG_DESCR:=		OBEX push command
PKG_SECTION:=		bluetooth
PKG_DEPENDS:=		openobex
PKG_SITES:=		http://xmailserver.org/

include ${TOPDIR}/mk/package.mk

$(eval $(call PKG_template,USSP_PUSH,${PKG_NAME},${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))

CONFIGURE_STYLE:=	gnu
BUILD_STYLE:=		auto
INSTALL_STYLE:=		auto
MAKE_FLAGS+=		OBEXINC="${TCPPFLAGS}" \
			OBEXLIB="${TLDFLAGS} -lopenobex -lbluetooth"

post-install:
	${INSTALL_DIR} ${IDIR_USSP_PUSH}/usr/bin
	${INSTALL_BIN} ${WRKINST}/usr/bin/ussp-push ${IDIR_USSP_PUSH}/usr/bin/

include ${TOPDIR}/mk/pkg-bottom.mk
