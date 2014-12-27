# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include ${ADK_TOPDIR}/rules.mk

PKG_NAME:=		cgilib
PKG_VERSION:=		0.7
PKG_RELEASE:=		3
PKG_HASH:=		09b7d71bd1eea10bb404cd665fd5abe69282144ce01d96f2863c85fd42d5d692
PKG_DESCR:=		simple cgi library
PKG_SECTION:=		libs/net
PKG_URL:=		http://www.infodrom.org/projects/cgilib/
PKG_SITES:=		http://www.infodrom.org/projects/cgilib/download/
PKG_OPTS:=		dev

DISTFILES:=		${PKG_NAME}-${PKG_VERSION}.tar.gz

include ${ADK_TOPDIR}/mk/package.mk

$(eval $(call PKG_template,CGILIB,cgilib,${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION},${PKG_OPTS}))

AUTOTOOL_STYLE:=	autoreconf

post-patch:
	touch $(WRKBUILD)/NEWS

cgilib-install:
	${INSTALL_DIR} ${IDIR_CGILIB}/usr/lib
	${CP} ${WRKINST}/usr/lib/libcgi.so* ${IDIR_CGILIB}/usr/lib/

include ${ADK_TOPDIR}/mk/pkg-bottom.mk
