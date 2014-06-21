# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(ADK_TOPDIR)/rules.mk

PKG_NAME:=		fribidi
PKG_VERSION:=		0.19.6
PKG_RELEASE:=		1
PKG_MD5SUM:=		ce93d862344991173dabb609bf93ca1d
PKG_DESCR:=		unicode bidirectional algorithm
PKG_SECTION:=		libs/misc
PKG_URL:=		http://www.fribidi.org/
PKG_SITES:=		http://fribidi.org/download/
PKG_OPTS:=		dev

DISTFILES:=             ${PKG_NAME}-${PKG_VERSION}.tar.bz2

include $(ADK_TOPDIR)/mk/package.mk

$(eval $(call PKG_template,FRIBIDI,fribidi,$(PKG_VERSION)-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION},${PKG_OPTS}))

fribidi-install:
	$(INSTALL_DIR) $(IDIR_FRIBIDI)/usr/lib
	$(CP) $(WRKINST)/usr/lib/libfribidi*.so* \
		$(IDIR_FRIBIDI)/usr/lib

include ${ADK_TOPDIR}/mk/pkg-bottom.mk
