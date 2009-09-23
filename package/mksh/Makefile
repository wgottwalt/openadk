# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include ${TOPDIR}/rules.mk

PKG_NAME=		mksh
PKG_VERSION=		39
PKG_RELEASE=		1
PKG_MD5SUM=		b2eeb4fe4ccac2704e1440e53cd2672c
PKG_DESCR:=		MirBSD Korn Shell
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
	    TARGET_OS=Linux ${BASH} ${WRKSRC}/Build.sh -Q -r -combine

do-install:
	${INSTALL_DIR} ${IDIR_MKSH}/bin ${IDIR_MKSH}/root
	${INSTALL_BIN} ${WRKBUILD}/mksh ${IDIR_MKSH}/bin/
	${CP} ${WRKSRC}/dot.mkshrc ${IDIR_MKSH}/root/.mkshrc

include ${TOPDIR}/mk/pkg-bottom.mk
