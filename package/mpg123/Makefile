# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(TOPDIR)/rules.mk

PKG_NAME:=		mpg123
PKG_VERSION:=		1.12.1
PKG_RELEASE:=		2
PKG_MD5SUM:=		e7d810a75d22954169f1530a436aca4c
PKG_DESCR:=		mp3 console player
PKG_SECTION:=		sound
PKG_DEPENDS:=		libpthread alsa-lib libltdl
PKG_BUILDDEP+=		alsa-lib
PKG_URL:=		http://www.mpg123.de/
PKG_SITES:=		${MASTER_SITE_SOURCEFORGE:=mpg123/}

DISTFILES:=             ${PKG_NAME}-${PKG_VERSION}.tar.bz2

include $(TOPDIR)/mk/package.mk

$(eval $(call PKG_template,MPG123,$(PKG_NAME),$(PKG_VERSION)-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))

post-install:
	$(INSTALL_DIR) $(IDIR_MPG123)/usr/bin $(IDIR_MPG123)/usr/lib
	$(INSTALL_DIR) $(IDIR_MPG123)/usr/lib/mpg123
	$(CP) $(WRKINST)/usr/lib/libmpg123.so* $(IDIR_MPG123)/usr/lib
	$(CP) $(WRKINST)/usr/lib/mpg123/*.la $(IDIR_MPG123)/usr/lib/mpg123
	$(CP) $(WRKINST)/usr/lib/mpg123/*.so $(IDIR_MPG123)/usr/lib/mpg123
	$(INSTALL_BIN) $(WRKINST)/usr/bin/mpg123 \
		$(IDIR_MPG123)/usr/bin

include ${TOPDIR}/mk/pkg-bottom.mk
