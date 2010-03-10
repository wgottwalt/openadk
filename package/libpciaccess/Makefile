# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(TOPDIR)/rules.mk

PKG_NAME:=		libpciaccess
PKG_VERSION:=		0.11.0
PKG_RELEASE:=		1
PKG_MD5SUM:=		8f7ea197384e5ddd1c355f55e639f677
PKG_DESCR:=		X.org libpciaccess library
PKG_SECTION:=		x11
PKG_SITES:=		http://xorg.freedesktop.org/archive/individual/lib/

include $(TOPDIR)/mk/package.mk

$(eval $(call PKG_template,LIBPCIACCESS,${PKG_NAME},$(PKG_VERSION)-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))

post-install:
	${INSTALL_DIR} ${IDIR_LIBPCIACCESS}/usr/lib
	${CP} ${WRKINST}/usr/lib/libpciaccess.so* \
		${IDIR_LIBPCIACCESS}/usr/lib/

include ${TOPDIR}/mk/pkg-bottom.mk
