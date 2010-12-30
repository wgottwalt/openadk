# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include ${TOPDIR}/rules.mk

PKG_NAME:=		portmap
PKG_VERSION:=		6.0
PKG_RELEASE:=		1
PKG_MD5SUM:=		ac108ab68bf0f34477f8317791aaf1ff
PKG_DESCR:=		RPC portmapper
PKG_SECTION:=		net/misc
PKG_URL:=		http://neil.brown.name/portmap/
PKG_SITES:=		http://neil.brown.name/portmap/

DISTFILES:=		${PKG_NAME}-${PKG_VERSION}.tgz
WRKDIST=		${WRKDIR}/${PKG_NAME}_${PKG_VERSION}

include ${TOPDIR}/mk/package.mk

$(eval $(call PKG_template,PORTMAP,${PKG_NAME},${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))

CONFIG_STYLE:=          manual
INSTALL_STYLE:=         manual

ifneq ($(strip ${ADK_PACKAGE_PORTMAP_LIBWRAP}),)
MAKE_FLAGS+=		WRAP_LIB='-L${STAGING_TARGET_DIR}/usr/lib -lwrap'
else
MAKE_FLAGS+=		NO_TCP_WRAPPER=1
endif
TCPPFLAGS+=		-DDAEMON_UID=20 -DDAEMON_GID=20
TCFLAGS+=		-fPIC
MAKE_FLAGS+=		${TARGET_CONFIGURE_OPTS} \
			CFLAGS='${TCFLAGS}'

do-install:
	${INSTALL_DIR} ${IDIR_PORTMAP}/usr/sbin
	${INSTALL_BIN} ${WRKBUILD}/portmap ${IDIR_PORTMAP}/usr/sbin/

include ${TOPDIR}/mk/pkg-bottom.mk
