# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(TOPDIR)/rules.mk

PKG_NAME:=		squeezelite
PKG_VERSION:=		1.5
PKG_RELEASE:=		3
PKG_MD5SUM:=		7605af4d64291495645f88575a564475
PKG_DESCR:=		headless squeezebox emulator
PKG_SECTION:=		multimedia
PKG_DEPENDS:=		libflac alsa-lib libvorbis libmad
PKG_DEPENDS+=		libpthread librt libfaad2
PKG_BUILDDEP:=		alsa-lib libmad flac libvorbis mpg123
PKG_BUILDDEP+=		faad2
PKG_URL:=		http://code.google.com/p/squeezelite/
PKG_SITES:=		http://openadk.org/distfiles/

PKG_LIBC_DEPENDS:=	glibc musl

include $(TOPDIR)/mk/package.mk

$(eval $(call PKG_template,SQUEEZELITE,squeezelite,$(PKG_VERSION)-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))

TARGET_CPPFLAGS+=       -D_GNU_SOURCE -D_POSIX_SOURCE
CONFIG_STYLE:=		manual
INSTALL_STYLE:=		manual

squeezelite-install:
	$(INSTALL_DIR) $(IDIR_SQUEEZELITE)/usr/bin
	$(INSTALL_BIN) $(WRKBUILD)/squeezelite \
		$(IDIR_SQUEEZELITE)/usr/bin

include ${TOPDIR}/mk/pkg-bottom.mk
