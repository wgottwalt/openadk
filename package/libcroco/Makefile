# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(TOPDIR)/rules.mk

PKG_NAME:=		libcroco
PKG_VERSION:=		0.6.8
PKG_RELEASE:=		1
PKG_MD5SUM:=		767e73c4174f75b99695d4530fd9bb80
PKG_DESCR:=		css2 parsing and manipulation library
PKG_SECTION:=		libs/misc
PKG_URL:=		https://github.com/GNOME/libcroco
PKG_SITES:=		http://ftp.gnome.org/pub/gnome/sources/libcroco/0.6/
PKG_OPTS:=		dev

DISTFILES:=             ${PKG_NAME}-${PKG_VERSION}.tar.xz

include $(TOPDIR)/mk/host.mk
include $(TOPDIR)/mk/package.mk

$(eval $(call HOST_template,LIBCROCO,libcroco,$(PKG_VERSION)-${PKG_RELEASE}))
$(eval $(call PKG_template,LIBCROCO,libcroco,$(PKG_VERSION)-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION},${PKG_OPTS}))

HOST_STYLE:=		auto

libcroco-install:
	$(INSTALL_DIR) $(IDIR_LIBCROCO)/usr/lib
	$(CP) $(WRKINST)/usr/lib/libcroco*.so* \
		$(IDIR_LIBCROCO)/usr/lib

include ${TOPDIR}/mk/host-bottom.mk
include ${TOPDIR}/mk/pkg-bottom.mk
