# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(TOPDIR)/rules.mk

PKG_NAME:=		v4l-utils
PKG_VERSION:=		0.9.3
PKG_RELEASE:=		1
PKG_MD5SUM:=		f4d24bb9f0307345d5a8fc4febcb993d
PKG_DESCR:=		Video4Linux2 utilities
PKG_SECTION:=		multimedia
PKG_BUILDDEP:=		jpeg
PKG_SITES:=		http://linuxtv.org/downloads/v4l-utils/

DISTFILES:=             ${PKG_NAME}-${PKG_VERSION}.tar.bz2

PKG_CFLINE_V4L_UTILS:=  depends on ADK_TARGET_LIB_GLIBC || ADK_TARGET_LIB_EGLIBC
PKG_SUBPKGS:=		V4L_UTILS LIBV4L

include $(TOPDIR)/mk/package.mk

$(eval $(call PKG_template,V4L_UTILS,v4l-utils,$(PKG_VERSION)-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))
$(eval $(call PKG_template,LIBV4L,libv4l,$(PKG_VERSION)-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))

CONFIGURE_ARGS+=	--disable-qv4l2

v4l-utils-install:
	$(INSTALL_DIR) $(IDIR_V4L_UTILS)/usr/bin
	$(INSTALL_BIN) $(WRKINST)/usr/bin/v4l2-ctl \
		$(IDIR_V4L_UTILS)/usr/bin

libv4l-install:
	$(INSTALL_DIR) $(IDIR_LIBV4L)/usr/lib/libv4l
	$(CP) $(WRKINST)/usr/lib/libv4l*so* \
		$(IDIR_LIBV4L)/usr/lib
	$(CP) $(WRKINST)/usr/lib/libv4l/v4l{1compat,2convert}.so \
		$(IDIR_LIBV4L)/usr/lib/libv4l

include ${TOPDIR}/mk/pkg-bottom.mk
