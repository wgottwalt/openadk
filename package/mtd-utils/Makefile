# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(TOPDIR)/rules.mk

PKG_NAME:=		mtd-utils
PKG_VERSION:=		1.5.0
PKG_RELEASE:=		1
PKG_MD5SUM:=		a4df1ad29684be79b0fa699bdae01faf
PKG_DESCR:=		mtd-utils filesystem utilities
PKG_SECTION:=		fs
HOST_BUILDDEP:=		liblzo-host
PKG_SITES:=		http://openadk.org/distfiles/

PKG_CFLINE_MTD_UTILS:=	depends on ADK_HOST_ONLY

include $(TOPDIR)/mk/host.mk
include $(TOPDIR)/mk/package.mk

$(eval $(call HOST_template,MTD_UTILS,mtd-utils,$(PKG_VERSION)-${PKG_RELEASE}))

HOST_STYLE:=		manual
CPPFLAGS_FOR_BUILD+=	-DWITHOUT_XATTR=1 -I./include

host-build:
	(cd ${WRKBUILD} && env ${HOST_MAKE_ENV} ${MAKE} -f ${MAKE_FILE} \
		${HOST_MAKE_FLAGS} ${HOST_ALL_TARGET})

mtd-utils-hostinstall:
	${INSTALL_DIR} ${STAGING_HOST_DIR}/usr/bin
	${INSTALL_BIN} ${WRKBUILD}/mkfs.jffs2 \
		${STAGING_HOST_DIR}/usr/bin

include ${TOPDIR}/mk/host-bottom.mk
include ${TOPDIR}/mk/pkg-bottom.mk
