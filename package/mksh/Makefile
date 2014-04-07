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

include ${TOPDIR}/mk/host.mk
include ${TOPDIR}/mk/package.mk

$(eval $(call HOST_template,MKSH,mksh,${PKG_VERSION}-${PKG_RELEASE}))
$(eval $(call PKG_template,MKSH,mksh,${PKG_VERSION}-${PKG_RELEASE},,${PKG_DESCR},${PKG_SECTION}))

TARGET_CPPFLAGS+=	-DMKSH_SMALL=1
TARGET_LDFLAGS+=	-static-libgcc

HOST_STYLE:=		manual
CONFIG_STYLE:=		manual
BUILD_STYLE:=		manual
INSTALL_STYLE:=		manual

host-build:
	cd ${WRKBUILD} && HAVE_CAN_FSTACKPROTECTORALL=0 \
	    TARGET_OS=Linux ${BASH} ${WRKSRC}/Build.sh -Q -r -c lto

mksh-hostinstall:
	${INSTALL_DIR} ${STAGING_HOST_DIR}/usr/bin
	${INSTALL_BIN} ${WRKBUILD}/mksh \
		${STAGING_HOST_DIR}/usr/bin

do-build:
	cd ${WRKBUILD} && CC='${TARGET_CC}' CFLAGS='${TARGET_CFLAGS}' \
	    CPPFLAGS='${TARGET_CPPFLAGS}' LDFLAGS='${TARGET_LDFLAGS}' \
	    HAVE_CAN_FSTACKPROTECTORALL=0 \
	    TARGET_OS=Linux ${BASH} ${WRKSRC}/Build.sh -Q -r -c lto

mksh-install:
	${INSTALL_DIR} ${IDIR_MKSH}/bin ${IDIR_MKSH}/root
	${INSTALL_BIN} ${WRKBUILD}/mksh ${IDIR_MKSH}/bin/
	${CP} ${WRKSRC}/dot.mkshrc ${IDIR_MKSH}/root/.mkshrc

include ${TOPDIR}/mk/host-bottom.mk
include ${TOPDIR}/mk/pkg-bottom.mk
