# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(ADK_TOPDIR)/rules.mk

PKG_NAME:=		rtmpdump
PKG_VERSION:=		2.4
PKG_RELEASE:=		1
PKG_HASH:=		cc7ff55bb3b829277b90ddb4d9b8224f9327300cede6b9557dda98267019bb9e
PKG_DESCR:=		toolkit for rtmp streams
PKG_DEPENDS:=		librtmp zlib
PKG_BUILDDEP:=		zlib
PKG_SECTION:=		mm/video
PKG_URL:=		http://rtmpdump.mplayerhq.hu/
PKG_SITES:=		http://distfiles.openadk.org/
PKG_LIBNAME:=		librtmp
PKG_OPTS:=		dev

DISTFILES:=		${PKG_NAME}-${PKG_VERSION}.tar.gz

PKG_SUBPKGS:=		RTMPDUMP LIBRTMP
PKGSD_LIBRTMP:=		library for rtmp streams
PKGSC_LIBRTMP:=		libs/video

include $(ADK_TOPDIR)/mk/package.mk

$(eval $(call PKG_template,RTMPDUMP,rtmpdump,$(PKG_VERSION)-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))
$(eval $(call PKG_template,LIBRTMP,librtmp,$(PKG_VERSION)-${PKG_RELEASE},${PKG_DEPENDS},${PKGSD_LIBRTMP},${PKGSC_LIBRTMP},${PKG_OPTS}))

CONFIG_STYLE:=		manual

rtmpdump-install:
	$(INSTALL_DIR) $(IDIR_RTMPDUMP)/usr/bin
	$(INSTALL_BIN) $(WRKINST)/usr/bin/rtmpdump \
		$(IDIR_RTMPDUMP)/usr/bin

librtmp-install:
	$(INSTALL_DIR) $(IDIR_LIBRTMP)/usr/lib
	$(CP) $(WRKINST)/usr/lib/librtmp*so.* \
		$(IDIR_LIBRTMP)/usr/lib

include ${ADK_TOPDIR}/mk/pkg-bottom.mk
