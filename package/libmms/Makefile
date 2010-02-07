# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include ${TOPDIR}/rules.mk

PKG_NAME:=		libmms
PKG_VERSION:=		0.5
PKG_RELEASE:=		1
PKG_MD5SUM:=		cf83053ec891f14e73a04c84d9de08ee
PKG_DESCR:=		common library for parsing mms:// type network streams
PKG_SECTION:=		libs
PKG_URL:=		https://launchpad.net/libmms
PKG_SITES:=		http://launchpad.net/libmms/trunk/0.5/+download/

include ${TOPDIR}/mk/package.mk

$(eval $(call PKG_template,LIBMMS,${PKG_NAME},${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))

post-install:
	${INSTALL_DIR} ${IDIR_LIBMMS}/usr/lib
	${CP} ${WRKINST}/usr/lib/libmms.so* ${IDIR_LIBMMS}/usr/lib/

include ${TOPDIR}/mk/pkg-bottom.mk
