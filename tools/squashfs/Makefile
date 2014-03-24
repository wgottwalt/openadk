# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(TOPDIR)/rules.mk

PKG_NAME:=		squashfs
PKG_VERSION:=		4.2
PKG_RELEASE:=		1
PKG_MD5SUM:=		1b7a781fb4cf8938842279bd3e8ee852
PKG_SITES:=		${MASTER_SITE_SOURCEFORGE:=squashfs/}

DISTFILES:=		${PKG_NAME}${PKG_VERSION}.tar.gz
WRKDIST=		${WRKDIR}/$(PKG_NAME)${PKG_VERSION}

include ../rules.mk

install: ${STAGING_HOST_DIR}/usr/bin/mksquashfs

$(WRKBUILD)/.compiled: ${WRKDIST}/.prepared
	${MAKE} -C ${WRKBUILD}/squashfs-tools CC='${CC_FOR_BUILD}' \
		XATTR_SUPPORT=0 XZ_SUPPORT=1 CPPFLAGS_FOR_BUILD=$(CPPFLAGS_FOR_BUILD) \
		EXTRA_LDFLAGS=$(LDFLAGS_FOR_BUILD)
	@touch $@

${STAGING_HOST_DIR}/usr/bin/mksquashfs: $(WRKBUILD)/.compiled
	$(INSTALL_BIN) $(WRKBUILD)/squashfs-tools/mksquashfs \
		${STAGING_HOST_DIR}/usr/bin

include $(TOPDIR)/mk/tools.mk
