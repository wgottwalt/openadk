# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(ADK_TOPDIR)/rules.mk

PKG_NAME:=		libjson
PKG_VERSION:=		7.6.1
PKG_RELEASE:=		1
PKG_MD5SUM:=		82f3fcbf9f8cf3c4e25e1bdd77d65164
PKG_DESCR:=		json library
PKG_SECTION:=		libs/data
PKG_URL:=		http://sourceforge.net/projects/libjson/
PKG_SITES:=		${MASTER_SITE_SOURCEFORGE:=libjson/}
PKG_OPTS:=		dev

PKG_NOPARALLEL:=	1

DISTFILES:=             ${PKG_NAME}_${PKG_VERSION}.zip
WRKDIST=		${WRKDIR}/${PKG_NAME}

include $(ADK_TOPDIR)/mk/package.mk

$(eval $(call PKG_template,LIBJSON,libjson,$(PKG_VERSION)-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION},${PKG_OPTS}))

MAKE_FILE:=		makefile
FAKE_FLAGS+=		prefix=${WRKINST}/usr
CONFIG_STYLE:=		manual

libjson-install:
	$(INSTALL_DIR) $(IDIR_LIBJSON)/usr/lib
	$(CP) $(WRKINST)/usr/lib/libjson*.so* \
		$(IDIR_LIBJSON)/usr/lib

include ${ADK_TOPDIR}/mk/pkg-bottom.mk
