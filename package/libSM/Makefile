# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(ADK_TOPDIR)/rules.mk

PKG_NAME:=		libSM
PKG_VERSION:=		1.2.1
PKG_RELEASE:=		2
PKG_HASH:=		c7f3660fd5c0ea80ef311e46261eca7c3025ad02c17e545d690a73d70deec7d5
PKG_DESCR:=		session management library
PKG_SECTION:=		x11/libs
PKG_DEPENDS:=		libuuid
PKG_BUILDDEP:=		libICE util-linux
HOST_BUILDDEP:=		libICE-host xtrans-host
PKG_SITES:=		${MASTER_SITE_XORG}
PKG_LIBNAME:=		libsm
PKG_OPTS:=		dev

DISTFILES:=		${PKG_NAME}-${PKG_VERSION}.tar.gz

include $(ADK_TOPDIR)/mk/host.mk
include $(ADK_TOPDIR)/mk/package.mk

$(eval $(call HOST_template,LIBSM,libsm,$(PKG_VERSION)-${PKG_RELEASE}))
$(eval $(call PKG_template,LIBSM,libsm,$(PKG_VERSION)-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION},${PKG_OPTS}))

HOST_STYLE:=		auto

libsm-install:
	${INSTALL_DIR} ${IDIR_LIBSM}/usr/lib
	${CP} ${WRKINST}/usr/lib/libSM.so* ${IDIR_LIBSM}/usr/lib

include ${ADK_TOPDIR}/mk/host-bottom.mk
include ${ADK_TOPDIR}/mk/pkg-bottom.mk
