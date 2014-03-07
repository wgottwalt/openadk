# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(TOPDIR)/rules.mk

PKG_NAME:=		mksh
PKG_VERSION:=		49
PKG_RELEASE:=		1
PKG_MD5SUM:=		e8c205cac72c3dc8540bbc3897421422
PKG_SITES:=		${MASTER_SITE_MIRBSD:distfiles/=dist/mir/mksh/}

DISTFILES=		${PKG_NAME}-R${PKG_VERSION}.tgz
WRKDIST=		${WRKDIR}/${PKG_NAME}

include ../rules.mk

install: ${STAGING_HOST_DIR}/usr/bin/mksh

$(WRKBUILD)/.compiled: ${WRKDIST}/.prepared
	cd ${WRKBUILD} && CC='${TARGET_CC}' CFLAGS='${TARGET_CFLAGS}' \
	    CPPFLAGS='${TARGET_CPPFLAGS}' LDFLAGS='${TARGET_LDFLAGS}' \
	    HAVE_CAN_FSTACKPROTECTORALL=0 \
	    TARGET_OS=Linux ${BASH} ${WRKSRC}/Build.sh -Q -r -c lto
	touch $@

${STAGING_HOST_DIR}/usr/bin/mksh: $(WRKBUILD)/.compiled
	${INSTALL_BIN} ${WRKBUILD}/mksh \
		${STAGING_HOST_DIR}/usr/bin

include $(TOPDIR)/mk/tools.mk
