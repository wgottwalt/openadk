# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include ${TOPDIR}/rules.mk

PKG_NAME:=		libol
PKG_VERSION:=		0.3.18
PKG_RELEASE:=		1
PKG_MD5SUM:=		cbadf4b7ea276dfa85acc38a1cc5ff17
PKG_DESCR:=		Support library for syslog-ng
PKG_SECTION:=		libs
PKG_URL:=		http://www.balabit.com
PKG_SITES:=		http://www.balabit.com/downloads/files/libol/0.3/

include ${TOPDIR}/mk/package.mk

$(eval $(call PKG_template,LIBOL,${PKG_NAME},${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))

post-install:
	${INSTALL_DIR} ${IDIR_LIBOL}/usr/lib
	${CP} ${WRKINST}/usr/lib/libol.so* ${IDIR_LIBOL}/usr/lib/

include ${TOPDIR}/mk/pkg-bottom.mk
