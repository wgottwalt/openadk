# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(ADK_TOPDIR)/rules.mk

PKG_NAME:=		gettext-tiny
PKG_VERSION:=		0.0.4
PKG_RELEASE:=		1
PKG_MD5SUM:=		09f6a74945df5961080234f7851f352c
PKG_DESCR:=		gettext stub and replacement
PKG_SECTION:=		libs/misc
PKG_BUILDDEP:=		gettext-tiny-host
PKG_URL:=		https://github.com/rofl0r/gettext-tiny
PKG_SITES:=		http://ftp.barfooze.de/pub/sabotage/tarballs/
PKG_OPTS:=		dev

DISTFILES:=		${PKG_NAME}-${PKG_VERSION}.tar.bz2

include $(ADK_TOPDIR)/mk/host.mk
include $(ADK_TOPDIR)/mk/package.mk

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
	${CP} ${WRKBUILD}/{msgfmt,xgettext,msgmerge} ${STAGING_HOST_DIR}/usr/bin

include ${ADK_TOPDIR}/mk/host-bottom.mk
include ${ADK_TOPDIR}/mk/pkg-bottom.mk
