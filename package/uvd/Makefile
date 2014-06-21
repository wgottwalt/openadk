# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(ADK_TOPDIR)/rules.mk

PKG_NAME:=		uvd
PKG_VERSION:=		0.1
PKG_RELEASE:=		2
PKG_DESCR:=		udp server for version information
PKG_SECTION:=		sys/misc
PKG_URL:=		http://openadk.org/

NO_DISTFILES:=		1

include $(ADK_TOPDIR)/mk/package.mk

$(eval $(call PKG_template,UVD,uvd,$(PKG_VERSION)-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))

CONFIG_STYLE:=		manual
BUILD_STYLE:=		manual
INSTALL_STYLE:=		manual

do-build:
	${TARGET_CC} ${TARGET_CPPFLAGS} ${TARGET_CFLAGS} ${TARGET_LDFLAGS} \
		-o ${WRKBUILD}/uvd ${WRKBUILD}/uvd.c

do-install:
	${INSTALL_DIR} ${IDIR_UVD}/sbin
	${INSTALL_BIN} ${WRKBUILD}/uvd ${IDIR_UVD}/sbin

include ${ADK_TOPDIR}/mk/pkg-bottom.mk
