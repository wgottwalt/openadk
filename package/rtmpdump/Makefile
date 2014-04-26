# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(TOPDIR)/rules.mk

PKG_NAME:=		rtmpdump
PKG_VERSION:=		2.4
PKG_RELEASE:=		1
PKG_MD5SUM:=		61509a2ae8987691f1fa28175461be96
PKG_DESCR:=		toolkit for RTMP streams
PKG_DEPENDS:=		librtmp zlib libopenssl
PKG_BUILDDEP:=		openssl zlib
PKG_SECTION:=		multimedia
PKG_URL:=		http://rtmpdump.mplayerhq.hu/
PKG_SITES:=		http://www.openadk.org/distfiles
PKG_LIBNAME:=		librtmp
PKG_OPTS:=		dev

DISTFILES:=		${PKG_NAME}-${PKG_VERSION}.tar.gz

PKG_SUBPKGS:=		RTMPDUMP LIBRTMP
PKGSD_LIBRTMP:=		library for RTMP streams
PKGSC_LIBRTMP:=		libs

include $(TOPDIR)/mk/package.mk

$(eval $(call PKG_template,RTMPDUMP,rtmpdump,$(PKG_VERSION)-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))
$(eval $(call PKG_template,LIBRTMP,librtmp,$(PKG_VERSION)-${PKG_RELEASE},${PKG_DEPENDS},${PKGSD_LIBRTMP},${PKGSC_LIBRTMP}))

CONFIG_STYLE:=		manual

rtmpdump-install:
	$(INSTALL_DIR) $(IDIR_RTMPDUMP)/usr/bin
	$(INSTALL_BIN) $(WRKINST)/usr/bin/rtmpdump \
		$(IDIR_RTMPDUMP)/usr/bin

librtmp-install:
	$(INSTALL_DIR) $(IDIR_LIBRTMP)/usr/lib
	$(CP) $(WRKINST)/usr/lib/librtmp*so.* \
		$(IDIR_LIBRTMP)/usr/lib

include ${TOPDIR}/mk/pkg-bottom.mk
