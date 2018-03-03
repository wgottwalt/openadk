# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(ADK_TOPDIR)/rules.mk

PKG_NAME:=		squeezelite
PKG_VERSION:=		37f5fe68b05d155cdb8ae68435e3ae13c6ef2403
PKG_RELEASE:=		1
PKG_GIT:=		hash
PKG_DESCR:=		headless squeezebox emulator
PKG_SECTION:=		mm/audio
PKG_DEPENDS:=		mpg123 flac alsa-lib libvorbis libmad libfaad2
PKG_BUILDDEP:=		alsa-lib libmad flac libvorbis mpg123 faad2
PKG_NEEDS:=		threads
PKG_URL:=		https://github.com/ralph-irving/squeezelite
PKG_SITES:=		https://github.com/ralph-irving/squeezelite.git

include $(ADK_TOPDIR)/mk/package.mk

$(eval $(call PKG_template,SQUEEZELITE,squeezelite,$(PKG_VERSION)-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))

CONFIG_STYLE:=		manual
INSTALL_STYLE:=		manual

squeezelite-install:
	$(INSTALL_DIR) $(IDIR_SQUEEZELITE)/usr/bin
	$(INSTALL_BIN) $(WRKBUILD)/squeezelite \
		$(IDIR_SQUEEZELITE)/usr/bin

include ${ADK_TOPDIR}/mk/pkg-bottom.mk
