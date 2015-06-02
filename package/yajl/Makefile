# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(ADK_TOPDIR)/rules.mk

PKG_NAME:=		yajl
PKG_VERSION:=		2.0.1
PKG_RELEASE:=		1
PKG_HASH:=		6bc3737623490e0a1b5f52bd09903c6f8c360f3338079db19895e95bb940a4da
PKG_DESCR:=		small event-driven json parser written in ansi c
PKG_SECTION:=		libs/data
PKG_BUILDDEP:=		cmake-host ruby-host
PKG_URL:=		http://lloyd.github.com/yajl/
PKG_SITES:=		http://distfiles.openadk.org/
PKG_OPTS:=		dev

DISTFILES:=		${PKG_NAME}-${PKG_VERSION}.tar.gz

PKG_NOPARALLEL:=	1

include $(ADK_TOPDIR)/mk/package.mk

$(eval $(call PKG_template,YAJL,yajl,$(PKG_VERSION)-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION},${PKG_OPTS}))

CONFIG_STYLE:=		manual

do-configure:
	(cd ${WRKBUILD} && PATH='${HOST_PATH}' ./configure --prefix /usr)

yajl-install:
	$(INSTALL_DIR) $(IDIR_YAJL)/usr/lib
	$(CP) $(WRKINST)/usr/lib/libyajl*.so* \
		$(IDIR_YAJL)/usr/lib

include ${ADK_TOPDIR}/mk/pkg-bottom.mk
