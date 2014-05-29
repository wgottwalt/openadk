# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include ${TOPDIR}/rules.mk

PKG_NAME:=		openobex
PKG_VERSION:=		1.5
PKG_RELEASE:=		2
PKG_MD5SUM:=		0d83dc86445a46a1b9750107ba7ab65c
PKG_DESCR:=		implementation of the obex protocol
PKG_SECTION:=		sys/misc
PKG_URL:=		http://dev.zuckschwerdt.org/openobex/wiki/WikiStart
PKG_SITES:=		${MASTER_SITE_KERNEL:=bluetooth/}
PKG_OPTS:=		dev

DISTFILES:=		${PKG_NAME}-${PKG_VERSION}.tar.gz

ifeq ($(ADK_STATIC),y)
PKG_OPTS+=		libonly
endif

include ${TOPDIR}/mk/package.mk

$(eval $(call PKG_template,OPENOBEX,openobex,${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION},${PKG_OPTS}))

openobex-install:
	${INSTALL_DIR} ${IDIR_OPENOBEX}/usr/lib
	${CP} ${WRKINST}/usr/lib/libopenobex.so* ${IDIR_OPENOBEX}/usr/lib/

include ${TOPDIR}/mk/pkg-bottom.mk
