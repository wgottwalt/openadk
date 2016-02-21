# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(ADK_TOPDIR)/rules.mk

PKG_NAME:=		yajl
PKG_VERSION:=		2.1.0
PKG_RELEASE:=		1
PKG_HASH:=		510a13e0be57cd4ba99e60ac806a3635854af51316d3131d3742a90298ccde38
PKG_DESCR:=		small event-driven json parser
PKG_SECTION:=		libs/data
PKG_BUILDDEP:=		cmake-host ruby-host
PKG_URL:=		http://lloyd.github.com/yajl/
PKG_SITES:=		http://github.com/lloyd/yajl/tarball/$(PKG_VERSION)/
PKG_OPTS:=		dev

DISTFILES:=		${PKG_NAME}-${PKG_VERSION}.tar.gz
WRKDIST=		$(WRKDIR)/lloyd-yajl-66cb08c/

include $(ADK_TOPDIR)/mk/package.mk

$(eval $(call PKG_template,YAJL,yajl,$(PKG_VERSION)-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION},${PKG_OPTS}))

CONFIG_STYLE:=		cmake

yajl-install:
	$(INSTALL_DIR) $(IDIR_YAJL)/usr/lib
	$(CP) $(WRKINST)/usr/lib/libyajl*.so* \
		$(IDIR_YAJL)/usr/lib

include ${ADK_TOPDIR}/mk/pkg-bottom.mk
