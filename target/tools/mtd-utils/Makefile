# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(TOPDIR)/rules.mk

PKG_NAME:=		mtd-utils
PKG_VERSION:=		1.5.0
PKG_RELEASE:=		1
PKG_MD5SUM:=		a4df1ad29684be79b0fa699bdae01faf
PKG_SITES:=		http://openadk.org/distfiles/

include ../rules.mk

all: ${STAGING_HOST_DIR}/bin/mkfs.jffs2

$(WRKBUILD)/.compiled: ${WRKDIST}/.prepared
	${MAKE} -C ${WRKBUILD} CC='${CC_FOR_BUILD}' CPPFLAGS='-DWITHOUT_XATTR=1 -I./include'
	touch $@

${STAGING_HOST_DIR}/bin/mkfs.jffs2: $(WRKBUILD)/.compiled
	$(INSTALL_BIN) $(WRKBUILD)/mkfs.jffs2 \
		${STAGING_HOST_DIR}/bin

include $(TOPDIR)/mk/tools.mk
