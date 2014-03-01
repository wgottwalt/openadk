# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(TOPDIR)/rules.mk

PKG_NAME:=		genext2fs
PKG_VERSION:=		1.4.1
PKG_RELEASE:=		1
PKG_MD5SUM:=		b7b6361bcce2cedff1ae437fadafe53b
PKG_SITES:=		${MASTER_SITE_SOURCEFORGE:=genext2fs/}

include ../rules.mk

install: ${STAGING_HOST_DIR}/usr/bin/genext2fs

$(WRKBUILD)/.compiled: ${WRKDIST}/.prepared
	(cd ${WRKBUILD}; ./configure)
	${MAKE} -C ${WRKBUILD} CC='${CC_FOR_BUILD}'
	touch $@

${STAGING_HOST_DIR}/usr/bin/genext2fs: $(WRKBUILD)/.compiled
	$(INSTALL_BIN) $(WRKBUILD)/genext2fs \
		${STAGING_HOST_DIR}/usr/bin

include $(TOPDIR)/mk/tools.mk
