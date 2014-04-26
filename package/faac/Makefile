# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(TOPDIR)/rules.mk

PKG_NAME:=		faac
PKG_VERSION:=		1.28
PKG_RELEASE:=		1
PKG_MD5SUM:=		80763728d392c7d789cde25614c878f6
PKG_DESCR:=		AAC encoder
PKG_SECTION:=		libs
PKG_URL:=		http://www.audiocoding.com/faac.html
PKG_SITES:=		${MASTER_SITE_SOURCEFORGE:=faac/}
PKG_LIBNAME:=		libfaac
PKG_OPTS:=		dev

DISTFILES:=		${PKG_NAME}-${PKG_VERSION}.tar.gz

include $(TOPDIR)/mk/package.mk

$(eval $(call PKG_template,LIBFAAC,libfaac,$(PKG_VERSION)-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION},${PKG_OPTS}))

CONFIGURE_ARGS+=	--without-mp4v2

libfaac-install:
	$(INSTALL_DIR) $(IDIR_LIBFAAC)/usr/lib
	$(CP) $(WRKINST)/usr/lib/libfaac*.so* \
		$(IDIR_LIBFAAC)/usr/lib

include ${TOPDIR}/mk/pkg-bottom.mk
