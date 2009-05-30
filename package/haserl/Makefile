# $Id$
#-
# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include ${TOPDIR}/rules.mk

PKG_NAME:=		haserl
PKG_VERSION:=		0.8.0
PKG_RELEASE:=		1
PKG_MD5SUM:=		bd9195d086566f56634c0bcbbbcbebea
PKG_DESCR:=		a CGI wrapper to embed shell scripts in HTML documents
PKG_SECTION:=		web
PKG_URL:=		http://haserl.sourceforge.net
PKG_SITES:=		${MASTER_SITE_SOURCEFORGE:=haserl/}

include ${TOPDIR}/mk/package.mk

$(eval $(call PKG_template,HASERL,${PKG_NAME},${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))

TCFLAGS+=		-DMAX_UPLOAD_KB=8192
CONFIGURE_STYLE=	gnu
BUILD_STYLE=		auto
INSTALL_STYLE=		auto

post-install:
	${INSTALL_DIR} ${IDIR_HASERL}/usr/bin
	${INSTALL_BIN} ${WRKINST}/usr/bin/haserl ${IDIR_HASERL}/usr/bin/

include ${TOPDIR}/mk/pkg-bottom.mk
