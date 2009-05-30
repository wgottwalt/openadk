# $Id$
#-
# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include ${TOPDIR}/rules.mk

PKG_NAME=		mksh
PKG_VERSION=		38
PKG_RELEASE=		1
PKG_MD5SUM=		e2fa1f50690abf763cc3e4d8e1612728
PKG_DESCR:=		popular MirOS KSH
PKG_SECTION:=		shells
PKG_URL:=		http://www.mirbsd.org
PKG_SITES=		${MASTER_SITE_MIRBSD:distfiles/=dist/mir/mksh/}

DISTFILES=		${PKG_NAME}-R${PKG_VERSION}.cpio.gz
WRKDIST=		${WRKDIR}/${PKG_NAME}

include ${TOPDIR}/mk/package.mk

$(eval $(call PKG_template,MKSH,${PKG_NAME},${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))

ifeq ($(strip ${ADK_PACKAGE_MKSH_FULL}),)
TCPPFLAGS+=		-DMKSH_SMALL=1
endif

do-build:
	cd ${WRKBUILD} && CC='${TARGET_CC}' CFLAGS='${TCFLAGS}' \
	    CPPFLAGS='${TCPPFLAGS}' LDFLAGS='${TLDFLAGS}' \
	    TARGET_OS=Linux ${BASH} ${WRKSRC}/Build.sh -Q -r

do-install:
	install -d -m 0755 ${IDIR_MKSH}/bin
	install -c -m 755 ${WRKBUILD}/mksh ${IDIR_MKSH}/bin/
	install -c -m 644 ${WRKSRC}/dot.mkshrc ${IDIR_MKSH}/.mkshrc

include ${TOPDIR}/mk/pkg-bottom.mk
