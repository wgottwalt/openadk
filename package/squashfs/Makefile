# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(TOPDIR)/rules.mk

PKG_NAME:=		squashfs
PKG_VERSION:=		4.2
PKG_RELEASE:=		1
PKG_MD5SUM:=		1b7a781fb4cf8938842279bd3e8ee852
PKG_DESCR:=		squashfs filesystem utilities
PKG_SECTION:=		fs
PKG_SITES:=		${MASTER_SITE_SOURCEFORGE:=squashfs/}

DISTFILES:=		${PKG_NAME}${PKG_VERSION}.tar.gz
WRKDIST=		${WRKDIR}/$(PKG_NAME)${PKG_VERSION}

PKG_CFLINE_SQUASHFS:=	depends on ADK_HOST_ONLY

include $(TOPDIR)/mk/host.mk
include $(TOPDIR)/mk/package.mk

$(eval $(call HOST_template,SQUASHFS,squashfs,$(PKG_VERSION)-${PKG_RELEASE}))

HOST_STYLE:=		manual
HOST_MAKE_FLAGS+=	XATTR_SUPPORT=0 XZ_SUPPORT=1 EXTRA_LDFLAGS=$(LDFLAGS_FOR_BUILD)

host-build:
	(cd ${WRKBUILD}/squashfs-tools && env ${HOST_MAKE_ENV} ${MAKE} -f ${MAKE_FILE} \
		${HOST_MAKE_FLAGS} ${HOST_ALL_TARGET})

squashfs-hostinstall:
	${INSTALL_DIR} ${STAGING_HOST_DIR}/usr/bin
	${INSTALL_BIN} ${WRKBUILD}/squashfs-tools/mksquashfs \
		${STAGING_HOST_DIR}/usr/bin

include ${TOPDIR}/mk/host-bottom.mk
include ${TOPDIR}/mk/pkg-bottom.mk
