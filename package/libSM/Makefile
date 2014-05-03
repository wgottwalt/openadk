# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(TOPDIR)/rules.mk

PKG_NAME:=		libSM
PKG_VERSION:=		1.2.1
PKG_RELEASE:=		2
PKG_MD5SUM:=		1d507651e9fa50aab7ef11be9e0e2f20
PKG_DESCR:=		X11 Session Management library
PKG_SECTION:=		x11/libs
PKG_DEPENDS:=		libuuid
PKG_BUILDDEP:=		libICE util-linux
PKG_SITES:=		${MASTER_SITE_XORG}
PKG_LIBNAME:=		libsm
PKG_OPTS:=		dev

DISTFILES:=		${PKG_NAME}-${PKG_VERSION}.tar.gz

include $(TOPDIR)/mk/host.mk
include $(TOPDIR)/mk/package.mk

$(eval $(call HOST_template,LIBSM,libsm,$(PKG_VERSION)-${PKG_RELEASE}))
$(eval $(call PKG_template,LIBSM,libsm,$(PKG_VERSION)-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION},${PKG_OPTS}))

HOST_STYLE:=		auto

libsm-install:
	${INSTALL_DIR} ${IDIR_LIBSM}/usr/lib
	${CP} ${WRKINST}/usr/lib/libSM.so* ${IDIR_LIBSM}/usr/lib

include ${TOPDIR}/mk/host-bottom.mk
include ${TOPDIR}/mk/pkg-bottom.mk
