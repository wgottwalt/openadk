# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include ${ADK_TOPDIR}/rules.mk

PKG_NAME:=		openobex
PKG_VERSION:=		1.7.1
PKG_RELEASE:=		1
PKG_HASH:=		3b264665d90901ea4ff720332ffb9b6d1d8f67187463d3a3279caddc7205ea57
PKG_DESCR:=		implementation of the obex protocol
PKG_SECTION:=		sys/misc
PKG_BUILDDEP:=		eudev bluez
PKG_URL:=		http://dev.zuckschwerdt.org/openobex/wiki/WikiStart
PKG_SITES:=		${MASTER_SITE_SOURCEFORGE:=openobex/}
PKG_OPTS:=		dev

DISTFILES:=		${PKG_NAME}-${PKG_VERSION}-Source.tar.gz
WRKDIST=		$(WRKDIR)/${PKG_NAME}-${PKG_VERSION}-Source

include ${ADK_TOPDIR}/mk/package.mk

$(eval $(call PKG_template,OPENOBEX,openobex,${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION},${PKG_OPTS}))

CONFIG_STYLE:=          cmake
CMAKE_FLAGS:=		-DBUILD_DOCUMENTATION=off

openobex-install:
	${INSTALL_DIR} ${IDIR_OPENOBEX}/usr/lib
	${CP} ${WRKINST}/usr/lib/libopenobex.so* ${IDIR_OPENOBEX}/usr/lib/

include ${ADK_TOPDIR}/mk/pkg-bottom.mk
