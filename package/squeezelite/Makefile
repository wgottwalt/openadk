# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(ADK_TOPDIR)/rules.mk

PKG_NAME:=		squeezelite
# git hash f2b5e89c1ea3904498cd8649a146c2aa1a748996
# from https://code.google.com/p/squeezelite/
PKG_VERSION:=		1.6.5
PKG_RELEASE:=		1
PKG_HASH:=		26ba3220b5e3c029feffadd15905296551898ff6953098d05bc7e6598e0cf93b
PKG_DESCR:=		headless squeezebox emulator
PKG_SECTION:=		mm/audio
PKG_DEPENDS:=		libflac alsa-lib libvorbis libmad
PKG_DEPENDS+=		libpthread librt libfaad2
PKG_BUILDDEP:=		alsa-lib libmad flac libvorbis mpg123
PKG_BUILDDEP+=		faad2
PKG_URL:=		http://code.google.com/p/squeezelite/
PKG_SITES:=		http://openadk.org/distfiles/

include $(ADK_TOPDIR)/mk/package.mk

$(eval $(call PKG_template,SQUEEZELITE,squeezelite,$(PKG_VERSION)-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))

TARGET_CPPFLAGS+=       -D_GNU_SOURCE -D_POSIX_SOURCE
TARGET_LDFLAGS+=	-ldl
CONFIG_STYLE:=		manual
INSTALL_STYLE:=		manual

squeezelite-install:
	$(INSTALL_DIR) $(IDIR_SQUEEZELITE)/usr/bin
	$(INSTALL_BIN) $(WRKBUILD)/squeezelite \
		$(IDIR_SQUEEZELITE)/usr/bin

include ${ADK_TOPDIR}/mk/pkg-bottom.mk
