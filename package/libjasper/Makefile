# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(ADK_TOPDIR)/rules.mk

PKG_NAME:=		libjasper
PKG_VERSION:=		2.0.10
PKG_RELEASE:=		1
PKG_HASH:=		54d85428e35263642358a11c312d61cbc054170546fae780e11271df5d1502e8
PKG_DESCR:=		implementation of the codec specified in the jpeg-2000 standard
PKG_SECTION:=		libs/image
PKG_BUILDDEP:=		cmake-host
PKG_URL:=		http://www.ece.uvic.ca/~frodo/jasper/
PKG_SITES:=		http://www.ece.uvic.ca/~frodo/jasper/software/
PKG_NEEDS:=		c++
PKG_OPTS:=		dev

DISTFILES:=		jasper-$(PKG_VERSION).tar.gz
WRKDIST=		${WRKDIR}/jasper-$(PKG_VERSION)
WRKBUILD=		$(WRKDIR)/$(PKG_NAME)-obj

include $(ADK_TOPDIR)/mk/package.mk

$(eval $(call PKG_template,LIBJASPER,libjasper,$(PKG_VERSION)-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION},${PKG_OPTS}))

CONFIG_STYLE:=		cmake

libjasper-install:
	$(INSTALL_DIR) $(IDIR_LIBJASPER)/usr/lib
	$(CP) $(WRKINST)/usr/lib/libjasper*.so* \
		$(IDIR_LIBJASPER)/usr/lib

include ${ADK_TOPDIR}/mk/pkg-bottom.mk
