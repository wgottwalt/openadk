# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(ADK_TOPDIR)/rules.mk

PKG_NAME:=		libsamplerate
PKG_VERSION:=		0.1.8
PKG_RELEASE:=		3
PKG_HASH:=		93b54bdf46d5e6d2354b7034395fe329c222a966790de34520702bb9642f1c06
PKG_DESCR:=		sample rate converter for audio
PKG_SECTION:=		libs/audio
PKG_URL:=		http://www.mega-nerd.com/SRC/
PKG_SITES:=		http://www.mega-nerd.com/SRC/
PKG_OPTS:=		dev

DISTFILES:=		${PKG_NAME}-${PKG_VERSION}.tar.gz

include $(ADK_TOPDIR)/mk/package.mk

$(eval $(call PKG_template,LIBSAMPLERATE,libsamplerate,$(PKG_VERSION)-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION},${PKG_OPTS}))

CONFIGURE_ARGS+=	--disable-sndfile

libsamplerate-install:
	$(INSTALL_DIR) $(IDIR_LIBSAMPLERATE)/usr/lib
	$(CP) $(WRKINST)/usr/lib/libsamplerate*.so* \
		$(IDIR_LIBSAMPLERATE)/usr/lib

include ${ADK_TOPDIR}/mk/pkg-bottom.mk
