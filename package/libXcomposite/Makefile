# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(TOPDIR)/rules.mk

PKG_NAME:=		libXcomposite
PKG_VERSION:=		0.4.3
PKG_RELEASE:=		2
PKG_MD5SUM:=		b93dac50c86db6eba3f72e949f5bed2a
PKG_DESCR:=		composite library
PKG_SECTION:=		x11/libs
PKG_BUILDDEP:=		libX11 compositeproto libXfixes
PKG_SITES:=		${MASTER_SITE_XORG}
PKG_LIBNAME:=		libxcomposite
PKG_OPTS:=		dev

DISTFILES:=		${PKG_NAME}-${PKG_VERSION}.tar.gz

ifeq ($(ADK_STATIC),y)
PKG_OPTS+=		libonly
endif

include $(TOPDIR)/mk/package.mk

$(eval $(call PKG_template,LIBXCOMPOSITE,libxcomposite,$(PKG_VERSION)-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION},${PKG_OPTS}))

libxcomposite-install:
	${INSTALL_DIR} ${IDIR_LIBXCOMPOSITE}/usr/lib
	${CP} ${WRKINST}/usr/lib/libXcomposite.so* ${IDIR_LIBXCOMPOSITE}/usr/lib/

include ${TOPDIR}/mk/pkg-bottom.mk
