# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(TOPDIR)/rules.mk

PKG_NAME:=		libmpeg2
PKG_VERSION:=		0.5.1
PKG_RELEASE:=		3
PKG_MD5SUM:=		0f92c7454e58379b4a5a378485bbd8ef
PKG_DESCR:=		mpeg1 and mpeg2 decoding library
PKG_SECTION:=		libs/video
PKG_URL:=		http://libmpeg2.sourceforge.net/
PKG_SITES:=		http://libmpeg2.sourceforge.net/files/
PKG_OPTS:=		dev

DISTFILES:=		${PKG_NAME}-${PKG_VERSION}.tar.gz

include $(TOPDIR)/mk/package.mk

$(eval $(call PKG_template,LIBMPEG2,libmpeg2,$(PKG_VERSION)-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION},${PKG_OPTS}))

CONFIGURE_ARGS+=	--disable-sdl

libmpeg2-install:
	$(INSTALL_DIR) $(IDIR_LIBMPEG2)/usr/lib
	$(CP) $(WRKINST)/usr/lib/libmpeg2*.so* \
		$(IDIR_LIBMPEG2)/usr/lib

include ${TOPDIR}/mk/pkg-bottom.mk
