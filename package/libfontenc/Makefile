# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(TOPDIR)/rules.mk

PKG_NAME:=		libfontenc
PKG_VERSION:=		1.0.5
PKG_RELEASE:=		1
PKG_MD5SUM:=		0fa1988d08021225d18ced519a30d2b1
PKG_DESCR:=		helps to deal with different encodings of fonts
PKG_SECTION:=		x11
PKG_DEPENDS:=		zlib
PKG_BUILDDEP+=		xproto zlib
PKG_SITES:=		${MASTER_SITE_XORG}

include $(TOPDIR)/mk/package.mk

$(eval $(call PKG_template,LIBFONTENC,libfontenc,$(PKG_VERSION)-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))

post-install:
	${INSTALL_DIR} ${IDIR_LIBFONTENC}/usr/lib
	${CP} ${WRKINST}/usr/lib/libfontenc.so* ${IDIR_LIBFONTENC}/usr/lib/

include ${TOPDIR}/mk/pkg-bottom.mk
