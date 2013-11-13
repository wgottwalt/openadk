# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(TOPDIR)/rules.mk

PKG_NAME:=		gettext-tiny
PKG_VERSION:=		0.0.3
PKG_RELEASE:=		1
PKG_MD5SUM:=		3af6fd8a9042603b61f634b1c6f49e7e
PKG_DESCR:=		Gettext stub and replacement
PKG_SECTION:=		libs
PKG_BUILDDEP:=		gettext-tiny-host
PKG_URL:=		https://github.com/rofl0r/gettext-tiny
PKG_SITES:=		http://ftp.barfooze.de/pub/sabotage/tarballs/
PKG_OPTS:=		dev

DISTFILES:=		${PKG_NAME}-${PKG_VERSION}.tar.bz2

include $(TOPDIR)/mk/host.mk
include $(TOPDIR)/mk/package.mk

$(eval $(call HOST_template,GETTEXT_TINY,gettext-tiny,$(PKG_VERSION)-${PKG_RELEASE}))
$(eval $(call PKG_template,GETTEXT_TINY,gettext-tiny,$(PKG_VERSION)-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION},${PKG_OPTS}))

HOST_STYLE:=		manual
CONFIG_STYLE:=		manual

host-build:
	(cd ${WRKBUILD} && env ${HOST_MAKE_ENV} ${MAKE} -f ${MAKE_FILE} \
		${HOST_MAKE_FLAGS} ${HOST_ALL_TARGET})

gettext-tiny-hostinstall:
	${CP} ${WRKBUILD}/include/libintl.h ${STAGING_HOST_DIR}/usr/include
	${CP} ${WRKBUILD}/libintl.a ${STAGING_HOST_DIR}/usr/lib

include ${TOPDIR}/mk/host-bottom.mk
include ${TOPDIR}/mk/pkg-bottom.mk
