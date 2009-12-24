# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include ${TOPDIR}/rules.mk

PKG_NAME:=		gkrellmd
PKG_VERSION:=		2.3.2
PKG_RELEASE:=		1
PKG_BUILDDEP+=		glib
PKG_MD5SUM:=		db8a983a60577a6b4886db96d6def011
PKG_DESCR:=		The GNU Krell Monitors Server
PKG_SECTION:=		net
PKG_DEPENDS:=		glib libpthread
PKG_URL:=		http://members.dslextreme.com/users/billw/gkrellm/gkrellm.html
PKG_SITES:=		http://members.dslextreme.com/users/billw/gkrellm/

DISTFILES:=		gkrellm-${PKG_VERSION}.tar.gz
WRKDIST=		${WRKDIR}/gkrellm-${PKG_VERSION}/server

include ${TOPDIR}/mk/package.mk

$(eval $(call PKG_template,GKRELLMD,${PKG_NAME},${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))

BUILD_STYLE=	auto

do-install:
	${INSTALL_DIR} ${IDIR_GKRELLMD}/usr/bin ${IDIR_GKRELLMD}/etc
	${INSTALL_BIN} ${WRKBUILD}/gkrellmd ${IDIR_GKRELLMD}/usr/bin/
	${INSTALL_DATA} ${WRKSRC}/gkrellmd.conf ${IDIR_GKRELLMD}/etc

include ${TOPDIR}/mk/pkg-bottom.mk
