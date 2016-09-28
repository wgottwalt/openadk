# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include ${ADK_TOPDIR}/rules.mk

PKG_NAME:=		httping
PKG_VERSION:=		2.4
PKG_RELEASE:=		1
PKG_HASH:=		dab59f02b08bfbbc978c005bb16d2db6fe21e1fc841fde96af3d497ddfc82084
PKG_DESCR:=		like ping but for http-requests
PKG_SECTION:=		net/http
PKG_DEPENDS:=		libressl
PKG_BUILDDEP:=		libressl
PKG_SITES:=		http://www.vanheusden.com/httping/

DISTFILES:=		${PKG_NAME}-${PKG_VERSION}.tgz

include ${ADK_TOPDIR}/mk/package.mk

$(eval $(call PKG_template,HTTPING,httping,${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))

CONFIG_STYLE:=		manual
TARGET_CFLAGS+=		-D_GNU_SOURCE

httping-install:
	${INSTALL_DIR} ${IDIR_HTTPING}/usr/bin
	${INSTALL_BIN} ${WRKINST}/usr/bin/httping ${IDIR_HTTPING}/usr/bin/

include ${ADK_TOPDIR}/mk/pkg-bottom.mk
