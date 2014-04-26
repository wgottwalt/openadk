# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(TOPDIR)/rules.mk

PKG_NAME:=		yajl
PKG_VERSION:=		2.0.1
PKG_RELEASE:=		1
PKG_MD5SUM:=		c953a53344c0e20a892fc042bbe69744
PKG_DESCR:=		small event-driven JSON parser written in ANSI C
PKG_SECTION:=		libs
PKG_BUILDDEP:=		cmake-host ruby-host
PKG_URL:=		http://lloyd.github.com/yajl/
PKG_SITES:=		http://openadk.org/distfiles/
PKG_OPTS:=		dev

DISTFILES:=		${PKG_NAME}-${PKG_VERSION}.tar.gz

PKG_NOPARALLEL:=	1

include $(TOPDIR)/mk/package.mk

$(eval $(call PKG_template,YAJL,yajl,$(PKG_VERSION)-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION},${PKG_OPTS}))

CONFIG_STYLE:=		manual

do-configure:
	(cd ${WRKBUILD} && PATH='${HOST_PATH}' ./configure --prefix /usr)

yajl-install:
	$(INSTALL_DIR) $(IDIR_YAJL)/usr/lib
	$(CP) $(WRKINST)/usr/lib/libyajl*.so* \
		$(IDIR_YAJL)/usr/lib

include ${TOPDIR}/mk/pkg-bottom.mk
