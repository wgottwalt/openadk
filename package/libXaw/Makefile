# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(TOPDIR)/rules.mk

PKG_NAME:=		libXaw
PKG_VERSION:=		1.0.7
PKG_RELEASE:=		1
PKG_BUILDDEP+=		libXext libXmu libXpm
PKG_MD5SUM:=		67662e6b2dceb2907159215c83364c5a
PKG_DESCR:=		X11 Athena Widget library
PKG_SECTION:=		x11
PKG_SITES:=		${MASTER_SITE_XORG}

include $(TOPDIR)/mk/package.mk

$(eval $(call PKG_template,LIBXAW,${PKG_NAME},$(PKG_VERSION)-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))

CONFIGURE_ARGS+=	--disable-docs

post-install:
	${INSTALL_DIR} ${IDIR_LIBXAW}/usr/lib
	${CP} ${WRKINST}/usr/lib/libXaw*.so* ${IDIR_LIBXAW}/usr/lib/

include ${TOPDIR}/mk/pkg-bottom.mk
