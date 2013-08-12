# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(TOPDIR)/rules.mk

PKG_NAME:=		fribidi
PKG_VERSION:=		0.19.5
PKG_RELEASE:=		1
PKG_MD5SUM:=		925bafb97afee8a2fc2d0470c072a155
PKG_DESCR:=		Unicode Bidirectional Algorithm
PKG_SECTION:=		libs
PKG_URL:=		http://www.fribidi.org/
PKG_SITES:=		http://fribidi.org/download/

DISTFILES:=             ${PKG_NAME}-${PKG_VERSION}.tar.bz2

include $(TOPDIR)/mk/package.mk

$(eval $(call PKG_template,FRIBIDI,fribidi,$(PKG_VERSION)-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))

fribidi-install:
	$(INSTALL_DIR) $(IDIR_FRIBIDI)/usr/lib
	$(CP) $(WRKINST)/usr/lib/libfribidi*.so* \
		$(IDIR_FRIBIDI)/usr/lib

include ${TOPDIR}/mk/pkg-bottom.mk
