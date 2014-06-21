# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(ADK_TOPDIR)/rules.mk

PKG_NAME:=		mkimage
PKG_VERSION:=		0.1
PKG_RELEASE:=		1
PKG_MD5SUM:=		1b7a781fb4cf8938842279bd3e8ee852
PKG_DESCR:=		stripped down mkimage utility
PKG_SECTION:=		sys/misc

NO_DISTFILES:=		1

PKG_CFLINE_MKIMAGE:=	depends on ADK_HOST_ONLY

include $(ADK_TOPDIR)/mk/host.mk
include $(ADK_TOPDIR)/mk/package.mk

$(eval $(call HOST_template,MKIMAGE,mkimage,$(PKG_VERSION)-${PKG_RELEASE}))

HOST_STYLE:=		manual

host-build:
	$(HOST_CC) $(HOST_CFLAGS) -o ${WRKBUILD}/mkimage \
		${WRKBUILD}/mkimage.c ${WRKBUILD}/crc32.c

mkimage-hostinstall:
	${INSTALL_DIR} ${STAGING_HOST_DIR}/usr/bin
	${INSTALL_BIN} ${WRKBUILD}/mkimage \
		${STAGING_HOST_DIR}/usr/bin

include ${ADK_TOPDIR}/mk/host-bottom.mk
include ${ADK_TOPDIR}/mk/pkg-bottom.mk
