# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(TOPDIR)/rules.mk

PKG_NAME:=		libsamplerate
PKG_VERSION:=		0.1.8
PKG_RELEASE:=		3
PKG_MD5SUM:=		1c7fb25191b4e6e3628d198a66a84f47
PKG_DESCR:=		sample rate converter for audio
PKG_SECTION:=		libs
PKG_URL:=		http://www.mega-nerd.com/SRC/
PKG_SITES:=		http://www.mega-nerd.com/SRC/
PKG_OPTS:=		dev

DISTFILES:=		${PKG_NAME}-${PKG_VERSION}.tar.gz

include $(TOPDIR)/mk/package.mk

$(eval $(call PKG_template,LIBSAMPLERATE,libsamplerate,$(PKG_VERSION)-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION},${PKG_OPTS}))

CONFIGURE_ARGS+=	--disable-sndfile

libsamplerate-install:
	$(INSTALL_DIR) $(IDIR_LIBSAMPLERATE)/usr/lib
	$(CP) $(WRKINST)/usr/lib/libsamplerate*.so* \
		$(IDIR_LIBSAMPLERATE)/usr/lib

include ${TOPDIR}/mk/pkg-bottom.mk
