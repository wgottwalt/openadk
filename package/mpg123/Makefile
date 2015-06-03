# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(ADK_TOPDIR)/rules.mk

PKG_NAME:=		mpg123
PKG_VERSION:=		1.22.2
PKG_RELEASE:=		1
PKG_HASH:=		6d1e2487777114ba8a73c543f355cacfa2055646724000fc195ac9e64c843744
PKG_DESCR:=		mp3 console player
PKG_SECTION:=		mm/audio
PKG_DEPENDS:=		libpthread librt alsa-lib
PKG_BUILDDEP:=		alsa-lib
PKG_URL:=		http://www.mpg123.de/
PKG_SITES:=		http://www.mpg123.de/download/

DISTFILES:=             ${PKG_NAME}-${PKG_VERSION}.tar.bz2

include $(ADK_TOPDIR)/mk/package.mk

$(eval $(call PKG_template,MPG123,mpg123,$(PKG_VERSION)-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))

AUTOTOOL_STYLE:=	autoreconf

ifeq ($(ADK_CPU_I486),y)
CONFIGURE_ARGS+=	--with-cpu=i486
endif
ifeq ($(ADK_CPU_I586),y)
CONFIGURE_ARGS+=	--with-cpu=i586
endif
ifeq ($(ADK_TARGET_CPU_WITH_NEON),y)
CONFIGURE_ARGS+=	--with-cpu=neon
endif

TARGET_CPPFLAGS+=	-D_GNU_SOURCE -D_POSIX_SOURCE
CONFIGURE_ARGS+=	--disable-shared \
			--with-default-audio=alsa

mpg123-install:
	$(INSTALL_DIR) $(IDIR_MPG123)/usr/bin
	$(INSTALL_BIN) $(WRKINST)/usr/bin/mpg123 \
		$(IDIR_MPG123)/usr/bin

include ${ADK_TOPDIR}/mk/pkg-bottom.mk
