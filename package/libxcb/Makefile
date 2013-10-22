# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(TOPDIR)/rules.mk

PKG_NAME:=		libxcb
PKG_VERSION:=		1.7
PKG_RELEASE:=		2
PKG_MD5SUM:=		f715e53c9c1b25f856d14d6123663d96
PKG_DESCR:=		X11 keyboard library
PKG_SECTION:=		x11/libs
PKG_BUILDDEP:=		python2 libpthread-stubs libxslt libXau xcb-proto
PKG_SITES:=		${MASTER_SITE_XORG}
PKG_OPTS:=		dev

include $(TOPDIR)/mk/package.mk

$(eval $(call PKG_template,LIBXCB,libxcb,${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION},${PKG_OPTS}))

include $(TOPDIR)/mk/python.mk

TARGET_CFLAGS:=         $(filter-out -flto,$(TARGET_CFLAGS))
CONFIGURE_ENV+=		PYTHON=$(PYTHON)

libxcb-install:
	${INSTALL_DIR} ${IDIR_LIBXCB}/usr/lib
	${CP} ${WRKINST}/usr/lib/libxcb*.so* ${IDIR_LIBXCB}/usr/lib

include ${TOPDIR}/mk/pkg-bottom.mk
