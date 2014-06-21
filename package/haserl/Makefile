# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include ${ADK_TOPDIR}/rules.mk

PKG_NAME:=		haserl
PKG_VERSION:=		0.9.33
PKG_RELEASE:=		1
PKG_MD5SUM:=		a9decddb508944d56f71dd2f821e2ec5
PKG_DESCR:=		cgi wrapper to embed shell scripts in html documents
PKG_SECTION:=		net/http
PKG_URL:=		http://haserl.sourceforge.net/
PKG_SITES:=		${MASTER_SITE_SOURCEFORGE:=haserl/}

DISTFILES:=		${PKG_NAME}-${PKG_VERSION}.tar.gz

include ${ADK_TOPDIR}/mk/package.mk

$(eval $(call PKG_template,HASERL,haserl,${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))

TARGET_CPPFLAGS+=	-DMAX_UPLOAD_KB=8192

haserl-install:
	${INSTALL_DIR} ${IDIR_HASERL}/usr/bin
	${INSTALL_BIN} ${WRKINST}/usr/bin/haserl ${IDIR_HASERL}/usr/bin/

include ${ADK_TOPDIR}/mk/pkg-bottom.mk
