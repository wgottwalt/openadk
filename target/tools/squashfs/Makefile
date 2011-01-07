# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(TOPDIR)/rules.mk

PKG_NAME:=		squashfs
PKG_VERSION:=		4.0
PKG_RELEASE:=		2
PKG_MD5SUM:=		a3c23391da4ebab0ac4a75021ddabf96
PKG_SITES:=		${MASTER_SITE_SOURCEFORGE:=squashfs/}
DISTFILES:=		${PKG_NAME}${PKG_VERSION}.tar.gz
WRKDIST=		${WRKDIR}/$(PKG_NAME)${PKG_VERSION}

include ../rules.mk

$(WRKBUILD)/.compiled: ${WRKDIST}/.prepared
	${MAKE} -C ${WRKBUILD}/squashfs-tools CC='${HOSTCC}'
	touch $@

${STAGING_HOST_DIR}/bin/mksquashfs: $(WRKBUILD)/.compiled
	$(INSTALL_BIN) $(WRKBUILD)/squashfs-tools/mksquashfs \
		${STAGING_HOST_DIR}/bin

install: ${STAGING_HOST_DIR}/bin/mksquashfs

include $(TOPDIR)/mk/tools.mk
