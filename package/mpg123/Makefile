# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(TOPDIR)/rules.mk

PKG_NAME:=		mpg123
PKG_VERSION:=		1.20.1
PKG_RELEASE:=		1
PKG_MD5SUM:=		1b3e8765aa608e306ede1ec507b67b23
PKG_DESCR:=		mp3 console player
PKG_SECTION:=		mm/audio
PKG_DEPENDS:=		libpthread alsa-lib
PKG_BUILDDEP:=		alsa-lib
PKG_URL:=		http://www.mpg123.de/
PKG_SITES:=		${MASTER_SITE_SOURCEFORGE:=mpg123/}

DISTFILES:=             ${PKG_NAME}-${PKG_VERSION}.tar.bz2

include $(TOPDIR)/mk/package.mk

$(eval $(call PKG_template,MPG123,mpg123,$(PKG_VERSION)-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))

ifeq ($(ADK_CPU_I486),y)
CONFIGURE_ARGS+=	--with-cpu=i486
endif
ifeq ($(ADK_CPU_I586),y)
CONFIGURE_ARGS+=	--with-cpu=i586
endif
ifeq ($(ADK_CPU_CORTEX_A9),y)
CONFIGURE_ARGS+=	--with-cpu=neon
endif

TARGET_CPPFLAGS+=	-D_GNU_SOURCE -D_POSIX_SOURCE
CONFIGURE_ARGS+=	--disable-shared \
			--with-default-audio=alsa

mpg123-install:
	$(INSTALL_DIR) $(IDIR_MPG123)/usr/bin
	$(INSTALL_BIN) $(WRKINST)/usr/bin/mpg123 \
		$(IDIR_MPG123)/usr/bin

include ${TOPDIR}/mk/pkg-bottom.mk
