# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(ADK_TOPDIR)/rules.mk

PKG_NAME:=		u-boot
PKG_VERSION:=		2014.07
PKG_RELEASE:=		1
PKG_MD5SUM:=		36d4bad687edcafa396fee607e505d4e
PKG_DESCR:=		bootloader
PKG_SECTION:=		base/boot
PKG_URL:=		http://www.denx.de/wiki/U-Boot	
PKG_SITES:=		ftp://ftp.denx.de/pub/u-boot/

DISTFILES:=		${PKG_NAME}-${PKG_VERSION}.tar.bz2
PKG_SYSTEM_DEPENDS:=	!cubox-i

PKG_CFLINE_U_BOOT:=	depends on ADK_HOST_ONLY

include $(ADK_TOPDIR)/mk/host.mk
include $(ADK_TOPDIR)/mk/package.mk

$(eval $(call HOST_template,U_BOOT,u-boot,$(PKG_VERSION)-${PKG_RELEASE}))

HOST_STYLE:=		manual
HOST_MAKE_FLAGS+=	HOST_TOOLS_ONLY=yes

host-build:
	(cd ${WRKBUILD} && env ${HOST_MAKE_ENV} ${MAKE} -f ${MAKE_FILE} \
		${HOST_MAKE_FLAGS} tools $(MAKE_TRACE) )

u-boot-hostinstall:
	${INSTALL_BIN} ${WRKBUILD}/tools/mkimage \
		${STAGING_HOST_DIR}/usr/bin

include ${ADK_TOPDIR}/mk/host-bottom.mk
include ${ADK_TOPDIR}/mk/pkg-bottom.mk
