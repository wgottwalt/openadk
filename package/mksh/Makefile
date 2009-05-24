# $Id$
#-
# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include ${TOPDIR}/rules.mk

PKG_NAME=		mksh
PKG_VERSION=		35b
PKG_RELEASE=		2
DISTFILES=		${PKG_NAME}-R${PKG_VERSION}.cpio.gz
PKG_MD5SUM=		0e96cd3f8141b7abc679bbb303a8be2c
MASTER_SITES=		${MASTER_SITE_MIRBSD:distfiles/=dist/mir/mksh/}
WRKDIST=		${WRKDIR}/${PKG_NAME}

include ${TOPDIR}/mk/package.mk

$(eval $(call PKG_template,MKSH,mksh,${PKG_VERSION}-${PKG_RELEASE}))

ifeq ($(strip ${ADK_PACKAGE_MKSH_FULL}),)
TCPPFLAGS+=		-DMKSH_SMALL=1
endif

do-build:
	cd ${WRKBUILD} && CC='${TARGET_CC}' CFLAGS='${TCFLAGS}' \
	    CPPFLAGS='${TCPPFLAGS}' LDFLAGS='${TLDFLAGS}' \
	    TARGET_OS=${UNAME_S} ${BASH} ${WRKSRC}/Build.sh -Q -r

do-install:
	install -d -m 0755 ${IDIR_MKSH}/bin
	install -c -m 755 ${WRKBUILD}/mksh ${IDIR_MKSH}/bin/
	install -c -m 644 ${WRKSRC}/dot.mkshrc ${IDIR_MKSH}/.mkshrc

include ${TOPDIR}/mk/pkg-bottom.mk
