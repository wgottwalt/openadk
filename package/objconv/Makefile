# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(ADK_TOPDIR)/rules.mk

PKG_NAME:=		objconv
PKG_VERSION:=		2.16
PKG_RELEASE:=		1
PKG_HASH:=		4190c577ee973ef7895b2498cd4a1f3dd8d7bef31db2a0867a42f9f98614cb78
PKG_DESCR:=		converting object files between binary formats
PKG_SECTION:=		dev/tools
PKG_SITES:=		https://github.com/vertis/objconv/archive/
DISTFILES:=		$(PKG_VERSION).tar.gz

PKG_CFLINE_OBJCONV:=	depends on ADK_HOST_ONLY

include $(ADK_TOPDIR)/mk/host.mk
include $(ADK_TOPDIR)/mk/package.mk

$(eval $(call HOST_template,OBJCONV,objconv,$(PKG_VERSION)-${PKG_RELEASE}))

HOST_STYLE:=		manual

host-build:
	$(HOST_CXX) -O2 -o ${WRKBUILD}/objconv ${WRKBUILD}/src/*.cpp

objconv-hostinstall:
	${INSTALL_DIR} ${STAGING_HOST_DIR}/usr/bin
	${INSTALL_BIN} ${WRKBUILD}/objconv ${STAGING_HOST_DIR}/usr/bin

include ${ADK_TOPDIR}/mk/host-bottom.mk
include ${ADK_TOPDIR}/mk/pkg-bottom.mk
