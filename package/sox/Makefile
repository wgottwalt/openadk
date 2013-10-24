# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(TOPDIR)/rules.mk

PKG_NAME:=		sox
PKG_VERSION:=		14.3.2
PKG_RELEASE:=		1
PKG_MD5SUM:=		e9d35cf3b0f8878596e0b7c49f9e8302
PKG_DESCR:=		Swiss Army knife of sound processing programs
PKG_SECTION:=		multimedia
PKG_BUILDDEP:=		zlib libmad lame alsa-lib libid3tag
PKG_DEPENDS:=		zlib libmad liblame alsa-lib libid3tag
PKG_URL:=		http://sox.sourceforge.net/
PKG_SITES:=		${MASTER_SITE_SOURCEFORGE:=sox/}

include $(TOPDIR)/mk/package.mk

$(eval $(call PKG_template,SOX,sox,$(PKG_VERSION)-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))

CONFIGURE_ARGS+=	--without-ffmpeg

sox-install:
	$(INSTALL_DIR) $(IDIR_SOX)/usr/lib
	${CP} ${WRKINST}/usr/lib/libsox.so* $(IDIR_SOX)/usr/lib
	$(INSTALL_DIR) $(IDIR_SOX)/usr/bin
	$(INSTALL_BIN) $(WRKINST)/usr/bin/sox $(IDIR_SOX)/usr/bin
	cd ${IDIR_SOX}/usr/bin; for tgt in rec play; do \
		ln sox $$tgt; \
	done

include ${TOPDIR}/mk/pkg-bottom.mk
