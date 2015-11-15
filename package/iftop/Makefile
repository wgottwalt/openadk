# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include ${ADK_TOPDIR}/rules.mk

PKG_NAME:=		iftop
PKG_VERSION:=		0.17
PKG_RELEASE:=		1
PKG_HASH:=		d032547c708307159ff5fd0df23ebd3cfa7799c31536fa0aea1820318a8e0eac
PKG_DESCR:=		display bandwith usage on an interface
PKG_SECTION:=		net/perf
PKG_DEPENDS:=		libncurses libpcap
PKG_BUILDDEP:=		libpcap ncurses
PKG_NEEDS:=		threads
PKG_URL:=		http://www.ex-parrot.com/~pdw/iftop/
PKG_SITES:=		http://www.ex-parrot.com/~pdw/iftop/download/

DISTFILES:=		${PKG_NAME}-${PKG_VERSION}.tar.gz

include ${ADK_TOPDIR}/mk/package.mk

$(eval $(call PKG_template,IFTOP,iftop,${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))

TARGET_LDFLAGS+=	-ltinfo

iftop-install:
	${INSTALL_DIR} ${IDIR_IFTOP}/usr/bin
	${INSTALL_BIN} ${WRKINST}/usr/sbin/iftop ${IDIR_IFTOP}/usr/bin/

include ${ADK_TOPDIR}/mk/pkg-bottom.mk
