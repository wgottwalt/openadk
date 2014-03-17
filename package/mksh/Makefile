# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include ${TOPDIR}/rules.mk

PKG_NAME:=		mksh
PKG_VERSION:=		49
PKG_RELEASE:=		1
PKG_MD5SUM:=		e8c205cac72c3dc8540bbc3897421422
PKG_DESCR:=		MirBSD Korn Shell
PKG_SECTION:=		shells
PKG_URL:=		http://www.mirbsd.org/
PKG_SITES:=		${MASTER_SITE_MIRBSD:distfiles/=dist/mir/mksh/}

PKG_DFLT_MKSH:=		y if !ADK_TOOLCHAIN_ONLY

DISTFILES=		${PKG_NAME}-R${PKG_VERSION}.tgz
WRKDIST=		${WRKDIR}/${PKG_NAME}

include ${TOPDIR}/mk/package.mk

$(eval $(call PKG_template,MKSH,mksh,${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))

ifeq ($(ADK_STATIC),y)
TARGET_CFLAGS+=		-static
TARGET_LDFLAGS+=	-static
endif

TARGET_CPPFLAGS+=	-DMKSH_SMALL=1
CONFIG_STYLE:=		manual
BUILD_STYLE:=		manual
INSTALL_STYLE:=		manual

do-build:
	cd ${WRKBUILD} && CC='${TARGET_CC}' CFLAGS='${TARGET_CFLAGS}' \
	    CPPFLAGS='${TARGET_CPPFLAGS}' LDFLAGS='${TARGET_LDFLAGS}' \
	    HAVE_CAN_FSTACKPROTECTORALL=0 \
	    TARGET_OS=Linux ${BASH} ${WRKSRC}/Build.sh -Q -r -c lto

do-install:
	${INSTALL_DIR} ${IDIR_MKSH}/bin ${IDIR_MKSH}/root
	${INSTALL_BIN} ${WRKBUILD}/mksh ${IDIR_MKSH}/bin/
	${CP} ${WRKSRC}/dot.mkshrc ${IDIR_MKSH}/root/.mkshrc

include ${TOPDIR}/mk/pkg-bottom.mk
