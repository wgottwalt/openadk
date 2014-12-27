# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(ADK_TOPDIR)/rules.mk

PKG_NAME:=		faac
PKG_VERSION:=		1.28
PKG_RELEASE:=		1
PKG_HASH:=		c5141199f4cfb17d749c36ba8cfe4b25f838da67c22f0fec40228b6b9c3d19df
PKG_DESCR:=		aac encoder library
PKG_SECTION:=		libs/audio
PKG_URL:=		http://www.audiocoding.com/faac.html
PKG_SITES:=		${MASTER_SITE_SOURCEFORGE:=faac/}
PKG_LIBNAME:=		libfaac
PKG_OPTS:=		dev

DISTFILES:=		${PKG_NAME}-${PKG_VERSION}.tar.gz

include $(ADK_TOPDIR)/mk/package.mk

$(eval $(call PKG_template,LIBFAAC,libfaac,$(PKG_VERSION)-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION},${PKG_OPTS}))

CONFIGURE_ARGS+=	--without-mp4v2

libfaac-install:
	$(INSTALL_DIR) $(IDIR_LIBFAAC)/usr/lib
	$(CP) $(WRKINST)/usr/lib/libfaac*.so* \
		$(IDIR_LIBFAAC)/usr/lib

include ${ADK_TOPDIR}/mk/pkg-bottom.mk
