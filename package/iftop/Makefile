# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include ${TOPDIR}/rules.mk

PKG_NAME:=		iftop
PKG_VERSION:=		0.17
PKG_RELEASE:=		1
PKG_MD5SUM:=		062bc8fb3856580319857326e0b8752d
PKG_DESCR:=		display bandwith usage on an interface
PKG_SECTION:=		net
PKG_DEPENDS:=		libncurses libpcap libpthread
PKG_BUILDDEP:=		libpcap libpthread ncurses
PKG_URL:=		http://www.ex-parrot.com/~pdw/iftop/
PKG_SITES:=		http://www.ex-parrot.com/~pdw/iftop/download/

DISTFILES:=		${PKG_NAME}-${PKG_VERSION}.tar.gz

include ${TOPDIR}/mk/package.mk

$(eval $(call PKG_template,IFTOP,iftop,${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))

TARGET_LDFLAGS+=	-ltinfo

iftop-install:
	${INSTALL_DIR} ${IDIR_IFTOP}/usr/bin
	${INSTALL_BIN} ${WRKINST}/usr/sbin/iftop ${IDIR_IFTOP}/usr/bin/

include ${TOPDIR}/mk/pkg-bottom.mk
