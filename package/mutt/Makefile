# $Id$
#-
# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include ${TOPDIR}/rules.mk

PKG_NAME:=		mutt
PKG_VERSION:=		1.5.19
PKG_RELEASE:=		1
PKG_MD5SUM:=		73b3747bc7f7c805921e8d24ebac693f
PKG_DESCR:=		Mail text client
PKG_SECTION:=		text
PKG_DEPENDS:=		libncurses libopenssl
PKG_URL:=		http://www.mutt.org
PKG_SITES:=		${MASTER_SITE_SOURCEFORGE:=mutt/}

include ${TOPDIR}/mk/package.mk

$(eval $(call PKG_template,MUTT,${PKG_NAME},${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))

CONFIGURE_STYLE:=	gnu
CONFIGURE_ARGS+=	--includedir=${WRKBUILD}/. \
			--oldincludedir=${WRKBUILD}/. \
			--enable-pop \
			--enable-imap \
			--with-ssl
BUILD_STYLE:=		auto
MAKE_FLAGS+=		CC="${TARGET_CC}"
#ALL_TARGET:=

do-install:
	${INSTALL_DIR} ${IDIR_MUTT}/usr/bin
	${INSTALL_BIN} ${WRKBUILD}/${PKG_NAME} ${IDIR_MUTT}/usr/bin/
ifeq (${ADK_PACKAGE_GPG},y)
	${INSTALL_BIN} ${WRKBUILD}/pgpewrap ${IDIR_MUTT}/usr/bin/
endif

include ${TOPDIR}/mk/pkg-bottom.mk
