# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include ${ADK_TOPDIR}/rules.mk

PKG_NAME:=		httping
PKG_VERSION:=		1.4.1
PKG_RELEASE:=		1
PKG_MD5SUM:=		bde1ff3c01343d2371d8f34fbf8a1d9a
PKG_DESCR:=		like ping but for http-requests
PKG_SECTION:=		net/http
PKG_DEPENDS:=		libopenssl
PKG_BUILDDEP:=		openssl
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
